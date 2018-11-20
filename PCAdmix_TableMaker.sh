#!/bin/bash

Admx_PATH=/home/ebazzicalupo/Admixture # path to the project directory
Data_PATH=/home/ebazzicalupo/Data # path to data directory
ShapeIt=/home/ebazzicalupo/Admixture/ShapeIt/shapeit # path to ShapeIt software
Lenght_PATH=/home/GRUPOS/grupolince/reference_genomes/lynx_pardinus_genome/Length_scaffolds_lp23 # path to scaffold length file
SexChr_PATH=/home/GRUPOS/grupolince/sexual_chr # path to directory with lists of scaffolds with XY chromosomes represented
BCF=/opt/bcftools-1.6/bcftools # path to BCFtools software
REF=/home/GRUPOS/grupolince/reference_genomes/lynx_pardinus_genome/lp23.fa # path to reference genome
GATK=/opt/GATK-3.7/GenomeAnalysisTK.jar # GATK software path
VCF2BEA=/home/ebazzicalupo/Admixture/VCF2Beagle/vcf2beagle.jar # vcf2beagle software path
PCAdmix=/home/ebazzicalupo/Admixture/PCAdmix/PCAdmix3_linux # PCAdmix software path

## Table 1

cd $Admx_PATH/$1

rm $2_*.txt

scaffolds=$(ls -l | grep -o "PCAdmix_lp23.s....." | sed 's/PCAdmix_//g')

echo " - Generating Table 1 for $2 in $1... - "

echo -e "INDIVIDUAL\tSCAFFOLD\tSTART\tEND\tLENGTH\tTOT_WIN\tA_LP_WIN\tB_LP_WIN\tA_PCA_INTRO\tB_PCA_INTRO\tA_WPROP_INTRO\tB_WPROP_INTRO" > $2_Table1.txt

for scaffold in $scaffolds
    do
    
    echo -ne " - ${scaffold} - \r"
    
    INDIVIDUAL=$(echo "$2")
    SCAFFOLD=$(echo "${scaffold}")
    START=$(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f2- | cut -d " " -f1 | head -1 | cut -d ":" -f2 | bc)
	END=$(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f2- | cut -d " " -f20 | tail -1 | cut -d ":" -f2 | bc)
    LENGTH=$(echo "$END-$START" | bc)
    TOT_WIN=$(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | wc -l)
    A_LP_WIN=$(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_A | tr ' ' '\n' | grep -v "$2_A" | grep "1" | wc -l | bc)
    B_LP_WIN=$(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_B | tr ' ' '\n' | grep -v "$2_B" | grep "1" | wc -l | bc)
    A_PCA_INTRO=$(cat PCAdmix_${scaffold}/pcadmix_${scaffold}.ia.txt | grep $2_A | cut -d " " -f3)
    B_PCA_INTRO=$(cat PCAdmix_${scaffold}/pcadmix_${scaffold}.ia.txt | grep $2_B | cut -d " " -f3)
    A_WPROP_INTRO=$(echo "scale=4; $A_LP_WIN/$TOT_WIN" | bc | sed 's/^\./0./')
    B_WPROP_INTRO=$(echo "scale=4; $B_LP_WIN/$TOT_WIN" | bc | sed 's/^\./0./')
    
    echo -e  "$INDIVIDUAL\t$SCAFFOLD\t$START\t$END\t$LENGTH\t$TOT_WIN\t$A_LP_WIN\t$B_LP_WIN\t$A_PCA_INTRO\t$B_PCA_INTRO\t$A_WPROP_INTRO\t$B_WPROP_INTRO" >> $2_Table1.txt
    
done

echo " - Table 1 for $2 in $1 Generated! -"

## Table 2

echo " - Generating Table 2 for $2 in $1... - "

for scaffold in $scaffolds
    do
    
    echo -ne " - ${scaffold} - \r"
	
	nscaf=$(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f1 | grep -o "Window" | wc -l)
		
	paste <(yes "$2" | head -$nscaf) <(yes "${scaffold}" | head -$nscaf) <(paste -d '.' <(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f1 | grep -o "Window") <(seq -f "%03g" 1 $(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | wc -l))) <(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_A | tr ' ' '\n' | grep -v "$2_A") <(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_B | tr ' ' '\n' | grep -v "$2_B") <(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f2- | cut -d " " -f1 | cut -d ":" -f2) <(awk -v FS=" " 'NF>20' PCAdmix_${scaffold}/pcadmix_${scaffold}.markers.txt | cut -f2- | cut -d " " -f20 | cut -d ":" -f2) > PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt
	
done

echo " - concatenating... -"

cat PCAdmix_*/*_$2_Table2.txt > $Admx_PATH/$1/$2_Table2.txt

echo " - Table 2 for $2 in $1 Generated! -"

## Table 3

echo " - Generating Table 3 for $2 in $1... - "

for scaffold in $scaffolds
    
    do
    	echo -ne " - Finding A allele introgressed segments in ${scaffold}... - \r"
    	
		awin=$(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_A | tr ' ' '\n' | grep -v "$2_A" | grep "1" | wc -l)
				
		for n in $(seq 1 $awin)
		
			do
				var=$(yes "Window...._1" | head -$n)
				lvar=$(echo $var)
	  
				cut -f2,3 PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | tr '\t' '_' | tr '\n' ' ' | grep -o -e "Window...._0 $lvar Window...._0" | cut -d ' ' -f2- | rev | cut -d ' ' -f2- | rev | sed -e 's/_1//g' > PCAdmix_${scaffold}/$2_A_${n}

				cut -d ' ' -f1 PCAdmix_${scaffold}/$2_A_${n} > PCAdmix_${scaffold}/$2_A_${n}_starts

				rev PCAdmix_${scaffold}/$2_A_${n} | cut -d ' ' -f1 | rev > PCAdmix_${scaffold}/$2_A_${n}_ends
			
				cat PCAdmix_${scaffold}/$2_A_${n} | tr ' ' '-' | awk -vFS="-" '{print NF, $0}' | tr ' ' '\t' > PCAdmix_${scaffold}/$2_A_${n}_windows
				
				arows=$(cat PCAdmix_${scaffold}/$2_A_${n}_windows | wc -l)
				paste <(yes "$2" | head -$arows) <(yes "${scaffold}" | head -$arows) <(yes "A" | head -$arows) PCAdmix_${scaffold}/$2_A_${n}_windows <(grep -f PCAdmix_${scaffold}/$2_A_${n}_starts PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | cut -f5) <(grep -f PCAdmix_${scaffold}/$2_A_${n}_ends PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | cut -f6) > PCAdmix_${scaffold}/$2_A_${n}_Table3.txt

		done

		echo -ne " - Finding B allele introgressed segments in ${scaffold}... - \r"

		bwin=$(rev PCAdmix_${scaffold}/pcadmix_${scaffold}.vit.txt | cut -d " " -f3- | rev | grep $2_B | tr ' ' '\n' | grep -v "$2_B" | grep "1" | wc -l)

		for n in $(seq 1 $bwin)
		
			do
				var=$(yes "Window...._1" | head -$n)
				lvar=$(echo $var)

				cut -f2,4 PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | tr '\t' '_' | tr '\n' ' ' | grep -o -e "Window...._0 $lvar Window...._0" | cut -d ' ' -f2- | rev | cut -d ' ' -f2- | rev | sed -e 's/_1//g' > PCAdmix_${scaffold}/$2_B_${n}

				cut -d ' ' -f1 PCAdmix_${scaffold}/$2_B_${n} > PCAdmix_${scaffold}/$2_B_${n}_starts

				rev PCAdmix_${scaffold}/$2_B_${n} | cut -d ' ' -f1 | rev > PCAdmix_${scaffold}/$2_B_${n}_ends

				cat PCAdmix_${scaffold}/$2_B_${n} | tr ' ' '-' | awk -vFS="-" '{print NF, $0}' | tr ' ' '\t' > PCAdmix_${scaffold}/$2_B_${n}_windows
		
				brows=$(cat PCAdmix_${scaffold}/$2_B_${n}_windows | wc -l)
				paste <(yes "$2" | head -$brows)  <(yes "${scaffold}" | head -$brows) <(yes "B" | head -$brows) PCAdmix_${scaffold}/$2_B_${n}_windows <(grep -f PCAdmix_${scaffold}/$2_B_${n}_starts PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | cut -f5) <(grep -f PCAdmix_${scaffold}/$2_B_${n}_ends PCAdmix_${scaffold}/pcadmix_${scaffold}_$2_Table2.txt | cut -f6) > PCAdmix_${scaffold}/$2_B_${n}_Table3.txt

		done
			
done

echo " - Introgressed segments identified! - "
echo " - Joining Table3s ... -"
cat PCAdmix_*/$2_A_*_Table3.txt > $2_A_Table3.txt
cat PCAdmix_*/$2_B_*_Table3.txt > $2_B_Table3.txt
cat $2_A_Table3.txt $2_B_Table3.txt | sort -k2,2 -k1,1 -k5,5n | awk 'BEGIN { OFS = "\t" } { $7 = $6 - $5 } 1' > tmp && echo -e "Individual\tScaffold\tAllele\tWindowsNumber\tSegmentWindows\tStart\tEnd\tLength" | cat - tmp > $Admx_PATH/$1/$2_Table3.txt

echo " - Removing Intermediary files ... -"
rm PCAdmix_*/$2_*
rm tmp
echo " - Table 3 for $2 in $1 Generated! -"

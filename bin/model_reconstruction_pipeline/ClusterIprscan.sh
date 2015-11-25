#$ -S /bin/bash
#$ -N CLusterIPRScan
#$ -j y
#$ -cwd
#$ -pe smp 4
#$ -R y
## export PATH=/usr/java/latest/bin/:$PATH

######################################################################  blastp  ##############################################################################

if [ -z "$1" ]; then
   echo "Specify iprscan path";
   exit;

else
   iprscan=$1
fi

######################################################################  blastp  ##############################################################################

if [ -z "$2" ]; then
   echo "Specify input file";
   exit;

else
   inputFile=$2_${SGE_TASK_ID}
fi

######################################################################  blastp  ##############################################################################

if [ -z "$3" ]; then
   echo "Specify output file";
   exit;

else
   outputFile=$3_${SGE_TASK_ID}.xml
fi

####################################################################################################################################################


$iprscan -i $inputFile -o $outputFile -f XML -goterms -iprlookup

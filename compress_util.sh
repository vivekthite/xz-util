#!/bin/bash                       
#set -x #echo on                  
                                  
#remove the space from folder names in current dir 
echo ""
echo "space removal start" 
echo ""
for d in */ ; do 		                
        echo "Original Dir name : $d" 
		newName=`echo $d | tr ' ' '_'`;
		echo "New name after replacing space is : $newName"
		mv "$d" "$newName";	
		echo ""
done 
echo "space removal end" 
echo ""
#Archieved dirs wil be moved to this
processedDir=../processed
rm -rf $processedDir
mkdir $processedDir
echo ""

#Archieve the directories 
echo "Archieving start ..." 
echo ""
for d in */ ; do                  
        echo "Dir is :$d" 
		dirName=$(basename $d)
		echo "Dir base name is : $dirName"
		echo "Archieving dir : $d"
		tar -cvf $dirName.tar "$d" 
		#move the Archieved dirs		
		mv "$d" $processedDir
		echo ""
done
echo "Archieving end ..."
rm -rf $processedDir
echo ""

#compress the tar files 
echo "compressing start ..." 
echo ""
for f in *.tar ; do                  
        echo "compressing file : $f" 
		xz -zkv "$f"
		echo ""
done
echo "compressing end ..."
echo ""

#start moving compressed files
compressDir=../compressed
rm -rf $compressDir
mkdir $compressDir
echo "moving compressed files to $compressDir ..."
echo ""
for f in *.xz ; do
		echo $f			
        mv $f $compressDir
done
echo ""
echo "compressed files moved to : $compressDir"
echo ""

#start moving archieved files
archievedDir=../archieved
rm -rf $archievedDir
mkdir $archievedDir
echo "moving archieved files to $archievedDir ..."
echo ""
for f in *.tar ; do
		echo $f			
        mv $f $archievedDir
done
echo ""
echo "archieved files moved to : $archievedDir"
echo ""                          
# RunSmp

This .bat file creates a run environment for runsmp.exe
which requires '.in' input configuration files each of which
refers to an individual array file, and output file.

It assumes that all the mod2smp_Impact1_CSG_hds_ are in the same folder as itself

##Outputs 
There is one output file type from this bat file. But many versions of this file a produced

1. n 'subsmp%n%.in' files 

## Useage
0. Configure the json file to your requirements. The configuration file for this bat file should be located 
same folder and named config.json
1. Run the batch file by double clicking on RunSmp.bat. It will ask for your output folder.
2. The array files folder can be drag and dropped into the command window 
3. The output folder can be drag and dropped into the command window
4. The contents of the output folder needs to be located in the same folder as mod2smp.exe



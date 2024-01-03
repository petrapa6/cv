#!/bin/bash

# get me vim, we will be using it alot to postprocess the generated json files
if [ -x "$(whereis nvim | awk '{print $2}')" ]; then
  VIM_BIN="$(whereis nvim | awk '{print $2}')"
  HEADLESS="--headless"
elif [ -x "$(whereis vim | awk '{print $2}')" ]; then
  VIM_BIN="$(whereis vim | awk '{print $2}')"
  HEADLESS=""
fi

INPUT_FILE=zotero_export.bib
OUTPUT_FILE=main.bib

cp $INPUT_FILE $OUTPUT_FILE

# Replace \textendash{} and \textemdash{}
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/\\\textendash{}/--/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/\\\textemdash{}/---/g" -c "wqa" -- "$OUTPUT_FILE"

# Remove {} in author
$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/{//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/}//g' -c "wqa" -- "$OUTPUT_FILE"

# Insert {} around author
$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/norm f=wi{$a F,i}' -c "wqa" -- "$OUTPUT_FILE"

# Remove double {{ }} from title
$VIM_BIN $HEADLESS -nEs -c '%g/title.*=/s/{//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/title.*=/s/}//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/title.*=/norm f=wi{$a F,i}' -c "wqa" -- "$OUTPUT_FILE"

# Line deletors
$VIM_BIN $HEADLESS -nEs -c '%g/type =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/doi =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/eprint =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/organization =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/publisher =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/issn =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/address =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/series =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/isbn =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/copyright =/norm dd' -c "wqa" -- "$OUTPUT_FILE"

# $VIM_BIN $HEADLESS -nEs -c '%g/url =/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/onlinelibrary\.wiley\.com/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/doi\.org/norm dd' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/mdpi\.com/norm dd' -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c '%s/ě/e/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/š/s/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/č/c/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/ř/r/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/ž/z/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/ý/y/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/á/a/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/í/i/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/é/e/g' -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c '%s/Ě/E/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Š/S/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Č/C/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Ř/R/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Ž/Z/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Ý/Y/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Á/A/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Í/I/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/É/E/g' -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/\\n //g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/\\v //g' -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/\\n//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/author.*=/s/\\v//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "%g/author.*=/s/\\\'//g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "%g/author.*=/s/\\\\//g" -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c '%g/title.*=/s/\\n//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/title.*=/s/\\v//g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "%g/title.*=/s/\\\'//g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "%g/title.*=/s/\\\\//g" -c "wqa" -- "$OUTPUT_FILE"

# Title field correction
$VIM_BIN $HEADLESS -nEs -c '%g/title = {/norm f{a{$F}i}' -c "wqa" -- "$OUTPUT_FILE" # add {} brackets around title

# Month field correction
$VIM_BIN $HEADLESS -nEs -c '%g/month = {/norm f{x$F}x' -c "wqa" -- "$OUTPUT_FILE" # delete {} brackets around the month
$VIM_BIN $HEADLESS -nEs -c '%g/month = /norm Vu' -c "wqa" -- "$OUTPUT_FILE" # lowercase
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/january/1' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/february/2' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/march/3' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/april/4' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/may/5' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/june/6' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/july/7' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/august/8' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/september/9' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/october/10' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/november/11' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%g/month = /s/december/12' -c "wqa" -- "$OUTPUT_FILE"

# Conference shortening
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*Advances in Neural Information Processing Systems/NIPS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*Third International Conference on 3-D Digital Imaging and Modeling/3DIM/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*Fourth International Conference on 3-D Digital Imaging and Modeling/3DIM/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*Proceedings of the IEEE COnference on Computer Vision and Pattern Recognition/IEEE\/CVF CVPR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*In 2018//g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*in 2018//g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*in 2012//g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*International Journal of Geo-Information/JGI/g" -c "wqa" -- "$OUTPUT_FILE"
# $VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*IEEE VGTC Conference on Point-Based Graphics/IEEE VGTC PBG//g" -c "wqa" -- "$OUTPUT_FILE"

$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*International Conference on Unmanned Aircraft Systems (ICUAS)/ICUAS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*IEEE European Conference on Mobile Robots (ECMR)/IEEE ECMR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*IEEE International Conference on Emerging Technologies and Factory Automation (ETFA)/IEEE ETFA/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE\/RSJ International Conference on Intelligent Robots and Systems (IROS)/IEEE\/RSJ IROS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE\/RSJ International Conference on Intelligent Robots and Systems/IEEE\/RSJ IROS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE Intelligent Transportation Systems Conference/IEEE ITSC/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE\/CVF International Conference on Computer Vision (ICCV)/IEEE\/CVF ICCV/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE\/CVF Conference on Computer Vision and Pattern Recognition (CVPR)/IEEE\/CVF CVPR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE Conference on Computer Vision and Pattern Recognition/IEEE CVPR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*IEEE International Conference on Real-time Computing and Robotics (RCAR)/IEEE RCAR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/Modelling and Simulation for Autonomous Systems (MESAS)/MESAS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/IEEE International Conference on Control, Automation, Robotics and Vision (ICARCV)/IEEE ICARCV/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*International Conference on Advanced Robotics (ICAR)/ICAR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*International Conference on Ubiquitous Robots and Ambient Intelligence (URAI)/URAI/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/2018 ACM\/IEEE 9th International Conference on Cyber-Physical Systems (ICCPS)/ACM\/IEEE ICCPS/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/2016 8th International Conference on Modelling, Identification and Control (ICMIC)/IEEE ICMIC/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/Australasian Conference on Robotics and Automation (ACRA)/ACRA/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/Robotics and Automation Letters (RAL)/Robotics and Automation Letters/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/Robotics and Automation Letters/RA-L/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/Robotics and Automation Magazine/RA-M/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*International Conference on Robotics and Automation (ICRA)/IEEE ICRA/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\w*\s*IEEE International Conference on Robotics and Automation/IEEE ICRA/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/\(IEEE\)*\s*[0-9]*\s*\w*\s*Conference on Decision and Control (CDC)/IEEE CDC/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\(IEEE\)*\s*\w*\s*International Conference on Systems, Man, and Cybernetics (SMC)/IEEE SMC/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\(IEEE\)*\s*\w*\s*International Conference on Methods and Models in Automation and Robotics (MMAR)/IEEE MMAR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\(th\)*\s*\(IEEE\)*\s*\w*\s*International Conference on Automation Science and Engineering (CASE)/IEEE CASE/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\(IEEE\)*\s*\w*\s*International Symposium on Safety, Security and Rescue Robotics (SSRR)/IEEE SSRR/g" -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c "set ignorecase" -c "%s/[0-9]*\s*\(IEEE\)*\s*\w*\s*International Conference on Unmanned Systems (ICUS)/IEEE ICUS/g" -c "wqa" -- "$OUTPUT_FILE"

# Bold name
$VIM_BIN $HEADLESS -nEs -c '%s/Petracek, Pavel/P. Petracek/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Petracek, P\./P. Petracek/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/Pavel Petracek/P. Petracek/g' -c "wqa" -- "$OUTPUT_FILE"
$VIM_BIN $HEADLESS -nEs -c '%s/P\. Petracek/\\textbf\{P. Petracek\}/g' -c "wqa" -- "$OUTPUT_FILE"

# Bold note
$VIM_BIN $HEADLESS -nEs -c '%g/note = {/norm f{a\textbf{$F}i}' -c "wqa" -- "$OUTPUT_FILE"

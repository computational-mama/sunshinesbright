#!/bin/bash
# © 2023 Roel Roscam Abbing, released as AGPLv3
# see https://www.gnu.org/licenses/agpl-3.0.html
# Support your local low-tech magazine: https://solar.lowtechmagazine.com/donate/

now=`date`
baseURL="https://solararchive.cmama.xyz" #the URL of the website e.g. htttps://solar.lowtechmagazine.com/
contentDir="content/" #the directory where your HUGO articles are e.g. /path/to/repo/solar_v2/content/
repoDir="/var/www/sunarchive" #the full path to the repository
outputDir="public/" # the directory where you export the site to.


while getopts f flag
do
    case "${flag}" in
        f) updated="forced rebuild";;
    esac
done

if [[ $updated != "forced rebuild" ]]; then
        echo "Checking for update $now"
        updated=$(sudo git -C $repoDir pull origin main)
fi


if  echo $updated | grep -q "Already up to date";
then 
        echo "Git up to date $now"
else
        echo "Git was not up to date"
        echo $updated
        echo "Rebuilding the site"

        cd $repoDir

        echo "Create virtual env"
        sudo python3 -m venv venv
        sudo venv/bin/pip install Pillow git+https://github.com/hbldh/hitherdither.git bs4

        echo "Dithering new images"
        sudo venv/bin/python utils/dither_images.py -d $contentDir --colorize

        echo "Generating site"
        sudo hugo

        echo "Calculating page sizes"
        sudo venv/bin/python utils/calculate_size.py --directory $outputDir --baseURL $baseURL

        echo "Removing original media from" $outputDir
        sudo venv/bin/python utils/clean_output.py --directory $outputDir

        after=`date`
        echo "Site regeneration started $now"
        echo "Site regeneration finished $after"
fi

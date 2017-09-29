#!/usr/bin/env bash

set -euo pipefail

function checkIfDebianOrRPM {
  
  flavor=null

  if [ -f "/etc/debian_version" ];
  then
    #echo "INFO: Probably a debian version"
    flavor="debian"
  elif [ -f "/etc/redhat-release" ];
  then
    #echo "INFO: Probably a RPM based version"
    flavor="rpm"
  fi 
 
  echo $flavor
}

function installDebianPackages {
 
  sudo apt-get update -y
  #1. Install python 3 if not installed
  which python > /dev/null && ( version=`python -c 'import sys; \
                                                  print(".".join(map(str, sys.version_info[:3])))'
                                      ` \
                                echo "Python version is ${version}" \
                              )\
                           ||
		              ( \
				echo "Python not installed" \
                              )
                           
  
  #2. Install ansible if not installed
  
}

function installRPMPackages() {
  sudo yum update -y
  #1. Install python 3 if not installed
  which python > /dev/null && ( version=`python -c 'import sys; \
                                                  print(".".join(map(str, sys.version_info[:3])))'
                                      ` \
                                echo "Python version is ${version}" \
                              )\
                           ||
		              ( \
				echo "Python not installed" \
                              )
  
  #2. Install ansible if not installed
  
}

function main {

  #Determing the machine type
  platform="$(uname -s)"
  case "${platform}" in
      Linux*)     
        machine=Linux;
        #Check for debian/RPM like ubuntu,debian,mint,centos,redhat,opensuse
        distro=$(checkIfDebianOrRPM)
        echo distro = $distro    
        case "${distro}" in
          rpm)
            echo "Install via yum"
            installRPMPackages
          ;;
          debian)
            echo "Install via apt-get"
            installDebianPackages
          ;;
          *)
            echo "Unknown Linux distro :| "
            exit 1; 
          esac
        ;;
      Darwin*)    
        machine=Mac;;
      CYGWIN*)    
        machine=Cygwin;;
      MINGW*)     
        machine=MinGw;;
      *)          
        machine="UNKNOWN PLATFORM:${machine}"; exit 1;
  esac
  echo Provisioning machine ${machine}

}

main

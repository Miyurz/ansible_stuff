import os

#file to create directory structure

base_path='/inventories'
prod='/production'
stage='/staging'

if not os.path.isdir(base_path):
  os.makedirs(base_path)

def createDir(directory):
  if not os.path.isdir(base_path+directory)
  os.makedirs(base_path+directory)

  if not os.path.isdir(base_path+directory+'/group_vars')
  os.makedirs(base_path+directory+'/group_vars')
 
  if not os.path.isdir(base_path+directory+'/host_vars')
  os.makedirs(base_path+directory+'/host_vars')


#call function createDir

createDir(prod)

createDir(stage)

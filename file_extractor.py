'''
Author - Surya Avala
Email - suryaavala.dev@gmail.com
Date - 3 December 2018
Utility function to recursively get list of particular type of files (absolute path to files) from a given directory 
'''

import os
import sys


def get_files(abs_path, file_ext=''):
    '''
    abs_path = absolute path as string to the directory where we are recursively checkings for files
    file_ext = looking for these particular extension
    '''
    dir_items = os.listdir(abs_path)
    if not dir_items:
        return None
    files = []
    for dir_item in dir_items:
        abs_item_path = os.path.join(abs_path, dir_item)
        if os.path.isfile(abs_item_path) and abs_item_path.endswith(file_ext):
            files.append(abs_item_path)
        elif os.path.isdir(abs_item_path):
            files_inthis = get_files(abs_item_path)
            if files_inthis:
                files.extend(files_inthis)
    return files


if __name__ == '__main__':
    files = get_files(os.getcwd())
    print(files)

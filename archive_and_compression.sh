# Tar stands for “tape archive” and refers to a practice from the earlier days of computing when data was backed up to tapes. Tar is an archiving tool, it creates a single file out of multiple files. This saves network bandwidth, time and processing power while transferring the files. A single file of 100 MB takes a lot less than transferring 100 files of 1 MB because of the file overhead.

#It’s important to remember that extensions are not necessary on Linux and other Unix-based systems. Your Unix system can typically identify files by their headers regardless of extension, but using the common naming scheme can help avoid confusion
"file.tar" # This is a tarball file. It is only an archive and no compression is performed.
"file.tar.gz or file.tgz" # This is the extension of an archive that has been compressed with Gzip.
"file.tar.bz2 or file.tbz" # This is the extension of an archive that has been compressed with Bz2
"file.tar.xz or file.txz, etc" # Tar also features built in support for xz, lzip, and more. These tools primarily use the same compression algorithm, LZMA. The popular 7z that has become fairly common in Windows environments also uses this algorithm. Further differences in the files result from structure and metadata

# -c, –-create: create a new archive
# -v, --verbose: verbosely list files processed
# -f, --file=ARCHIVE: use archive file or device ARCHIVE. you use it for tar file name (for both creating or extracting), allows users to specify the name of the new archive
# -z, --gzip, --gunzip, --ungzip: filter the archive through gzip
# -j, --bzip2: filter the archive through bzip2
# -t, --list: list the contents of an archive
# -r, --append: append files to the end of an archive
# -u, --update: only append files newer than copy in archive
# -x, --extract, --get: extract files from an archive
# -C, --directory=DIR: change to directory DIR
# -d, –-diff, -–compare: find differences between archive and file system

# Create a tarball: Archiving is the act of storing multiple files as one file. "Tarball" is the common term used for a tar file. Compression will not be applied so the file will occupy at least as much space as the files in the source_directory. By default, directories are archived recursively, unless the --no-recursion option is given
tar -cf ./archive.tar file1.txt file2.txt # Create archive.tar from file1.txt and file2.txt
tar -cvf ./new_tarball_file.tar ./source_directory # cvf (create, verbose, file-archive) it creates a new tar file named "new_tarball_file.tar" from all the files in "source_directory". The tarball will have the same directory structure as the source_directory.
# --no-recursion: Avoid descending automatically in directories
tar -cf file.tar --no-recursion source_directory
tar -cf file.tar --no-recursion * # containing all the files in the current working directory
tar -cf file.tar --no-recursion source_directory/* # containing all the files in the source_directory
tar -cf file.tar --no-recursion * .[^.]* # all the files in the current directory including the hidden files (files starting with a dot)
tar -cf file.tar --no-recursion .??* # hidden files (files starting with a dot) and files with two dots (..filename)
tar -cf file.tar --no-recursion .[!.]* ..?* # hidden files (files starting with a dot) and files with two dots (..filename)
# Usually, when you use options with a Linux command, you add hyphen (-) before the options. The hyphen before options is not mandatory and is best avoided.
tar fc ./archive.tar file1.txt file2.txt
tar fvc ./new_tarball_file.tar source_directory
tar cfv new_tarball_file.tar ./source_directory
tar fzcv new_tarball_file.tar.gz source_directory
# If you use hyphen before the options, you should always keep the "f" at the end of the options, If you use tar -cvfz, the "z" becomes an argument for option "f". This is why it is a good practice to use the option "f" at the end of all other options so that even if you use hyphen out of habit, it won’t create a problem
tar -cvzf ./new_gzip_file.tar.gz source_directory
tar cvzf new_gzip_file.tar.gz ./source_directory
# to remove files from disk after adding them to the tarball
tar cf file.tar --remove-file file.txt
# While tar itself cannot compress files, you can use one of the common compression algorithms to compress the files while creating a tarball. Compression is the act of shrinking a larger file or files
tar cvzf ./new_gzip_file.tar.gz source_directory # cvzf (create, verbose, g-zip, file-archive): it creates a new tar file named "new_tarball_file.tar.gz" from all the files in "source_directory". It uses gzip compression (with option z) while creating the tarball
tar cvjf new_bz2_file.tar.bz2 ./source_directory # cvjf (create, verbose, bz2 type, file-archive).You just need to change the option z (gzip) to j (bz2)
# exclude the undesired files while creating a tarball
tar cf ./file.tar --exclude="./file.txt" ./source_directory
tar cf file.tar --exclude="*.txt" source_directory
tar cf file.tar --exclude="./file1.txt" --exclude="./file2.txt" source_directory
# to use a text file containing the names of files and directories that I want to exclude.
cat list_of_files.txt
"path/to/exclude_file1.txt
path/to/exclude_file2.txt"
tar cf ./file.tar --exclude-from="list_of_files.txt" source_directory
# You can use the -t or --list option (instead of -c) to view the contents of an archive file. This works the same whether the file is compressed or not. It will list the actual file size, not the compressed size.
tar tvf file.tar
tar tf ./file.tar
tar tf file.tar --wildcards *.py
tar tf file.tar directory/structure/of/tarball/file1.txt directory/structure/of/tarball/file2.txt
# You can append files to a tarball archive using -r or --append. You cannot add files to a compressed archive without extracting them first using the tar command.
tar rf ./existent_tarball.tar new_source_directory
# --delete: Delete  from  the tarball. This option does not operate on compressed archives, remember to follow the directory structure of the tarball to pick the specific item we want to delete
tar f existent_tarball.tar --delete file.txt
# You can also append using the -u option for update. Append files which are newer than the corresponding copy in the archive, newer files don't replace their old archive copies, but instead are appended to the end of archive. The resulting archive can thus contain several members of the same name, corresponding to various versions of the same file.
tar uf existent_tarball.tar ./new_source_directory

# Extract a tarball, by default, the contents of a tarball are extracted in the current working directory
tar xf ./file.tar # xf (extract, file-archive)
# if the tarball is compressed with any of the compressing algorithms we can add the corresponding option, but this is optional as we can do it with "-x" only
tar xzf ./file.tar.gz
tar xf ./file.tar.gz

tar xjf ./file.tar.bz2
tar xf ./file.tar.bz2
# You can extract a tarball to a specific directory, The destination directory must exist
tar xf ./file.tar -C destination_directory
tar Cxf destination_directory ./file.tar
# extracting a single file or directory out of a tarball: remember to follow the directory structure of the tarball to pick the specific item we want to extract
tar -C destination_directory -xf file.tar directory/structure/of/tarball/file.txt
tar Cxf destination_directory file.tar directory/structure/of/tarball/file.txt
tar -xf ../file.tar directory/structure/of/tarball/file1.txt directory/structure/of/tarball/file2.txt
tar xf ../file.tar directory/structure/of/tarball/directory
tar xf ../file.tar --wildcards "*.txt"
# exclude the undesired files while extracting a tarball
tar xf file.tar --exclude="file.txt"
tar xf file.tar --exclude="*.js"
tar xf file.tar --exclude="file.py" --exclude="file.html"
# Overwrite existing files when extracting, this is the default
tar xf file.tar --overwrite
# -k, --keep-old-files: Don't replace existing files when extracting
tar xf file.tar -k
tar xkf file.tar
tar xf file.tar --keep-old-files
# --keep-newer-files: Don't replace existing files that are newer than their archive copies.
tar xf file.tar --keep-newer-files
# --one-top-level[=DIR]: Extract all files into DIR if DIR doesn't exist, it will be created, or, if used without argument, extract into a subdirectory named by the base name  of the archive (minus standard compression suffixes recognizable by --auto-compress).
tar xf file.tar --one-top-level=destination_directory
tar xf file.tar --one-top-level
# --strip-components=NUMBER: We can strip the absolute path while performing the tar extract if we provide a numerical value to --strip-components, this number represents the number of paths you want to strip while performing the extract
tar xf file.tar --strip-components=2
tar xf file.tar --strip-components=1 --exclude=directory1

# we can break the tar archive file into small blocks, each of a given size. we have two ways of doing this. 1-using -L flag. 2-using the split utility.

# -L, --tape-length=N: Change tape after writing Nx1024 bytes. This option implies -M.
tar cf file.tar source_directory -L 2048 # size is expressed in Kilobytes
tar cf file.tar source_directory -L2048
# If N is followed by a size suffix, the suffix specifies the multiplicative factor to be used instead of 1024.
tar cf file.tar -L2m source_directory
tar cf file.tar source_directory -L 3k
tar -L2G -cf file.tar source_directory
# c  Bytes     SIZE
# w  Words     SIZE x 2
# b  Blocks    SIZE x 512
# B  Kilobytes SIZE x 1024
# K  Kilobytes SIZE x 1024
# k  Kilobytes SIZE x 1024
# M  Megabytes SIZE x 1024^2
# G  Gigabytes SIZE x 1024^3
# T  Terabytes SIZE x 1024^4
# P  Petabytes SIZE x 1024^5

# -M, --multi-volume: Create/list/extract multi-volume archive.
tar tf multi_volume_file.tar -M
tar -M -tf multi_volume_file.tar
tar tMf multi_volume_file.tar

tar xf multi_volume_file.tar -M
tar -M -xf multi_volume_file.tar
tar xMf multi_volume_file.tar

tar xMf multi_volume_file.tar -C destination_directory
tar CxMf destination_directory multi_volume_file.tar
# split: split a file into pieces, Output pieces of a file to prefixaa, prefixab, etc. By default, split command creates new files for each 1000 lines. If no prefix is specified, it will use ‘x’. The letters that follow enumerate the files therefore xaa comes first, then xab, and so on.
split file.tar
wc -l xaa xab xac # You can use wc to quickly check the line counts after splitting.
# we can customize the prefix of the output
split file.tar custom_prefix
# -b, --bytes=SIZE: create files of a specific size. The  SIZE argument is an integer and optional unit (example: 10k is 10*1024).  Units are k,m,g,t,p,e,z,y (powers of 1024) or kB,mB,... (powers of 1000).  Binary prefixes can be used, too: KiB=K, MiB=M, and so on.
split -b 10k file.tar
split -b 3m file.tar custom_prefix
split file.tar custom_prefix -d -b 8KB
wc -c xaa xab xac # You can use wc to quickly check the line counts after splitting.
# -l, --lines=NUMBER: you can specify how many lines you want in each of the new files
split -l 5 file.tar
split file.tar -l 10
# The -n option makes splitting into a designated number of pieces or chunks easy. You can assign how many files you want by adding an integer value after -n.
split file.tar -n 7
split -n 7 file.tar
# If we want to split files into roughly the same size, but preserve the line structure, we can use -C to specify a maximum size. Then the program will automatically split the files based on complete lines
split file.tar custom_prefix -d -C 5KB
split -dC5KB file.tar custom_prefix
# -a, --suffix-length=N: Split features a default suffix length of 2 [aa, ab, etc.]. This will change automatically as the number of files increases, the option -a allows us to specify the length of the suffix
split -a 3 file.tar
split file.tar custom_prefix -a 5
# --additional-suffix=SUFFIX: append an additional SUFFIX to file names
split --additional-suffix=custom_suffix file.tar
split --additional-suffix=custom_suffix file.tar custom_prefix
split -b 10k file.tar custom_prefix --additional-suffix=custom_suffix
# -d: use numeric suffixes starting at 0, not alphabetic
split -d file.tar
split file.tar custom_prefix -a 5 -d
split file.tar custom_prefix -da 5
split -db 8KB file.tar
split -b 8KB -d file.tar
# -x: use hex suffixes starting at 0, not alphabetic
split -x file.tar
split -b 1000 -x file.tar
split -xb 1000 file.tar
split file.tar custom_prefix -x -n50 -a6
split -xn50 -a6 file.tar custom_prefix
# we can demonstrate what is happening by running the command with the verbose option
split ./file.tar --verbose
split -l 8 file.tar --verbose
split -b 5 --verbose file.tar
split --verbose -l 8 file.tar
# You can use cat command to rejoin those files and create a replica of the complete document, the recreated file is the same size as the original, the formatting (including the number of lines) is also preserved in the file created. The cat command is short for concatenate which is just a fancy word that means “join items together”.
cat default_prefix* > new_concatenated_file.cpp
cat custom_prefix* > new_concatenated_file.txt
cat x* > recovered_tarball.tar # Since all of the files begin with the letter ‘x’(if we choose the default prefix), the asterisk will apply the command to any files that begin with that letter
# compress and split: if we don't specify an archive name and simply use a - sign, it sends the tar output to stdout which is then interpreted by the split command
tar cf - source_directory | split -b10k - custom_prefix
# join and extract
cat custom_prefix* | tar xf -
cat custom_prefixa? | tar tf -
cat custom_prefix0? | tar tf -
cat custom_prefixa* | tar Cxf destination_directory -
cat custom_prefix* | tar xf - -C destination_directory

# create zip files
zip file.zip *.cpp *.js ./file1.txt
zip ./file.zip ./source_directory
zip file.zip * # containing all the files in the current working directory
zip file.zip source_directory/* # containing all the files in the source_directory
zip file.zip * .[^.]* # all the files in the current directory including the hidden files (files starting with a dot)
zip hidden.zip .[^.]* .??* # hidden files (files starting with a dot) and files with two dots (..filename)
zip hidden.zip .[!.]* ..?* # hidden files (files starting with a dot) and files with two dots (..filename)

# By default, the zip command prints the names of the files added to the archive and the compression method, to suppress the output of the zip command, use the -q or --quiet option
zip -q new_archive.zip source_directory
zip --quiet new_archive.zip source_directory
# To display the progress output in terms of the number of bytes to be archived, we can pass the flag -db, the zip command precedes the progress output with a square bracket containing two numbers. The number on the left represents the number of bytes that have been archived, while the number on the right shows the number of bytes left to be archived.
zip -db file.zip source_directory
# we can display the progress in terms of files and directory counts using option flag -dc, the number on the left shows the number of files that have been archived thus far, whereas the number on the right shows the number of files waiting to be archived
zip -dc file.zip source_directory
# If the archive name doesn’t end with ".zip", the extension is added automatically unless the archive name contains a dot "."
zip new_archive source_directory
zip new_archive.zip source_directory
zip new_archive. source_directory
# to create a zip archive of a directory including the content of subdirectories. The -r or --recurse-paths option allows you to traverse the whole directory structure recursively
zip -r ./file.zip source_directory
zip --recurse-paths ./file.zip source_directory
zip -r file.zip directory1 directory2 file1.txt file2.txt # You can also add multiple files and directories in the same archive
# -j , --junk-paths: Store just the name of a saved file (junk the path), and do not store directory names. By default, zip will store the full path (relative to the current directory).
zip -j file.zip source_directory/*
zip -rj file.zip source_directory

# The default compression method of Zip is "deflate". If the zip utility determines that a file cannot be compressed, it simply stores the file in the archive without compressing it using the "store" method. In most Linux distributions, the zip utility also supports the bzip2 compression method.

# To specify a compression method, use the -Z option
zip -r -Z bzip2 file.zip source_directory
zip -rZ bzip2 file.zip source_directory
# The zip command allows you to specify a compression level using a number prefixed with a dash from 0 to 9. The default compression level is -6. When using -0, all files will be stored without compression. -9 will force the zip command to use an optimal compression for all files. The higher the compression level, the more CPU-intensive the zip process is, and it will take more time to complete
zip -9 -r file.zip source_directory
zip -0 file.zip *.mp3 # containing all MP3 files in the current directory without compressing the files

# Creating a Password Protected ZIP file: If you have sensitive information that needs to be stored in the archive, you can encrypt it using the -e or --encrypt option, the command will be prompted to enter and verify the archive password. We can still list the content of an encrypted archive using tools like zipinfo and unzip without knowing the password
zip -e  file.zip source_directory
zip --encrypt  file.zip source_directory
# we can also set a password with the -P or --password flag but THIS IS INSECURE! your password can be seen by others and it'll be stored in your command history. We should always prefer the -e option
zip --password pass_word file.zip source_directory
zip -P pass_word file.zip source_directory
# add a password to zip file using the zipcloak command. Pass the name of the zip file on the command line. You will be prompted for a password
zipcloak file.zip
# You can create a split Zip file using the -s option followed by a specified size. The multiplier can be k (kilobytes), m (megabytes), g (gigabytes), or t (terabytes). The command will keep creating new archives in a set after it reaches the specified size limit. 64k is the minimum split size, numbers without multipliers default to megabytes
zip -s 64k -r file.zip source_directory
# we can combine multi-part (split) archives into a combined single-file archive using split size of 0 or negating the -s option. We have to pass the last block of the split archives (the one with the .zip suffix) to the command, not the ones with .z01, .z02, etc
zip -s- split.zip -O single.zip
zip -s 0 split.zip --out single.zip
# zipsplit: split the original zip file into a set of smaller zip files
zipsplit file.zip
# -n size Make zip files no larger than "size", the size is expressed in bytes (default = 36000). The size that you choose cannot be smaller than the size of any of the files in the zip file
zipsplit -n size_number file.zip
zipsplit -n 1000 file.zip

# Though  zip  does not update split archives, zip provides the option -O (--output-file or --out) to allow split archives to be updated and saved in a new archive
zip inarchive.zip file1.cpp file2.txt --out outarchive.zip

# split archives are not just archives split in to pieces, as the offsets of entries are based on the start of each split. Concatenating the pieces together will invalidate these offsets, but  unzip  can  usually  deal with it. zip will usually refuse to process such a spliced archive unless the -FF fix option is used to fix the offsets.
# Multi-part  archives are not yet supported for all versions of unzip command, except in conjunction with zip.  (All parts must be concatenated together in order, and then "zip -FF" must be performed on the concatenated archive  in  order to "fix" it.

# -F, --fix: Fix the zip archive. The -F option can be used if some portions of the archive are missing, but requires a reasonably intact  central  directory.  The input archive is scanned as usual, but zip will ignore some problems.  The resulting archive should be valid, but any inconsistent entries will be left out. The single -F is more reliable if the archive is not too much damaged, so try that option first. To fix a damaged archive file.zip, it tries to read the entries normally, copying good entries to the new archive
zip -F damaged_file.zip --out fixed_file.zip
# -FF, --fixfix: When doubled as in -FF, the archive is scanned from the beginning and zip scans for special  signatures  to  identify the limits between the archive members. If the archive is too damaged or if some entries you know are in the archive are missed or the end has been truncated, you must use -FF. 
zip -FF damaged_file.zip --out fixed_file.zip
# The -F option more reliably fixes archives with minor damage and the -FF option is needed to fix archives where -F might have been sufficient before.The -FF option may create an inconsistent archive. Depending on what is damaged, you can then use the -F option to fix that archive. A split archive with missing split files can be fixed using -F if you have the last split of the  archive (the .zip file). If this file is missing, you must use -FF to fix the archive, which will prompt you for the splits you have.

# To delete some entries in an archive without unzipping, we can pass the flag -d to the zip command
zip -d file.zip file_to_delete.txt
# append additional entries to an existing archive using the -g flag. If the specified archive.zip file doesn’t already exist, the zip command will create it.
zip -g existing_archive.zip file1.txt directory1
# The zip command allows us to construct filters to include or exclude files. Furthermore, these filters are defined with the glob pattern. Additionally, we can use these filters in either creation, deletion, or freshen mode.
# Using the flag -i, we can create an inclusion filter. When we define an inclusion filter, zip command will only consider files that match the filter pattern
zip -r file.zip source_directory -i "*.txt"
zip -r file.zip source_directory -i *.html *.cpp
# To create an exclusion filter, we can use the flag -x followed by a glob pattern. With the exclusion filter, zip will exclude files that match the pattern
zip -r file.zip source_directory -x "*.txt"
zip -r file.zip source_directory -x *.html *.cpp
# With option -m, the zip command will move the files and directory into the archive. In other words, the files and folders that have been archived will be removed
zip -m archive.zip file.txt
# The zip command also supports freshen mode through the flag -f. In this mode, the zip command will not add new files into an archive. Instead, it will only update the files within the archive to the latest version and leave out the rest of the files within the source_directory
zip -r -f file.zip source_directory
# Update existing entries in the zip archive only if it has been modified more recently than the version already in the zip archive and add new files with the -u or --update option.  If the archive does not exist it will issue a warning and then create a new archive.
zip -u -r existent_archive.zip source_directory
zip -u existent_archive.zip file1.txt file2.txt
zip -u existent_archive.zip # the -u option with no input file arguments acts like the -f (freshen) option

# unzip: If you use it to extract a zip file without any option, it will extract all the files in the current working directory. Zip files do not support Linux-style ownership information. The extracted files are owned by the user that runs the command. To preserve the file ownership and permissions, use the tar command. To extract split zip files first we need to convert them to a single zip file with the zip command and -s -O flags
unzip ./file.zip
# You can specify the target directory where you want to extract the files, if the target directory doesn’t exist, it will be created. You cannot create nested directories in this manner though.
unzip -d destination_directory file.zip
unzip file.zip -d destination_directory # Do note that you can also put the target directory at the end but not all options can be added at the end
# -j: junk paths. The archive's directory structure is not recreated; all files are deposited in the  extraction directory (by default, the current one).
unzip -j file.zip
unzip -j file.zip -d destination_directory
# You can use the -l option and it will show the content of the zip file, with this flag, the command does not extract the archive and, instead, only lists its content. It also shows the timestamp of the files and the actual size of the individual files in bytes.
unzip -l file.zip
# you can get more information like the compressed size, compression ratio by using the verbose mode with -v option. The CRC-32 in the output is the cyclic redundancy check. Again this will not extract the archive.
unzip -v file.zip
# zipinfo: list detailed information about a zip archive. From left to right the output shows The file permissions, the version of the tool used to create the zip file, the original file size, a file descriptor, the method of compression, the data and time stamp, the name of the file and any directory.
# The file descriptor is made up of two characters. The first character will be a "t" or a "b" to indicate a text or binary file. If it is a capital letter the file is encrypted. The second character may be one of four characters. This character represents what type of meta-data is included for this file: none, an extended local header, an "extra field", or both. "-" If neither exists, "l" if there is an extended local header but no extra field "x" if there is no extended local header but there is an extra field, "X" if there is an extended local header and there is an extra field
zipinfo file.zip
# zipdetails show you a lot of information regarding the zip file, the information will include filenames even if the zip file is password protected. This type of information is stored within the zip file as meta-data and is not part of the encrypted data.
zipdetails file.zip
# The zipgrep command allows you to search inside the content of the files within a zip file for a specific pattern
zipgrep string_pattern file.zip
# If a zip file has been created with a password, unzip will prompt you for the password. If you do not provide the correct password, unzip will not extract the files. If you don't care about your password being seen by others, nor about it being stored in your command history, you also can provide the password on the command line with the -P (password) option
unzip -P pass_word file.zip
# extracting a single file or directory out of a zipfile: remember to follow the directory structure of the zipfile to pick the specific item we want to extract
unzip ./file.zip directory/structure/of/zipfile/file1.txt
unzip file.zip directory/structure/of/zipfile/file1.txt directory/structure/of/zipfile/directory1/*
unzip file.zip *.txt
# You can also exclude certain files or certain type of files from being extracted with the -x flag
unzip file.zip -x ./file.txt
unzip ./file.zip -x *.java
unzip file.zip -x directory/structure/of/zipfile/file1.txt directory/structure/of/zipfile/directory1/*
unzip -d destination_directory file.zip -x file1.txt file2.txt
# Overwrite all the files without prompting: If there are already files with the same name in the directory where you are extracting the files, you’ll be prompted for each such files. You can force overwrite all the files with option -o
unzip -o file.zip
unzip -o -d destination_directory file.zip
unzip -od destination_directory file.zip
# Do not overwrite any files: If you don’t want any existing file to be overwritten by newly extracted files, use the -n option (stands for never overwrite)
unzip -n file.zip
unzip -n -d destination_directory file.zip
unzip -nd destination_directory file.zip
# -u: this flag is for update, if a file in the destination_directory has an older timestamp than the one in the archive we will be prompted to overwrite that file and if a file doesn’t exist, it will be created. Only those files in the archive that have newer timestamp than the existing files in the destination_directory or doesn't exist at all in the destination_directory will be extracted.
unzip -u file.zip
unzip -u -d destination_directory file.zip
unzip -ud destination_directory file.zip
# The option -f will update the existing files if they have older timestamp but it won’t create any new files even if they don’ exist
unzip -f file.zip
unzip -f -d destination_directory file.zip
unzip -fd destination_directory file.zip
# By default, unzip prints the names of the files it's extracting or testing, the extraction methods, any file or zipfile comments that may be stored in the archive, and possibly a  summary when finished with each archive, to suppress the output of the unzip command, use the -q to supress some messages or -qq to supress all messages.
unzip -q file.zip
unzip -qq file.zip
unzip -q -d destination_directory file.zip
unzip -qq -d destination_directory file.zip
unzip -qd destination_directory file.zip
unzip -qqd destination_directory file.zip

# another compression related commands
gzip -9r source_directory
gzip -d file.gz
gunzip file.gz
# list the content without decompression
zless file.gz 
gunzip -c file.txt.gz
zcat file.txt.gz
gunzip -c file.txt.gz | less
zcat file.txt.gz | less
# keeps the original file intact
gzip -c file.txt > new_file.gz

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# https://superuser.com/questions/62141/how-to-move-all-files-from-current-directory-to-upper-directory

# https://linuxhandbook.com/unzip-command/

# https://linuxhandbook.com/basic-tar-commands/

# https://linuxhandbook.com/tar-exclude-files/

# https://linuxhandbook.com/split-command/

# https://linuxhandbook.com/csplit-command/

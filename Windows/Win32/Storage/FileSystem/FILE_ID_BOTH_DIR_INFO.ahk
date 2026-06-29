#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about files in the specified directory.
 * @remarks
 * No specific access rights are required to query this information.
 * 
 * File reference numbers, also called file IDs, are guaranteed to be unique only within a static file system. 
 *     They are not guaranteed to be unique over time, because file systems are free to reuse them. Nor are they 
 *     guaranteed to remain constant. For example, the FAT file system generates the file reference number for a file 
 *     from the byte offset of the file's directory entry record (DIRENT) on the disk. Defragmentation can change this 
 *     byte offset. Thus a FAT file reference number can change over time.
 * 
 * All dates and times are in absolute system-time format. Absolute system time is the number of 100-nanosecond 
 *     intervals since the start of the year 1601.
 * 
 * This <b>FILE_ID_BOTH_DIR_INFO</b> structure must be 
 *     aligned on a <b>DWORDLONG</b> (8-byte) boundary. If a buffer contains two or more of these structures, the 
 *     <b>NextEntryOffset</b> value in each entry, except the last, falls on an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_both_dir_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_ID_BOTH_DIR_INFO {
    #StructPack 8

    /**
     * The offset for the next <b>FILE_ID_BOTH_DIR_INFO</b> 
     *       structure that is returned. Contains zero (0) if no other entries follow this one.
     */
    NextEntryOffset : UInt32

    /**
     * The byte offset of the file within the parent directory. This member is undefined for file systems, such as 
     *       NTFS, in which the position of a file within the parent directory is not fixed and can be changed at any time to 
     *       maintain sort order.
     */
    FileIndex : UInt32

    /**
     * The time that the file was created.
     */
    CreationTime : Int64

    /**
     * The time that the file was last accessed.
     */
    LastAccessTime : Int64

    /**
     * The time that the file was last written to.
     */
    LastWriteTime : Int64

    /**
     * The time that the file was last changed.
     */
    ChangeTime : Int64

    /**
     * The absolute new end-of-file position as a byte offset from the start of the file to the end of the file. 
     *       Because this value is zero-based, it actually refers to the first free byte in the file. In other words, 
     *       <b>EndOfFile</b> is the offset to the byte that immediately follows the last valid byte in 
     *       the file.
     */
    EndOfFile : Int64

    /**
     * The number of bytes that are allocated for the file. This value is usually a multiple of the sector or 
     *       cluster size of the underlying physical device.
     */
    AllocationSize : Int64

    /**
     * The file attributes. This member can be any valid combination of the following attributes:
     */
    FileAttributes : UInt32

    /**
     * The length of the file name.
     */
    FileNameLength : UInt32

    /**
     * The size of the extended attributes for the file.
     */
    EaSize : UInt32

    /**
     * The length of <b>ShortName</b>.
     */
    ShortNameLength : Int8

    /**
     * The short 8.3 file naming convention (for example, 
     *       "FILENAME.TXT") name of the file.
     */
    ShortName : WCHAR[12]

    /**
     * The file ID.
     */
    FileId : Int64

    /**
     * The first character of the file name string. This is followed in memory by the remainder of the 
     *       string.
     */
    FileName : WCHAR[1]

}

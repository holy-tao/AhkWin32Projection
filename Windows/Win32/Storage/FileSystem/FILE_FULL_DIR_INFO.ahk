#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains directory information for a file. (FILE_FULL_DIR_INFO)
 * @remarks
 * The <b>FILE_FULL_DIR_INFO</b> structure is a subset of the 
 *     information in the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_both_dir_info">FILE_ID_BOTH_DIR_INFO</a> structure. 
 *     If the additional information is not needed then the operation will be faster as it comes from the directory 
 *     entry; <b>FILE_ID_BOTH_DIR_INFO</b> contains information 
 *     from both the directory entry and the Master File Table (MFT).
 * 
 * No specific access rights are required to 
 *     query this information.
 * 
 * All dates and times are in absolute system-time format. Absolute system time is the number of 100-nanosecond 
 *     intervals since the start of the year 1601.
 * 
 * This <b>FILE_FULL_DIR_INFO</b> structure must be aligned 
 *     on a <b>LONGLONG</b> (8-byte) boundary. If a buffer contains two or more of these 
 *     structures, the <b>NextEntryOffset</b> value in each entry, except the last, falls on an 
 *     8-byte boundary.
 * 
 * To compile an application that uses this structure, define the <b>_WIN32_WINNT</b> macro 
 *     as 0x0600 or later. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_full_dir_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_FULL_DIR_INFO {
    #StructPack 8

    /**
     * The offset for the next <b>FILE_FULL_DIR_INFO</b> 
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
     * The absolute new end-of-file position as a byte offset from the start of the file to the end of the default 
     *       data stream of the file. Because this value is zero-based, it actually refers to the first free byte in the 
     *       file. In other words, <b>EndOfFile</b> is the offset to the byte that immediately follows 
     *       the last valid byte in the file.
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
     * The first character of the file name string. This is followed in memory by the remainder of the 
     *       string.
     */
    FileName : WCHAR[1]

}

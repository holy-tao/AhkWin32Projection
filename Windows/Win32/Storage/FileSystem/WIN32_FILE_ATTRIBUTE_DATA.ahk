#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains attribute information for a file or directory.
 * @remarks
 * Not all file systems can record creation and last access time, and not all file systems record them in the 
 *     same manner. For example, on the FAT file system, create time has a resolution of 10 milliseconds, write time has 
 *     a resolution of 2 seconds, and access time has a resolution of 1 day. On the NTFS file 
 *     system, access time has a resolution of 1 hour. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-win32_file_attribute_data
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIN32_FILE_ATTRIBUTE_DATA {
    #StructPack 4

    /**
     * The file system attribute information for a file or directory.
     *       
     * 
     * For possible values and their descriptions, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     */
    dwFileAttributes : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies when the file or 
     *       directory is created.
     *       
     * 
     * If the underlying file system does not support creation time, this member is zero.
     */
    ftCreationTime : FILETIME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     *       
     * 
     * For a file, the structure specifies when the file is last read from or written to.
     * 
     * For a directory, the structure specifies when the directory is created.
     * 
     * For both files and directories, the specified date is correct, but the time of day is always set to midnight. 
     *        If the underlying file system does not support last access time, this member is zero.
     */
    ftLastAccessTime : FILETIME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     *       
     * 
     * For a file, the structure specifies when the file is last written to.
     * 
     * For a directory, the structure specifies when the directory is created.
     * 
     * If the underlying file system does not support last write time, this member is zero.
     */
    ftLastWriteTime : FILETIME

    /**
     * The high-order 
     *      <b>DWORD</b> of the file size.
     *       
     * 
     * This member does not have a meaning for directories.
     */
    nFileSizeHigh : UInt32

    /**
     * The low-order <b>DWORD</b> of the file size.
     *       
     * 
     * This member does not have a meaning for directories.
     */
    nFileSizeLow : UInt32

}

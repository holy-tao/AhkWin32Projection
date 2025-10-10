#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information that the GetFileInformationByHandle function retrieves.
 * @remarks
 * 
  * The identifier that is stored in the <b>nFileIndexHigh</b> and 
  *     <b>nFileIndexLow</b> members is called the file ID. Support for file IDs is file 
  *     system-specific. File IDs are not guaranteed to be unique over time, because file systems are free to reuse them. 
  *     In some cases, the file ID for a file can change over time.
  * 
  * In the FAT file system, the file ID is generated from the first cluster of the containing directory and the 
  *     byte offset within the directory of the entry for the file. Some defragmentation products change this byte offset. 
  *     (Windows in-box defragmentation does not.) Thus, a FAT file ID can change over time. Renaming a file in the FAT 
  *     file system can also change the file ID, but only if the new file name is longer than the old one.
  * 
  * In the NTFS file system, a file keeps the same file ID until it is deleted. You can replace one file with 
  *     another file without changing the file ID by using the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-replacefilea">ReplaceFile</a> function. However, the file ID of the 
  *     replacement file, not the replaced file, is retained as the file ID of the resulting file.
  * 
  * Not all file systems can record creation and last access time, and not all file systems record them in the 
  *     same manner. For example, on a Windows FAT file system, create time has a resolution of 10 milliseconds, write 
  *     time has a resolution of 2 seconds, and access time has a resolution of 1 day (the access date). On the NTFS file 
  *     system, access time has a resolution of 1 hour. For more information, see 
  *     <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fileapi/ns-fileapi-by_handle_file_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class BY_HANDLE_FILE_INFORMATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The file attributes. For possible values and their descriptions, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies when a file or 
     *       directory is created. If the underlying file system does not support creation time, this member is 
     *       zero (0).
     * @type {FILETIME}
     */
    ftCreationTime{
        get {
            if(!this.HasProp("__ftCreationTime"))
                this.__ftCreationTime := FILETIME(this.ptr + 8)
            return this.__ftCreationTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. For a file, the structure 
     *      specifies the last time that a file is read from or written to. For a directory, the structure specifies when the 
     *      directory is created. For both files and directories, the specified date is correct, but the time of day is 
     *      always set to midnight. If the underlying file system does not support the last access time, this member is 
     *      zero (0).
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(this.ptr + 16)
            return this.__ftLastAccessTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. For a file, the structure 
     *       specifies the last time that a file is written to. For a directory, the structure specifies when the directory 
     *       is created. If the underlying file system does not support the last write time, this member is zero (0).
     * @type {FILETIME}
     */
    ftLastWriteTime{
        get {
            if(!this.HasProp("__ftLastWriteTime"))
                this.__ftLastWriteTime := FILETIME(this.ptr + 24)
            return this.__ftLastWriteTime
        }
    }

    /**
     * The serial number of the volume that contains a file.
     * @type {Integer}
     */
    dwVolumeSerialNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The high-order part of the file size.
     * @type {Integer}
     */
    nFileSizeHigh {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The low-order part of the file size.
     * @type {Integer}
     */
    nFileSizeLow {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of links to this file. For the FAT file system this member is always 1. For the NTFS file 
     *       system, it can be more than 1.
     * @type {Integer}
     */
    nNumberOfLinks {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The high-order part of a unique identifier that is associated with a file. For more information, see 
     *       <b>nFileIndexLow</b>.
     * @type {Integer}
     */
    nFileIndexHigh {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The low-order part of a unique identifier that is associated with a file.
     * 
     * The identifier (low and high parts) and the volume serial number uniquely identify a file on a single 
     *        computer. To determine whether two open handles represent the same file, combine the identifier and the volume 
     *        serial number for each file and compare them.
     * 
     * The ReFS file system, introduced with Windows Server 2012, includes 128-bit file identifiers. To 
     *        retrieve the 128-bit file identifier use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a> function 
     *        with <b>FileIdInfo</b> to retrieve the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_info">FILE_ID_INFO</a> structure. The 64-bit identifier in this 
     *        structure is not guaranteed to be unique on ReFS.
     * @type {Integer}
     */
    nFileIndexLow {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}

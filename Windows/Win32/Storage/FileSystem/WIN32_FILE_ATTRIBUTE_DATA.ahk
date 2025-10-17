#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains attribute information for a file or directory.
 * @remarks
 * 
  * Not all file systems can record creation and last access time, and not all file systems record them in the 
  *     same manner. For example, on the FAT file system, create time has a resolution of 10 milliseconds, write time has 
  *     a resolution of 2 seconds, and access time has a resolution of 1 day. On the NTFS file 
  *     system, access time has a resolution of 1 hour. For more information, see 
  *     <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fileapi/ns-fileapi-win32_file_attribute_data
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WIN32_FILE_ATTRIBUTE_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The file system attribute information for a file or directory.
     *       
     * 
     * For possible values and their descriptions, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies when the file or 
     *       directory is created.
     *       
     * 
     * If the underlying file system does not support creation time, this member is zero.
     * @type {FILETIME}
     */
    ftCreationTime{
        get {
            if(!this.HasProp("__ftCreationTime"))
                this.__ftCreationTime := FILETIME(8, this)
            return this.__ftCreationTime
        }
    }

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
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(16, this)
            return this.__ftLastAccessTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     *       
     * 
     * For a file, the structure specifies when the file is last written to.
     * 
     * For a directory, the structure specifies when the directory is created.
     * 
     * If the underlying file system does not support last write time, this member is zero.
     * @type {FILETIME}
     */
    ftLastWriteTime{
        get {
            if(!this.HasProp("__ftLastWriteTime"))
                this.__ftLastWriteTime := FILETIME(24, this)
            return this.__ftLastWriteTime
        }
    }

    /**
     * The high-order 
     *      <b>DWORD</b> of the file size.
     *       
     * 
     * This member does not have a meaning for directories.
     * @type {Integer}
     */
    nFileSizeHigh {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The low-order <b>DWORD</b> of the file size.
     *       
     * 
     * This member does not have a meaning for directories.
     * @type {Integer}
     */
    nFileSizeLow {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}

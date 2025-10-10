#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the basic information for a file. Used for file handles.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-file_basic_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_BASIC_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The time the file was created in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format, 
     *       which is a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The time the file was last accessed in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The time the file was last written to in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     * @type {Integer}
     */
    LastWriteTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The time the file was changed in <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> 
     *       format.
     * @type {Integer}
     */
    ChangeTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The file attributes. For a list of attributes, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>. If this is set 
     *       to 0 in a <b>FILE_BASIC_INFO</b> structure passed to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a> then none of the 
     *       attributes are changed.
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

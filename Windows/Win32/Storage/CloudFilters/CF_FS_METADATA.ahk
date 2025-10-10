#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\FileSystem\FILE_BASIC_INFO.ahk

/**
 * Placeholder file or directory metadata.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_fs_metadata
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_FS_METADATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Basic file information.
     * @type {FILE_BASIC_INFO}
     */
    BasicInfo{
        get {
            if(!this.HasProp("__BasicInfo"))
                this.__BasicInfo := FILE_BASIC_INFO(this.ptr + 0)
            return this.__BasicInfo
        }
    }

    /**
     * The size of the file, in bytes.
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}

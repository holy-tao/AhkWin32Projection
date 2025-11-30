#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Storage\FileSystem\FILE_ID_128.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_LINK_ENTRY_FULL_ID_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {FILE_ID_128}
     */
    ParentFileId{
        get {
            if(!this.HasProp("__ParentFileId"))
                this.__ParentFileId := FILE_ID_128(8, this)
            return this.__ParentFileId
        }
    }

    /**
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 28, 0, "UTF-16")
        set => StrPut(value, this.ptr + 28, 0, "UTF-16")
    }
}

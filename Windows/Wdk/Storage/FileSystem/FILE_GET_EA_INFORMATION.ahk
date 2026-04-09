#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_GET_EA_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EaNameLength {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {String}
     */
    EaName {
        get => StrGet(this.ptr + 6, 0, "UTF-8")
        set => StrPut(value, this.ptr + 6, 0, "UTF-8")
    }
}

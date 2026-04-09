#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_INFORMATION_CLASS.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_INFORMATION_DEFINITION extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {FILE_INFORMATION_CLASS}
     */
    Class {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FileNameLengthOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FileNameOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

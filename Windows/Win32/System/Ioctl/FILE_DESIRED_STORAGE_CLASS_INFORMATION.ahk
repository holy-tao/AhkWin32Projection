#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_STORAGE_TIER_CLASS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_DESIRED_STORAGE_CLASS_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {FILE_STORAGE_TIER_CLASS}
     */
    Class {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

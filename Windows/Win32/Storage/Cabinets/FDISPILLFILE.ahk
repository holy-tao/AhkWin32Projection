#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @architecture X64, Arm64
 */
class FDISPILLFILE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {String}
     */
    ach {
        get => StrGet(this.ptr + 0, 1, "UTF-8")
        set => StrPut(value, this.ptr + 0, 1, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    cbFile {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

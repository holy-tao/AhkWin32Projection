#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIN_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class BIN_COUNT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {BIN_RANGE}
     */
    BinRange{
        get {
            if(!this.HasProp("__BinRange"))
                this.__BinRange := BIN_RANGE(0, this)
            return this.__BinRange
        }
    }

    /**
     * @type {Integer}
     */
    BinCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

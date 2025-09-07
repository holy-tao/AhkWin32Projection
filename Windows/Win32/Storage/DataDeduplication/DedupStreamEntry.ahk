#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DedupHash.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupStreamEntry extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {DedupHash}
     */
    Hash{
        get {
            if(!this.HasProp("__Hash"))
                this.__Hash := DedupHash(this.ptr + 0)
            return this.__Hash
        }
    }

    /**
     * @type {Integer}
     */
    LogicalSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

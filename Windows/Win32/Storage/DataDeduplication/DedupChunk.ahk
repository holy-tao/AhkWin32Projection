#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DedupHash.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupChunk extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {DedupHash}
     */
    Hash{
        get {
            if(!this.HasProp("__Hash"))
                this.__Hash := DedupHash(0, this)
            return this.__Hash
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    LogicalSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

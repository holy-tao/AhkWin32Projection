#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupStream extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    Path{
        get {
            if(!this.HasProp("__Path"))
                this.__Path := BSTR(this.ptr + 0)
            return this.__Path
        }
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ChunkCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

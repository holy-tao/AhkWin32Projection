#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NODERESTRICTION.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class VECTORRESTRICTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {NODERESTRICTION}
     */
    Node{
        get {
            if(!this.HasProp("__Node"))
                this.__Node := NODERESTRICTION(this.ptr + 0)
            return this.__Node
        }
    }

    /**
     * @type {Integer}
     */
    RankMethod {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

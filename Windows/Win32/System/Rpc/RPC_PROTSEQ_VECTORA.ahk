#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_PROTSEQ_VECTORA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Protseq{
        get {
            if(!this.HasProp("__ProtseqProxyArray"))
                this.__ProtseqProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__ProtseqProxyArray
        }
    }
}

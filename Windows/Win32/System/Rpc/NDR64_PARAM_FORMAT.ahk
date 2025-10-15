#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_PARAM_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_PARAM_FORMAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Type {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NDR64_PARAM_FLAGS}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := NDR64_PARAM_FLAGS(this.ptr + 8)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    StackOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

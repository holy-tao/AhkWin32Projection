#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_ARRAY_FLAGS.ahk
#Include .\NDR64_BOGUS_ARRAY_HEADER_FORMAT.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_CONF_VAR_BOGUS_ARRAY_HEADER_FORMAT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {NDR64_BOGUS_ARRAY_HEADER_FORMAT}
     */
    FixedArrayFormat{
        get {
            if(!this.HasProp("__FixedArrayFormat"))
                this.__FixedArrayFormat := NDR64_BOGUS_ARRAY_HEADER_FORMAT(this.ptr + 0)
            return this.__FixedArrayFormat
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ConfDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    VarDescription {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    OffsetDescription {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

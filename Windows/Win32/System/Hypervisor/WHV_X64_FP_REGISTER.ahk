#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_FP_REGISTER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Mantissa {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WHV_UINT128}
     */
    AsUINT128{
        get {
            if(!this.HasProp("__AsUINT128"))
                this.__AsUINT128 := WHV_UINT128(this.ptr + 0)
            return this.__AsUINT128
        }
    }
}

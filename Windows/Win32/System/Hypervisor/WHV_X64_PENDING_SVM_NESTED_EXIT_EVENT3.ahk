#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT3 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Array<Integer>}
     */
    InstructionBytes {
        get {
            if(!this.HasProp("__InstructionBytesProxyArray"))
                this.__InstructionBytesProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__InstructionBytesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WHV_UINT128}
     */
    AsUINT128 {
        get {
            if(!this.HasProp("__AsUINT128"))
                this.__AsUINT128 := WHV_UINT128(0, this)
            return this.__AsUINT128
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT2 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NextRip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InstructionBytesFetchedCount {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    InstructionBytes {
        get {
            if(!this.HasProp("__InstructionBytesProxyArray"))
                this.__InstructionBytesProxyArray := Win32FixedArray(this.ptr + 9, 7, Primitive, "char")
            return this.__InstructionBytesProxyArray
        }
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

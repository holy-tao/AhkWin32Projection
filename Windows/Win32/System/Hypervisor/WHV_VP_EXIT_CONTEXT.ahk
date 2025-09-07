#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_VP_EXECUTION_STATE.ahk
#Include .\WHV_X64_SEGMENT_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VP_EXIT_CONTEXT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {WHV_X64_VP_EXECUTION_STATE}
     */
    ExecutionState{
        get {
            if(!this.HasProp("__ExecutionState"))
                this.__ExecutionState := WHV_X64_VP_EXECUTION_STATE(this.ptr + 0)
            return this.__ExecutionState
        }
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Cs{
        get {
            if(!this.HasProp("__Cs"))
                this.__Cs := WHV_X64_SEGMENT_REGISTER(this.ptr + 16)
            return this.__Cs
        }
    }

    /**
     * @type {Integer}
     */
    Rip {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Rflags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

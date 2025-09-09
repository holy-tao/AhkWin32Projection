#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    ThreadContext{
        get {
            if(!this.HasProp("__ThreadContextProxyArray"))
                this.__ThreadContextProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__ThreadContextProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    EntryPoint {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    StackPointer {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ExceptionEntryPoint {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ExceptionStack {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ExceptionActive {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}

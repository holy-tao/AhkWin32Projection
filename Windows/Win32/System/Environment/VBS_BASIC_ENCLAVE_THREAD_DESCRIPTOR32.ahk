#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StackPointer {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ExceptionEntryPoint {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ExceptionStack {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ExceptionActive {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

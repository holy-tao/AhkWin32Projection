#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class DISPATCHER_CONTEXT_NONVOLREG_ARM64 extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    GpNvRegs{
        get {
            if(!this.HasProp("__GpNvRegsProxyArray"))
                this.__GpNvRegsProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__GpNvRegsProxyArray
        }
    }

    /**
     * @type {Array<Double>}
     */
    FpNvRegs{
        get {
            if(!this.HasProp("__FpNvRegsProxyArray"))
                this.__FpNvRegsProxyArray := Win32FixedArray(this.ptr + 88, 8, Primitive, "double")
            return this.__FpNvRegsProxyArray
        }
    }
}

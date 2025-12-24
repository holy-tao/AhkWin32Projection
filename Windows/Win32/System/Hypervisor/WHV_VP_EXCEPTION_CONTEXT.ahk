#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_VP_EXCEPTION_INFO.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VP_EXCEPTION_CONTEXT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InstructionByteCount {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    InstructionBytes{
        get {
            if(!this.HasProp("__InstructionBytesProxyArray"))
                this.__InstructionBytesProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__InstructionBytesProxyArray
        }
    }

    /**
     * @type {WHV_VP_EXCEPTION_INFO}
     */
    ExceptionInfo{
        get {
            if(!this.HasProp("__ExceptionInfo"))
                this.__ExceptionInfo := WHV_VP_EXCEPTION_INFO(20, this)
            return this.__ExceptionInfo
        }
    }

    /**
     * @type {Integer}
     */
    ExceptionType {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 29, 3, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ErrorCode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ExceptionParameter {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

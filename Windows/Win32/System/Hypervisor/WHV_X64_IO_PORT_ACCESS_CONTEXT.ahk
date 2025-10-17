#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_IO_PORT_ACCESS_INFO.ahk
#Include .\WHV_X64_SEGMENT_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_IO_PORT_ACCESS_CONTEXT extends Win32Struct
{
    static sizeof => 104

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
     * @type {WHV_X64_IO_PORT_ACCESS_INFO}
     */
    AccessInfo{
        get {
            if(!this.HasProp("__AccessInfo"))
                this.__AccessInfo := WHV_X64_IO_PORT_ACCESS_INFO(24, this)
            return this.__AccessInfo
        }
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Array<UInt16>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 34, 3, Primitive, "ushort")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Rax {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Rcx {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Rsi {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Rdi {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Ds{
        get {
            if(!this.HasProp("__Ds"))
                this.__Ds := WHV_X64_SEGMENT_REGISTER(72, this)
            return this.__Ds
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Es{
        get {
            if(!this.HasProp("__Es"))
                this.__Es := WHV_X64_SEGMENT_REGISTER(88, this)
            return this.__Es
        }
    }
}

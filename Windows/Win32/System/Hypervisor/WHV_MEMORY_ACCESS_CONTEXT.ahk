#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_MEMORY_ACCESS_INFO.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_MEMORY_ACCESS_CONTEXT extends Win32Struct
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
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    InstructionBytes{
        get {
            if(!this.HasProp("__InstructionBytesProxyArray"))
                this.__InstructionBytesProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__InstructionBytesProxyArray
        }
    }

    /**
     * @type {WHV_MEMORY_ACCESS_INFO}
     */
    AccessInfo{
        get {
            if(!this.HasProp("__AccessInfo"))
                this.__AccessInfo := WHV_MEMORY_ACCESS_INFO(this.ptr + 24)
            return this.__AccessInfo
        }
    }

    /**
     * @type {Integer}
     */
    Gpa {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Gva {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

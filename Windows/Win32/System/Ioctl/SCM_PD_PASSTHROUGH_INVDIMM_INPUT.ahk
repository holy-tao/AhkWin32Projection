#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_PASSTHROUGH_INVDIMM_INPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Opcode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OpcodeParametersLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    OpcodeParameters{
        get {
            if(!this.HasProp("__OpcodeParametersProxyArray"))
                this.__OpcodeParametersProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__OpcodeParametersProxyArray
        }
    }
}

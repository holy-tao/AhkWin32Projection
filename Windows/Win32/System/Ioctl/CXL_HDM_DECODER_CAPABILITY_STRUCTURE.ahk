#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_HDM_DECODER_CAPABILITY_REGISTER.ahk
#Include .\CXL_HDM_DECODER_CONTROL_REGISTER.ahk
#Include .\CXL_HDM_DECODER_DPA_SKIP_LOW_REGISTER.ahk
#Include .\CXL_HDM_DECODER_GLOBAL_CONTROL_REGISTER.ahk
#Include .\CXL_HDM_DECODER_REGISTERS.ahk
#Include .\CXL_HDM_DECODER_TARGET_LIST_HIGH_REGISTER.ahk
#Include .\CXL_HDM_DECODER_TARGET_LIST_LOW_REGISTER.ahk
#Include .\CXL_HDM_MEMORY_BASE_LOW.ahk
#Include .\CXL_HDM_MEMORY_SIZE_LOW.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_HDM_DECODER_CAPABILITY_STRUCTURE extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {CXL_HDM_DECODER_CAPABILITY_REGISTER}
     */
    CapabilityRegister {
        get {
            if(!this.HasProp("__CapabilityRegister"))
                this.__CapabilityRegister := CXL_HDM_DECODER_CAPABILITY_REGISTER(0, this)
            return this.__CapabilityRegister
        }
    }

    /**
     * @type {CXL_HDM_DECODER_GLOBAL_CONTROL_REGISTER}
     */
    GlobalControlRegister {
        get {
            if(!this.HasProp("__GlobalControlRegister"))
                this.__GlobalControlRegister := CXL_HDM_DECODER_GLOBAL_CONTROL_REGISTER(8, this)
            return this.__GlobalControlRegister
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {CXL_HDM_DECODER_REGISTERS}
     */
    Decoders {
        get {
            if(!this.HasProp("__DecodersProxyArray"))
                this.__DecodersProxyArray := Win32FixedArray(this.ptr + 24, 1, CXL_HDM_DECODER_REGISTERS, "")
            return this.__DecodersProxyArray
        }
    }
}

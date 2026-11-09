#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_CACHEMEM_CAPABILITY_HEADER_REGISTER.ahk
#Include .\CXL_CAPABILITY_HEADER_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_CACHEMEM_REGISTERS extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {CXL_CAPABILITY_HEADER_REGISTER}
     */
    CapabilityHeaderRegister {
        get {
            if(!this.HasProp("__CapabilityHeaderRegister"))
                this.__CapabilityHeaderRegister := CXL_CAPABILITY_HEADER_REGISTER(0, this)
            return this.__CapabilityHeaderRegister
        }
    }

    /**
     * @type {CXL_CACHEMEM_CAPABILITY_HEADER_REGISTER}
     */
    CacheMemCapabilityHeaderRegister {
        get {
            if(!this.HasProp("__CacheMemCapabilityHeaderRegisterProxyArray"))
                this.__CacheMemCapabilityHeaderRegisterProxyArray := Win32FixedArray(this.ptr + 8, 1, CXL_CACHEMEM_CAPABILITY_HEADER_REGISTER, "")
            return this.__CacheMemCapabilityHeaderRegisterProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER.ahk
#Include .\CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER_HEADER.ahk
#Include .\CXL_DEVICE_CAPABILITY_HEADER_REGISTER.ahk
#Include .\CXL_DEVICE_CAPABILITY_HEADER_REGISTER_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_REGISTERS extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER}
     */
    CapabilityArrayRegister {
        get {
            if(!this.HasProp("__CapabilityArrayRegister"))
                this.__CapabilityArrayRegister := CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER(0, this)
            return this.__CapabilityArrayRegister
        }
    }

    /**
     * @type {CXL_DEVICE_CAPABILITY_HEADER_REGISTER}
     */
    CapabilityHeaderRegister {
        get {
            if(!this.HasProp("__CapabilityHeaderRegisterProxyArray"))
                this.__CapabilityHeaderRegisterProxyArray := Win32FixedArray(this.ptr + 20, 1, CXL_DEVICE_CAPABILITY_HEADER_REGISTER, "")
            return this.__CapabilityHeaderRegisterProxyArray
        }
    }
}

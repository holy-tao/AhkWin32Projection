#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_EVENT_STATUS_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_STATUS_REGISTERS extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {CXL_EVENT_STATUS_REGISTER}
     */
    EventStatusRegister {
        get {
            if(!this.HasProp("__EventStatusRegister"))
                this.__EventStatusRegister := CXL_EVENT_STATUS_REGISTER(0, this)
            return this.__EventStatusRegister
        }
    }
}

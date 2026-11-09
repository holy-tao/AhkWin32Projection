#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_BACKGROUND_COMMAND_STATUS_REGISTER.ahk
#Include .\CXL_COMMAND_PAYLOAD_REGISTERS.ahk
#Include .\CXL_COMMAND_REGISTER.ahk
#Include .\CXL_MAILBOX_CAPABILITY_REGISTER.ahk
#Include .\CXL_MAILBOX_CONTROL_REGISTER.ahk
#Include .\CXL_MAILBOX_STATUS_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_REGISTERS extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {CXL_MAILBOX_CAPABILITY_REGISTER}
     */
    CapabilityRegister {
        get {
            if(!this.HasProp("__CapabilityRegister"))
                this.__CapabilityRegister := CXL_MAILBOX_CAPABILITY_REGISTER(0, this)
            return this.__CapabilityRegister
        }
    }

    /**
     * @type {CXL_MAILBOX_CONTROL_REGISTER}
     */
    ControlRegister {
        get {
            if(!this.HasProp("__ControlRegister"))
                this.__ControlRegister := CXL_MAILBOX_CONTROL_REGISTER(8, this)
            return this.__ControlRegister
        }
    }

    /**
     * @type {CXL_COMMAND_REGISTER}
     */
    CommandRegister {
        get {
            if(!this.HasProp("__CommandRegister"))
                this.__CommandRegister := CXL_COMMAND_REGISTER(16, this)
            return this.__CommandRegister
        }
    }

    /**
     * @type {CXL_MAILBOX_STATUS_REGISTER}
     */
    StatusRegister {
        get {
            if(!this.HasProp("__StatusRegister"))
                this.__StatusRegister := CXL_MAILBOX_STATUS_REGISTER(32, this)
            return this.__StatusRegister
        }
    }

    /**
     * @type {CXL_BACKGROUND_COMMAND_STATUS_REGISTER}
     */
    BackgroundCommandStatusRegister {
        get {
            if(!this.HasProp("__BackgroundCommandStatusRegister"))
                this.__BackgroundCommandStatusRegister := CXL_BACKGROUND_COMMAND_STATUS_REGISTER(48, this)
            return this.__BackgroundCommandStatusRegister
        }
    }

    /**
     * @type {CXL_COMMAND_PAYLOAD_REGISTERS}
     */
    PayloadRegisters {
        get {
            if(!this.HasProp("__PayloadRegisters"))
                this.__PayloadRegisters := CXL_COMMAND_PAYLOAD_REGISTERS(64, this)
            return this.__PayloadRegisters
        }
    }
}

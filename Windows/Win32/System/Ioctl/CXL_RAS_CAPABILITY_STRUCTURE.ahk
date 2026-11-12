#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_RAS_CORRECTABLE_ERROR_MASK_REGISTER.ahk
#Include .\CXL_RAS_CORRECTABLE_ERROR_STATUS_REGISTER.ahk
#Include .\CXL_RAS_ERROR_CAPABILITY_AND_CONTROL_REGISTER.ahk
#Include .\CXL_RAS_HEADER_LOG_REGISTERS.ahk
#Include .\CXL_RAS_UNCORRECTABLE_ERROR_MASK_REGISTER.ahk
#Include .\CXL_RAS_UNCORRECTABLE_ERROR_SEVERITY_REGISTER.ahk
#Include .\CXL_RAS_UNCORRECTABLE_ERROR_STATUS_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_RAS_CAPABILITY_STRUCTURE extends Win32Struct {
    static sizeof => 112

    static packingSize => 4

    /**
     * @type {CXL_RAS_UNCORRECTABLE_ERROR_STATUS_REGISTER}
     */
    UncorrectableErrorStatusRegister {
        get {
            if(!this.HasProp("__UncorrectableErrorStatusRegister"))
                this.__UncorrectableErrorStatusRegister := CXL_RAS_UNCORRECTABLE_ERROR_STATUS_REGISTER(0, this)
            return this.__UncorrectableErrorStatusRegister
        }
    }

    /**
     * @type {CXL_RAS_UNCORRECTABLE_ERROR_MASK_REGISTER}
     */
    UncorrectableErrorMaskRegister {
        get {
            if(!this.HasProp("__UncorrectableErrorMaskRegister"))
                this.__UncorrectableErrorMaskRegister := CXL_RAS_UNCORRECTABLE_ERROR_MASK_REGISTER(8, this)
            return this.__UncorrectableErrorMaskRegister
        }
    }

    /**
     * @type {CXL_RAS_UNCORRECTABLE_ERROR_SEVERITY_REGISTER}
     */
    UncorrectableErrorSeverityRegister {
        get {
            if(!this.HasProp("__UncorrectableErrorSeverityRegister"))
                this.__UncorrectableErrorSeverityRegister := CXL_RAS_UNCORRECTABLE_ERROR_SEVERITY_REGISTER(16, this)
            return this.__UncorrectableErrorSeverityRegister
        }
    }

    /**
     * @type {CXL_RAS_CORRECTABLE_ERROR_STATUS_REGISTER}
     */
    CorrectableErrorStatusRegister {
        get {
            if(!this.HasProp("__CorrectableErrorStatusRegister"))
                this.__CorrectableErrorStatusRegister := CXL_RAS_CORRECTABLE_ERROR_STATUS_REGISTER(24, this)
            return this.__CorrectableErrorStatusRegister
        }
    }

    /**
     * @type {CXL_RAS_CORRECTABLE_ERROR_MASK_REGISTER}
     */
    CorrectableErrorMaskRegister {
        get {
            if(!this.HasProp("__CorrectableErrorMaskRegister"))
                this.__CorrectableErrorMaskRegister := CXL_RAS_CORRECTABLE_ERROR_MASK_REGISTER(32, this)
            return this.__CorrectableErrorMaskRegister
        }
    }

    /**
     * @type {CXL_RAS_ERROR_CAPABILITY_AND_CONTROL_REGISTER}
     */
    ErrorCapabilityAndControlRegister {
        get {
            if(!this.HasProp("__ErrorCapabilityAndControlRegister"))
                this.__ErrorCapabilityAndControlRegister := CXL_RAS_ERROR_CAPABILITY_AND_CONTROL_REGISTER(40, this)
            return this.__ErrorCapabilityAndControlRegister
        }
    }

    /**
     * @type {CXL_RAS_HEADER_LOG_REGISTERS}
     */
    HeaderLogRegisters {
        get {
            if(!this.HasProp("__HeaderLogRegisters"))
                this.__HeaderLogRegisters := CXL_RAS_HEADER_LOG_REGISTERS(48, this)
            return this.__HeaderLogRegisters
        }
    }
}

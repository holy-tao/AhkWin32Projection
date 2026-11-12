#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_INTERRUPT_POLICY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_INTERRUPT_POLICY extends Win32Struct {
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {CXL_INTERRUPT_POLICY}
     */
    InformationalEventLogInterruptSettings {
        get {
            if(!this.HasProp("__InformationalEventLogInterruptSettings"))
                this.__InformationalEventLogInterruptSettings := CXL_INTERRUPT_POLICY(0, this)
            return this.__InformationalEventLogInterruptSettings
        }
    }

    /**
     * @type {CXL_INTERRUPT_POLICY}
     */
    WarningEventLogInterruptSettings {
        get {
            if(!this.HasProp("__WarningEventLogInterruptSettings"))
                this.__WarningEventLogInterruptSettings := CXL_INTERRUPT_POLICY(1, this)
            return this.__WarningEventLogInterruptSettings
        }
    }

    /**
     * @type {CXL_INTERRUPT_POLICY}
     */
    FailureEventLogInterruptSettings {
        get {
            if(!this.HasProp("__FailureEventLogInterruptSettings"))
                this.__FailureEventLogInterruptSettings := CXL_INTERRUPT_POLICY(2, this)
            return this.__FailureEventLogInterruptSettings
        }
    }

    /**
     * @type {CXL_INTERRUPT_POLICY}
     */
    FatalEventLogInterruptSettings {
        get {
            if(!this.HasProp("__FatalEventLogInterruptSettings"))
                this.__FatalEventLogInterruptSettings := CXL_INTERRUPT_POLICY(3, this)
            return this.__FatalEventLogInterruptSettings
        }
    }

    /**
     * @type {CXL_INTERRUPT_POLICY}
     */
    DynamicCapacityEventLogInterruptSettings {
        get {
            if(!this.HasProp("__DynamicCapacityEventLogInterruptSettings"))
                this.__DynamicCapacityEventLogInterruptSettings := CXL_INTERRUPT_POLICY(4, this)
            return this.__DynamicCapacityEventLogInterruptSettings
        }
    }
}

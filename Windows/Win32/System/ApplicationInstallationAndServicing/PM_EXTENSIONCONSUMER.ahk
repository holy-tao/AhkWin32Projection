#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_EXTENSIONCONSUMER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ConsumerPID {
        get {
            if(!this.HasProp("__ConsumerPID"))
                this.__ConsumerPID := Guid(0, this)
            return this.__ConsumerPID
        }
    }

    /**
     * @type {BSTR}
     */
    ExtensionID {
        get {
            if(!this.HasProp("__ExtensionID"))
                this.__ExtensionID := BSTR(16, this)
            return this.__ExtensionID
        }
    }
}

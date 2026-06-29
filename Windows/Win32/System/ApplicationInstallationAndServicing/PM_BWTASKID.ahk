#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_BWTASKID extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ProductID {
        get {
            if(!this.HasProp("__ProductID"))
                this.__ProductID := Guid(0, this)
            return this.__ProductID
        }
    }

    /**
     * @type {BSTR}
     */
    TaskID {
        get {
            if(!this.HasProp("__TaskID"))
                this.__TaskID := BSTR(16, this)
            return this.__TaskID
        }
    }
}

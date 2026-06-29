#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class ContextProperty extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    policyId {
        get {
            if(!this.HasProp("__policyId"))
                this.__policyId := Guid(0, this)
            return this.__policyId
        }
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {IUnknown}
     */
    pUnk {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

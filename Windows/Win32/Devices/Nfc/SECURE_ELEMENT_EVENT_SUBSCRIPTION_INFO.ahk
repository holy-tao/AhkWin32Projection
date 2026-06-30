#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_EVENT_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    guidSecureElementId {
        get {
            if(!this.HasProp("__guidSecureElementId"))
                this.__guidSecureElementId := Guid(0, this)
            return this.__guidSecureElementId
        }
    }

    /**
     * @type {SECURE_ELEMENT_EVENT_TYPE}
     */
    eEventType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

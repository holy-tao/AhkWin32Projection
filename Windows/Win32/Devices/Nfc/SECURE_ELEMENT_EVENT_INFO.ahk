#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_EVENT_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_EVENT_INFO extends Win32Struct {
    static sizeof => 28

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

    /**
     * @type {Integer}
     */
    cbEventData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    pbEventData {
        get {
            if(!this.HasProp("__pbEventDataProxyArray"))
                this.__pbEventDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__pbEventDataProxyArray
        }
    }
}

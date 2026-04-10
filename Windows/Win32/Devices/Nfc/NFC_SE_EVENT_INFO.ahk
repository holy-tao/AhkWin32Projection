#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_EVENT_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_SE_EVENT_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSecureElement {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SECURE_ELEMENT_EVENT_TYPE}
     */
    eEventType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbEventData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    pbEventData {
        get {
            if(!this.HasProp("__pbEventDataProxyArray"))
                this.__pbEventDataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__pbEventDataProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_AID_ROUTING_INFO extends Win32Struct {
    static sizeof => 36

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
     * @type {Integer}
     */
    cbAid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    pbAid {
        get {
            if(!this.HasProp("__pbAidProxyArray"))
                this.__pbAidProxyArray := Win32FixedArray(this.ptr + 20, 16, Primitive, "char")
            return this.__pbAidProxyArray
        }
    }
}

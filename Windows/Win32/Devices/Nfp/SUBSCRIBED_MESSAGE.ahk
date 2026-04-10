#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfp
 */
class SUBSCRIBED_MESSAGE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbPayloadHint {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    payload {
        get {
            if(!this.HasProp("__payloadProxyArray"))
                this.__payloadProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__payloadProxyArray
        }
    }
}

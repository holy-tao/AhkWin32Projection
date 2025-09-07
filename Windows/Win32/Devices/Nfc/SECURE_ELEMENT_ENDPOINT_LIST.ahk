#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_ENDPOINT_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_ENDPOINT_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfEndpoints {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SECURE_ELEMENT_ENDPOINT_INFO>}
     */
    EndpointList{
        get {
            if(!this.HasProp("__EndpointListProxyArray"))
                this.__EndpointListProxyArray := Win32FixedArray(this.ptr + 8, 8, SECURE_ELEMENT_ENDPOINT_INFO, "")
            return this.__EndpointListProxyArray
        }
    }
}

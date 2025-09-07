#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ROAMING_START_PARAMETERS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    AdhocBSSID{
        get {
            if(!this.HasProp("__AdhocBSSIDProxyArray"))
                this.__AdhocBSSIDProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__AdhocBSSIDProxyArray
        }
    }

    /**
     * @type {DOT11_SSID}
     */
    AdhocSSID{
        get {
            if(!this.HasProp("__AdhocSSID"))
                this.__AdhocSSID := DOT11_SSID(this.ptr + 16)
            return this.__AdhocSSID
        }
    }

    /**
     * @type {Integer}
     */
    uRoamingReason {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_VIRTUAL_STATION_AP_PROPERTY extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {DOT11_SSID}
     */
    dot11SSID{
        get {
            if(!this.HasProp("__dot11SSID"))
                this.__dot11SSID := DOT11_SSID(this.ptr + 0)
            return this.__dot11SSID
        }
    }

    /**
     * @type {Integer}
     */
    dot11AuthAlgo {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dot11CipherAlgo {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    bIsPassPhrase{
        get {
            if(!this.HasProp("__bIsPassPhrase"))
                this.__bIsPassPhrase := BOOL(this.ptr + 44)
            return this.__bIsPassPhrase
        }
    }

    /**
     * @type {Integer}
     */
    dwKeyLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Byte>}
     */
    ucKeyData{
        get {
            if(!this.HasProp("__ucKeyDataProxyArray"))
                this.__ucKeyDataProxyArray := Win32FixedArray(this.ptr + 52, 64, Primitive, "char")
            return this.__ucKeyDataProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11EXT_VIRTUAL_STATION_AP_PROPERTY extends Win32Struct {
    static sizeof => 116

    static packingSize => 4

    /**
     * @type {DOT11_SSID}
     */
    dot11SSID {
        get {
            if(!this.HasProp("__dot11SSID"))
                this.__dot11SSID := DOT11_SSID(0, this)
            return this.__dot11SSID
        }
    }

    /**
     * @type {DOT11_AUTH_ALGORITHM}
     */
    dot11AuthAlgo {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {DOT11_CIPHER_ALGORITHM}
     */
    dot11CipherAlgo {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    bIsPassPhrase {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwKeyLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Integer>}
     */
    ucKeyData {
        get {
            if(!this.HasProp("__ucKeyDataProxyArray"))
                this.__ucKeyDataProxyArray := Win32FixedArray(this.ptr + 52, 64, Primitive, "char")
            return this.__ucKeyDataProxyArray
        }
    }
}

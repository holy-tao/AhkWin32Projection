#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_AUTH_CIPHER_PAIR.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_AUTH_CIPHER_PAIR_LIST extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DOT11_AUTH_CIPHER_PAIR}
     */
    AuthCipherPairs {
        get {
            if(!this.HasProp("__AuthCipherPairsProxyArray"))
                this.__AuthCipherPairsProxyArray := Win32FixedArray(this.ptr + 12, 1, DOT11_AUTH_CIPHER_PAIR, "")
            return this.__AuthCipherPairsProxyArray
        }
    }
}

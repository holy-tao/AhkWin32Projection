#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_AUTHENTICATION_ENCRYPTION.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_CAPABILITY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NoOfPMKIDs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NoOfAuthEncryptPairsSupported {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<NDIS_802_11_AUTHENTICATION_ENCRYPTION>}
     */
    AuthenticationEncryptionSupported{
        get {
            if(!this.HasProp("__AuthenticationEncryptionSupportedProxyArray"))
                this.__AuthenticationEncryptionSupportedProxyArray := Win32FixedArray(this.ptr + 16, 1, NDIS_802_11_AUTHENTICATION_ENCRYPTION, "")
            return this.__AuthenticationEncryptionSupportedProxyArray
        }
    }
}

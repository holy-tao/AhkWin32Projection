#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_CRYPTO_CAPABILITY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_CRYPTO_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumKeysSupported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumCryptoCapabilities {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<STORAGE_CRYPTO_CAPABILITY>}
     */
    CryptoCapabilities{
        get {
            if(!this.HasProp("__CryptoCapabilitiesProxyArray"))
                this.__CryptoCapabilitiesProxyArray := Win32FixedArray(this.ptr + 16, 8, STORAGE_CRYPTO_CAPABILITY, "")
            return this.__CryptoCapabilitiesProxyArray
        }
    }
}

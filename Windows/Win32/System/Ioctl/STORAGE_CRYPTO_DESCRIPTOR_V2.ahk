#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_SECURITY_COMPLIANCE_BITMASK.ahk
#Include .\STORAGE_CRYPTO_KEY_TYPE.ahk
#Include .\STORAGE_CRYPTO_CAPABILITY_V2.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_CRYPTO_DESCRIPTOR_V2 extends Win32Struct
{
    static sizeof => 32

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
     * @type {Integer}
     */
    IceType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {STORAGE_SECURITY_COMPLIANCE_BITMASK}
     */
    SecurityComplianceBitmask{
        get {
            if(!this.HasProp("__SecurityComplianceBitmask"))
                this.__SecurityComplianceBitmask := STORAGE_SECURITY_COMPLIANCE_BITMASK(20, this)
            return this.__SecurityComplianceBitmask
        }
    }

    /**
     * @type {STORAGE_CRYPTO_KEY_TYPE}
     */
    KeyTypeBitmask{
        get {
            if(!this.HasProp("__KeyTypeBitmask"))
                this.__KeyTypeBitmask := STORAGE_CRYPTO_KEY_TYPE(22, this)
            return this.__KeyTypeBitmask
        }
    }

    /**
     * @type {Array<STORAGE_CRYPTO_CAPABILITY_V2>}
     */
    CryptoCapabilities{
        get {
            if(!this.HasProp("__CryptoCapabilitiesProxyArray"))
                this.__CryptoCapabilitiesProxyArray := Win32FixedArray(this.ptr + 24, 1, STORAGE_CRYPTO_CAPABILITY_V2, "")
            return this.__CryptoCapabilitiesProxyArray
        }
    }
}

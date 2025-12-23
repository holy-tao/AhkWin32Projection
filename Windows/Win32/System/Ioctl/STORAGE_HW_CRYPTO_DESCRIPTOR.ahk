#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_DESCRIPTOR_HEADER.ahk
#Include .\STORAGE_SECURITY_COMPLIANCE_BITMASK.ahk
#Include .\STORAGE_CRYPTO_KEY_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_CRYPTO_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {STORAGE_DESCRIPTOR_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := STORAGE_DESCRIPTOR_HEADER(0, this)
            return this.__Header
        }
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
    OffsetToCryptoCapabilities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SizeOfCryptoCapability {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    IceType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {STORAGE_SECURITY_COMPLIANCE_BITMASK}
     */
    SecurityComplianceBitmask{
        get {
            if(!this.HasProp("__SecurityComplianceBitmask"))
                this.__SecurityComplianceBitmask := STORAGE_SECURITY_COMPLIANCE_BITMASK(28, this)
            return this.__SecurityComplianceBitmask
        }
    }

    /**
     * @type {STORAGE_CRYPTO_KEY_TYPE}
     */
    KeyTypeBitmask{
        get {
            if(!this.HasProp("__KeyTypeBitmask"))
                this.__KeyTypeBitmask := STORAGE_CRYPTO_KEY_TYPE(30, this)
            return this.__KeyTypeBitmask
        }
    }
}

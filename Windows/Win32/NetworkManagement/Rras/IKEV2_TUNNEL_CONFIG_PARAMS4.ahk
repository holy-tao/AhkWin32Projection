#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class IKEV2_TUNNEL_CONFIG_PARAMS4 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwIdleTimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwNetworkBlackoutTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwSaLifeTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwSaDataSizeForRenegotiation {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwConfigOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwTotalCertificates {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    certificateNames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    machineCertificateName{
        get {
            if(!this.HasProp("__machineCertificateName"))
                this.__machineCertificateName := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__machineCertificateName
        }
    }

    /**
     * @type {Integer}
     */
    dwEncryptionType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<ROUTER_CUSTOM_IKEv2_POLICY0>}
     */
    customPolicy {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwTotalEkus {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<MPR_CERT_EKU>}
     */
    certificateEKUs {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    machineCertificateHash{
        get {
            if(!this.HasProp("__machineCertificateHash"))
                this.__machineCertificateHash := CRYPT_INTEGER_BLOB(this.ptr + 80)
            return this.__machineCertificateHash
        }
    }

    /**
     * @type {Integer}
     */
    dwMmSaLifeTime {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}

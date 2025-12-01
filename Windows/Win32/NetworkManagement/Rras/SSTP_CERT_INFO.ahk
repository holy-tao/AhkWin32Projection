#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information about a Secure Socket Tunneling Protocol (SSTP) based certificate.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-sstp_cert_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class SSTP_CERT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value that is <b>TRUE</b> if this is the default mode, and <b>FALSE</b> otherwise.
     * 
     * <div class="alert"><b>Note</b>  Default mode is when the administrator has not explicitly configured the device and the SSTP service automatically chooses a valid certificate.</div>
     * <div> </div>
     * @type {BOOL}
     */
    isDefault {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> structure that contains the SSTP based certificate hash. 
     * 
     * The <b>cbData</b> member contains the length, in bytes, of the certificate hash in the <b>pbData</b> member. If <b>cbData</b> is zero, the SSTP certificate configuration is cleaned and the SSTP service automatically chooses a valid certificate. The hashing algorithm used to calculate <b>pbData</b> is defined by the <b>certAlgorithm</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-sstp_config_params">SSTP_CONFIG_PARAMS</a> structure.
     * @type {CRYPT_INTEGER_BLOB}
     */
    certBlob{
        get {
            if(!this.HasProp("__certBlob"))
                this.__certBlob := CRYPT_INTEGER_BLOB(8, this)
            return this.__certBlob
        }
    }
}

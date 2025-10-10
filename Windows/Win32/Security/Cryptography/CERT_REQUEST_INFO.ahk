#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_PUBLIC_KEY_INFO.ahk

/**
 * The CERT_REQUEST_INFO structure contains information for a certificate request. The subject, subject public key, and attribute BLOBs are encoded.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_request_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REQUEST_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The certificate's version number. Defined version number is shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_V1"></a><a id="cert_v1"></a><dl>
     * <dt><b>CERT_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 1
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the certificate subject's encoded name.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Subject{
        get {
            if(!this.HasProp("__Subject"))
                this.__Subject := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Subject
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure containing the encoded public key and its algorithm.
     * @type {CERT_PUBLIC_KEY_INFO}
     */
    SubjectPublicKeyInfo{
        get {
            if(!this.HasProp("__SubjectPublicKeyInfo"))
                this.__SubjectPublicKeyInfo := CERT_PUBLIC_KEY_INFO(this.ptr + 24)
            return this.__SubjectPublicKeyInfo
        }
    }

    /**
     * Number of elements in the <b>rgAttribute</b> array.
     * @type {Integer}
     */
    cAttribute {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding attribute information about the certificate.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAttribute {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}

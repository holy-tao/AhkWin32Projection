#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Encapsulates certificates for use with Internet Key Exchange messages.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_or_crl_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_OR_CRL_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <b>DWORD</b> value that specifies the content type of the buffer pointed to by the <b>pbEncoded</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_BUNDLE_CERTIFICATE"></a><a id="cert_bundle_certificate"></a><dl>
     * <dt><b>CERT_BUNDLE_CERTIFICATE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pbEncoded</b> member points to an encoded certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_BUNDLE_CRL"></a><a id="cert_bundle_crl"></a><dl>
     * <dt><b>CERT_BUNDLE_CRL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pbEncoded</b> member points to a certificate list.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbEncoded</b> member.
     * @type {Integer}
     */
    cbEncoded {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a buffer that contains a certificate or a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_or_crl_bundle">CERT_OR_CRL_BUNDLE</a> structure that contains an array of certificates as specified by the <b>dwChoice</b> member.
     * @type {Pointer<Byte>}
     */
    pbEncoded {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

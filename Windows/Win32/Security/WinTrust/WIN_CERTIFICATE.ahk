#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure encapsulates a signature used in verifying executable files.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-win_certificate
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WIN_CERTIFICATE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the length, in bytes, of the signature.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the certificate revision.
     * 
     * The only defined certificate revision is <b>WIN_CERT_REVISION_1_0 (0x0100)</b>.
     * @type {Integer}
     */
    wRevision {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the type of certificate.
     * 
     * <table>
     * <tr>
     * <th>Value </th>
     * <th>Description </th>
     * </tr>
     * <tr>
     * <td>WIN_CERT_TYPE_X509 (0x0001)</td>
     * <td>The <i>bCertificate</i> member contains an X.509 certificate.</td>
     * </tr>
     * <tr>
     * <td>WIN_CERT_TYPE_PKCS_SIGNED_DATA (0x0002)</td>
     * <td>The <i>bCertificate</i> member contains a PKCS <b>SignedData</b> structure.</td>
     * </tr>
     * <tr>
     * <td>WIN_CERT_TYPE_RESERVED_1 (0x0003)</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>WIN_CERT_TYPE_PKCS1_SIGN (0x0009)</td>
     * <td>The <i>bCertificate</i> member contains <b>PKCS1_MODULE_SIGN</b> fields.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wCertificateType {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * An array of certificates.
     * 
     * The format of this member depends on the value of <i>wCertificateType</i>.
     * @type {Array<Byte>}
     */
    bCertificate{
        get {
            if(!this.HasProp("__bCertificateProxyArray"))
                this.__bCertificateProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bCertificateProxyArray
        }
    }
}

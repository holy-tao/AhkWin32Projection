#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure encapsulates a signature used in verifying executable files.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-win_certificate
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WIN_CERTIFICATE {
    #StructPack 4

    /**
     * Specifies the length, in bytes, of the signature.
     */
    dwLength : UInt32

    /**
     * Specifies the certificate revision.
     * 
     * The only defined certificate revision is <b>WIN_CERT_REVISION_1_0 (0x0100)</b>.
     */
    wRevision : UInt16

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
     */
    wCertificateType : UInt16

    /**
     * An array of certificates.
     * 
     * The format of this member depends on the value of <i>wCertificateType</i>.
     */
    bCertificate : Int8[1]

}

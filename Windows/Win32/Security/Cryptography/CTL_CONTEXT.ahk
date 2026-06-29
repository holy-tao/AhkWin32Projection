#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\CTL_INFO.ahk" { CTL_INFO }

/**
 * The CTL_CONTEXT structure contains both the encoded and decoded representations of a CTL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_CONTEXT {
    #StructPack 8

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     */
    dwMsgAndCertEncodingType : UInt32

    /**
     * A pointer to the encoded CTL.
     */
    pbCtlEncoded : IntPtr

    /**
     * The size, in bytes, of the encoded CTL.
     */
    cbCtlEncoded : UInt32

    /**
     * A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_info">CTL_INFO</a> structure contain the CTL information.
     */
    pCtlInfo : CTL_INFO.Ptr

    /**
     * A handle to the certificate store.
     */
    hCertStore : HCERTSTORE

    /**
     * Open <b>HCRYPTMSG</b> handle to a decoded, cryptographic-signed message containing the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_info">CTL_INFO</a> as its <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a>.
     */
    hCryptMsg : IntPtr

    /**
     * The encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a> of the signed message.
     */
    pbCtlContent : IntPtr

    /**
     * Count, in bytes, of <b>pbCtlContent</b>.
     */
    cbCtlContent : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import "..\Cryptography\CMSG_SIGNER_INFO.ahk" { CMSG_SIGNER_INFO }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CRYPT_PROVIDER_CERT.ahk" { CRYPT_PROVIDER_CERT }

/**
 * Provides information about a signer or countersigner.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_sgnr
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_SGNR {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * The current time, or the time stamp.
     */
    sftVerifyAsOf : FILETIME

    /**
     * Number of elements in the <b>pasCertChain</b> array.
     */
    csCertChain : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_cert">CRYPT_PROVIDER_CERT</a> structures.
     */
    pasCertChain : CRYPT_PROVIDER_CERT.Ptr

    /**
     * Signer type, if known by the policy. This value is zero, if the signer type is unknown, or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SGNR_TYPE_TIMESTAMP"></a><a id="sgnr_type_timestamp"></a><dl>
     * <dt><b>SGNR_TYPE_TIMESTAMP</b></dt>
     * <dt>     0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamp signer.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwSignerType : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_info">CMSG_SIGNER_INFO</a> structure.
     */
    psSigner : CMSG_SIGNER_INFO.Ptr

    /**
     * Error value, if any, while building or verifying the signer.
     */
    dwError : UInt32

    /**
     * Number of elements in the <b>pasCounterSigners</b>  array.
     */
    csCounterSigners : UInt32

    /**
     * A pointer to an array of <b>CRYPT_PROVIDER_SGNR</b> structures that represent the countersigners.
     */
    pasCounterSigners : CRYPT_PROVIDER_SGNR.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structure.
     */
    pChainContext : CERT_CHAIN_CONTEXT.Ptr

}

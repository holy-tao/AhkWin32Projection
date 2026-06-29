#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Used by the CertSelectionGetSerializedBlob function to serialize the certificates contained in a store or an array of certificate chains. The returned serialized BLOB can be passed to the CredUIPromptForWindowsCredentials function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cert_selectui_input
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_SELECTUI_INPUT {
    #StructPack 8

    /**
     * The  handle of a certificate store created by the caller. The store contains the set of  application preselected certificates.
     */
    hStore : HCERTSTORE

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures. Applications provision this array by preselecting certificate chains using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a> function.
     */
    prgpChain : IntPtr

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures that are in the array pointed to by the <b>prgpChain</b> member.
     */
    cChain : UInt32

}

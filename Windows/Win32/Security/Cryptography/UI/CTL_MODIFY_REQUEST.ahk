#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CTL_MODIFY_REQUEST_OPERATION.ahk" { CTL_MODIFY_REQUEST_OPERATION }

/**
 * Contains a request to modify a certificate trust list (CTL). This structure is used in the CertModifyCertificatesToTrust function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/ns-cryptdlg-ctl_modify_request
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CTL_MODIFY_REQUEST {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate to change the trust on.
     */
    pccert : CERT_CONTEXT.Ptr

    dwOperation : CTL_MODIFY_REQUEST_OPERATION

    /**
     * The error code generated for this operation.
     */
    dwError : UInt32

}

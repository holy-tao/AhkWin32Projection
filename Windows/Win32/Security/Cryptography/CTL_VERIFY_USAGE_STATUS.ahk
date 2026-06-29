#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }

/**
 * Contains information about a Certificate Trust List (CTL) returned by CertVerifyCTLUsage.
 * @remarks
 * The members <b>dwError</b>, <b>dwFlags</b>, <b>dwCtlEntryIndex</b>, and <b>dwSignerIndex</b> should be initialized to zero by the calling application.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_verify_usage_status
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_VERIFY_USAGE_STATUS {
    #StructPack 8

    /**
     * The size, in bytes, of the structure. The application calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a> sets this parameter. If <b>cbSize</b> is not greater than or equal to the required size of the structure, <b>CertVerifyCTLUsage</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>E_INVALIDARG</b>.
     */
    cbSize : UInt32 := this.Size

    /**
     * The error status, if any, returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a>. For the list of possible error values, see the Return Values section in <b>CertVerifyCTLUsage</b>.
     */
    dwError : UInt32

    /**
     * If <b>CERT_VERIFY_UPDATED_CTL_FLAG</b> is returned, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a> updated a CTL whose time was no longer valid with a new, time-valid CTL.
     */
    dwFlags : UInt32

    /**
     * Pointer to a pointer to a CTL <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> containing the matched subject. The calling application can set this pointer to <b>NULL</b> to indicate that a CTL containing the subject is not to be returned. 
     * 
     * 
     * 
     * 
     * If <b>ppCtl</b> is not <b>NULL</b>, the calling application must free the returned context using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreectlcontext">CertFreeCTLContext</a>.
     */
    ppCtl : IntPtr

    /**
     * Returns the array location of the matching subject's entry in the CTL's array.
     */
    dwCtlEntryIndex : UInt32

    /**
     * A pointer to a pointer to the certificate context of the signer of the CTL. This pointer can be set to <b>NULL</b> by the calling application indicating that the certificate of the signer of the CTL is not to be returned. 
     * 
     * 
     * 
     * 
     * If <b>ppSigner</b> is not <b>NULL</b>, the calling application must free the returned context using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreectlcontext">CertFreeCTLContext</a>.
     */
    ppSigner : IntPtr

    /**
     * Index of the signer actually used. Needed if a message has more than one signer.
     */
    dwSignerIndex : UInt32

}

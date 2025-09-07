#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Certificate Trust List (CTL) returned by CertVerifyCTLUsage.
 * @remarks
 * The members <b>dwError</b>, <b>dwFlags</b>, <b>dwCtlEntryIndex</b>, and <b>dwSignerIndex</b> should be initialized to zero by the calling application.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_verify_usage_status
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_VERIFY_USAGE_STATUS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of the structure. The application calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a> sets this parameter. If <b>cbSize</b> is not greater than or equal to the required size of the structure, <b>CertVerifyCTLUsage</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>E_INVALIDARG</b>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The error status, if any, returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a>. For the list of possible error values, see the Return Values section in <b>CertVerifyCTLUsage</b>.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If <b>CERT_VERIFY_UPDATED_CTL_FLAG</b> is returned, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyctlusage">CertVerifyCTLUsage</a> updated a CTL whose time was no longer valid with a new, time-valid CTL.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a pointer to a CTL <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> containing the matched subject. The calling application can set this pointer to <b>NULL</b> to indicate that a CTL containing the subject is not to be returned. 
     * 
     * 
     * 
     * 
     * If <b>ppCtl</b> is not <b>NULL</b>, the calling application must free the returned context using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreectlcontext">CertFreeCTLContext</a>.
     * @type {Pointer<CTL_CONTEXT>}
     */
    ppCtl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Returns the array location of the matching subject's entry in the CTL's array.
     * @type {Integer}
     */
    dwCtlEntryIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a pointer to the certificate context of the signer of the CTL. This pointer can be set to <b>NULL</b> by the calling application indicating that the certificate of the signer of the CTL is not to be returned. 
     * 
     * 
     * 
     * 
     * If <b>ppSigner</b> is not <b>NULL</b>, the calling application must free the returned context using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreectlcontext">CertFreeCTLContext</a>.
     * @type {Pointer<CERT_CONTEXT>}
     */
    ppSigner {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Index of the signer actually used. Needed if a message has more than one signer.
     * @type {Integer}
     */
    dwSignerIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}

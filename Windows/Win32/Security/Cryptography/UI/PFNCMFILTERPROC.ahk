#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * Filters each certificate to determine whether it will appear in the certificate selection dialog box that is displayed by the CertSelectCertificate function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/nc-cryptdlg-pfncmfilterproc
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct PFNCMFILTERPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNCMFILTERPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext A pointer to a [CERT_CONTEXT](/windows/win32/api/wincrypt/ns-wincrypt-cert_context) structure that contains a certificate on which to make a filtering determination.
     * @param {LPARAM} param1 *dwDisplayWell*. Reserved for future use.
     * @param {Integer} param2 This `DWORD` parameter is *dwFlags*.
     * @param {Integer} param3 This `DWORD` parameter is *lCustData*. It is the address of an array of byte values that holds custom data. *lCustData* is passed to the **PFNCMFILTERPROC** function by the [CertSelectCertificate](nf-cryptdlg-certselectcertificatea.md) function.
     * @returns {BOOL} Return a nonzero value (**TRUE**) to display the certificate. Return zero (**FALSE**) to not display the certificate.
     */
    Call(pCertContext, param1, param2, param3) {
        result := DllCall(this.value, CERT_CONTEXT.Ptr, pCertContext, LPARAM, param1, UInt32, param2, UInt32, param3, BOOL)
        return result
    }

    /**
     * A PFNCMFILTERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCMFILTERPROC {
        /**
         * Creates a PFNCMFILTERPROC pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, LPARAM, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, LPARAM, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

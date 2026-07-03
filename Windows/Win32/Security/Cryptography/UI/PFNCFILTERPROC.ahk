#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * An application-defined callback function that filters the certificates that appear in the digital signature wizard that are displayed by the CryptUIWizDigitalSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nc-cryptuiapi-pfncfilterproc
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct PFNCFILTERPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNCFILTERPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate to filter.
     * @param {Pointer<BOOL>} pfInitialSelectedCert A Boolean value that specifies whether  the certificate contained in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure pointed to by the <i>pCertContext</i> parameter should be initially selected in the dialog box. This parameter is used only if the filter process returns <b>TRUE</b>.
     * @param {Pointer<Void>} pvCallbackData A pointer to user-defined data.
     * @returns {BOOL} A Boolean value that specifies whether the certificate contained in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure pointed to by the <i>pCertContext</i> parameter should be displayed in the digital signature wizard.
     */
    Call(pCertContext, pfInitialSelectedCert, pvCallbackData) {
        pfInitialSelectedCertMarshal := pfInitialSelectedCert is VarRef ? "int*" : "ptr"
        pvCallbackDataMarshal := pvCallbackData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CERT_CONTEXT.Ptr, pCertContext, pfInitialSelectedCertMarshal, pfInitialSelectedCert, pvCallbackDataMarshal, pvCallbackData, BOOL)
        return result
    }

    /**
     * A PFNCFILTERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCFILTERPROC {
        /**
         * Creates a PFNCFILTERPROC pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, BOOL, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, BOOL.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

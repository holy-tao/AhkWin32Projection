#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * An application-defined callback function that allows the application to filter certificates that might be added to the certificate chain.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_chain_find_by_issuer_callback
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate in question.
     * @param {Pointer<Void>} pvFindArg A pointer to an application-defined value. This is the same value that was passed in the <i>pvFindArg</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_find_by_issuer_para">CERT_CHAIN_FIND_BY_ISSUER_PARA</a> structure.
     * @returns {BOOL} Return <b>TRUE</b> to create a chain for the certificate specified in the <i>pCert</i> parameter, or <b>FALSE</b> otherwise.
     */
    Call(pCert, pvFindArg) {
        pvFindArgMarshal := pvFindArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CERT_CONTEXT.Ptr, pCert, pvFindArgMarshal, pvFindArg, BOOL)
        return result
    }

    /**
     * A PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK {
        /**
         * Creates a PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

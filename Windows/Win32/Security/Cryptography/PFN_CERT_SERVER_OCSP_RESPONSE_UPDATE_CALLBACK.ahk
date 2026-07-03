#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import ".\CERT_SERVER_OCSP_RESPONSE_CONTEXT.ahk" { CERT_SERVER_OCSP_RESPONSE_CONTEXT }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CHAIN_CONTEXT>} pChainContext 
     * @param {Pointer<CERT_SERVER_OCSP_RESPONSE_CONTEXT>} pServerOcspResponseContext 
     * @param {Pointer<CRL_CONTEXT>} pNewCrlContext 
     * @param {Pointer<CRL_CONTEXT>} pPrevCrlContext 
     * @param {Pointer<Void>} pvArg 
     * @param {Integer} dwWriteOcspFileError 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pChainContext, pServerOcspResponseContext, pNewCrlContext, pPrevCrlContext, pvArg, dwWriteOcspFileError) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CERT_CHAIN_CONTEXT.Ptr, pChainContext, CERT_SERVER_OCSP_RESPONSE_CONTEXT.Ptr, pServerOcspResponseContext, CRL_CONTEXT.Ptr, pNewCrlContext, CRL_CONTEXT.Ptr, pPrevCrlContext, pvArgMarshal, pvArg, UInt32, dwWriteOcspFileError)
    }

    /**
     * A PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK {
        /**
         * Creates a PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CHAIN_CONTEXT, CERT_SERVER_OCSP_RESPONSE_CONTEXT, CRL_CONTEXT, CRL_CONTEXT, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CHAIN_CONTEXT.Ptr, CERT_SERVER_OCSP_RESPONSE_CONTEXT.Ptr, CRL_CONTEXT.Ptr, CRL_CONTEXT.Ptr, "ptr", UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

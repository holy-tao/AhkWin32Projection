#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that is called by CertSetCRLContextProperty before setting the CRL's property.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_set_crl_property
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_SET_CRL_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_SET_CRL_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv Provider-specific value returned in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_store_prov_info">CERT_STORE_PROV_INFO</a> by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_dll_open_store_prov_func">CertDllOpenStoreProv</a>.
     * @param {Pointer<CRL_CONTEXT>} pCrlContext See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsetcrlcontextproperty">CertSetCRLContextProperty</a>.
     * @param {Integer} dwPropId See <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsetcrlcontextproperty">CertSetCRLContextProperty</a>.
     * @param {Integer} dwFlags Copy of the <i>dwFlags</i> passed as a parameter to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsetcrlcontextproperty">CertSetCRLContextProperty</a>.
     * @param {Pointer<Void>} pvData See <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsetcrlcontextproperty">CertSetCRLContextProperty</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if it is okay to set the property.
     */
    Call(hStoreProv, pCrlContext, dwPropId, dwFlags, pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CRL_CONTEXT.Ptr, pCrlContext, UInt32, dwPropId, UInt32, dwFlags, pvDataMarshal, pvData, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_SET_CRL_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_SET_CRL_PROPERTY {
        /**
         * Creates a PFN_CERT_STORE_PROV_SET_CRL_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CRL_CONTEXT, UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CRL_CONTEXT.Ptr, UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

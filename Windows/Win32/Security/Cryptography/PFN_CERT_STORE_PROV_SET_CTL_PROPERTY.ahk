#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * The CertStoreProvSetCTLProperty callback function determines whether a property can be set on a CTL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_set_ctl_property
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_SET_CTL_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_SET_CTL_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a>.
     * @param {Pointer<CTL_CONTEXT>} pCtlContext A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> structure.
     * @param {Integer} dwPropId Identifier of the property to be set.
     * @param {Integer} dwFlags Any needed flag values.
     * @param {Pointer<Void>} pvData A pointer to a buffer containing the property value to be set.
     * @returns {BOOL} Returns <b>TRUE</b> if the property can be set. Returns <b>FALSE</b> if the property cannot be set.
     */
    Call(hStoreProv, pCtlContext, dwPropId, dwFlags, pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CTL_CONTEXT.Ptr, pCtlContext, UInt32, dwPropId, UInt32, dwFlags, pvDataMarshal, pvData, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_SET_CTL_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_SET_CTL_PROPERTY {
        /**
         * Creates a PFN_CERT_STORE_PROV_SET_CTL_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CTL_CONTEXT, UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CTL_CONTEXT.Ptr, UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

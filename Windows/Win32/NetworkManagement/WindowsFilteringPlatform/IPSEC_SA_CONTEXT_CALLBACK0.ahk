#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_CONTEXT_CHANGE0.ahk" { IPSEC_SA_CONTEXT_CHANGE0 }

/**
 * Is used to add custom behavior to the IPsec security association (SA) context subscription process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextsubscribe0">IPsecSaContextSubscribe0</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-ipsec_sa_context_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT_CALLBACK0 {
    value : IntPtr

    __value {
        set {
            if (value is IPSEC_SA_CONTEXT_CALLBACK0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context Type: <b>void*</b>
     * 
     * Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextsubscribe0">IPsecSaContextSubscribe0</a> function.
     * @param {Pointer<IPSEC_SA_CONTEXT_CHANGE0>} change Type: **const [IPSEC_SA_CONTEXT_CHANGE0](/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_change0)\***
     * 
     * The IPsec SA context information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, change) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, IPSEC_SA_CONTEXT_CHANGE0.Ptr, change)
    }

    /**
     * A IPSEC_SA_CONTEXT_CALLBACK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IPSEC_SA_CONTEXT_CALLBACK0 {
        /**
         * Creates a IPSEC_SA_CONTEXT_CALLBACK0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IPSEC_SA_CONTEXT_CHANGE0) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IPSEC_SA_CONTEXT_CHANGE0.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

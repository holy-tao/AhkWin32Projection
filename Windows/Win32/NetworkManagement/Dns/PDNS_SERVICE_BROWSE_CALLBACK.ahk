#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_RECORDW.ahk" { DNS_RECORDW }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct PDNS_SERVICE_BROWSE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDNS_SERVICE_BROWSE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Status 
     * @param {Pointer<Void>} pQueryContext 
     * @param {Pointer<DNS_RECORDW>} pDnsRecord 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, pQueryContext, pDnsRecord) {
        pQueryContextMarshal := pQueryContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, _Status, pQueryContextMarshal, pQueryContext, DNS_RECORDW.Ptr, pDnsRecord)
    }

    /**
     * A PDNS_SERVICE_BROWSE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDNS_SERVICE_BROWSE_CALLBACK {
        /**
         * Creates a PDNS_SERVICE_BROWSE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", DNS_RECORDW) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", DNS_RECORDW.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

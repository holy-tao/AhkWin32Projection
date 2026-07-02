#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_CACHE_LOOKUP_FILE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_CACHE_LOOKUP_FILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCacheContext 
     * @param {PWSTR} wszTag 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
     */
    Call(pvCacheContext, wszTag, dwFlags, ppbData, pcbData) {
        wszTag := wszTag is String ? StrPtr(wszTag) : wszTag

        pvCacheContextMarshal := pvCacheContext is VarRef ? "ptr" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pvCacheContextMarshal, pvCacheContext, "ptr", wszTag, UInt32, dwFlags, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, UInt32)
        return result
    }

    /**
     * A PFN_CSP_CACHE_LOOKUP_FILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_CACHE_LOOKUP_FILE {
        /**
         * Creates a PFN_CSP_CACHE_LOOKUP_FILE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, "ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

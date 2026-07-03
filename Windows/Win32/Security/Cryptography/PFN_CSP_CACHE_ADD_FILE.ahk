#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_CACHE_ADD_FILE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_CACHE_ADD_FILE) {
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
     * @param {Integer} pbData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     */
    Call(pvCacheContext, wszTag, dwFlags, pbData, cbData) {
        wszTag := wszTag is String ? StrPtr(wszTag) : wszTag

        pvCacheContextMarshal := pvCacheContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCacheContextMarshal, pvCacheContext, "ptr", wszTag, UInt32, dwFlags, IntPtr, pbData, UInt32, cbData, UInt32)
        return result
    }

    /**
     * A PFN_CSP_CACHE_ADD_FILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_CACHE_ADD_FILE {
        /**
         * Creates a PFN_CSP_CACHE_ADD_FILE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, IntPtr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

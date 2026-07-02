#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_HSE_CACHE_INVALIDATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HSE_CACHE_INVALIDATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    Call(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := DllCall(this.value, "ptr", pszUrl, "HRESULT")
        return result
    }

    /**
     * A PFN_HSE_CACHE_INVALIDATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HSE_CACHE_INVALIDATION_CALLBACK {
        /**
         * Creates a PFN_HSE_CACHE_INVALIDATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

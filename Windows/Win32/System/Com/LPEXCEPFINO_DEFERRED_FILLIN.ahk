#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EXCEPINFO.ahk" { EXCEPINFO }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct LPEXCEPFINO_DEFERRED_FILLIN {
    value : IntPtr

    __value {
        set {
            if (value is LPEXCEPFINO_DEFERRED_FILLIN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @returns {HRESULT} 
     */
    Call(pExcepInfo) {
        result := DllCall(this.value, EXCEPINFO.Ptr, pExcepInfo, "HRESULT")
        return result
    }

    /**
     * A LPEXCEPFINO_DEFERRED_FILLIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPEXCEPFINO_DEFERRED_FILLIN {
        /**
         * Creates a LPEXCEPFINO_DEFERRED_FILLIN pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPINFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPINFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

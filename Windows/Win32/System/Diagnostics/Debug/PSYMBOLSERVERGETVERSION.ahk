#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\API_VERSION.ahk" { API_VERSION }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOLSERVERGETVERSION {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERGETVERSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<API_VERSION>} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, API_VERSION.Ptr, param0, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERGETVERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERGETVERSION {
        /**
         * Creates a PSYMBOLSERVERGETVERSION pointer that invokes the given AHK function when called.
         * @param {Func(API_VERSION) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [API_VERSION.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCISURFACEINFO.ahk" { DCISURFACEINFO }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ENUM_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is ENUM_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DCISURFACEINFO>} lpSurfaceInfo 
     * @param {Pointer<Void>} lpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpSurfaceInfo, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DCISURFACEINFO.Ptr, lpSurfaceInfo, lpContextMarshal, lpContext)
    }

    /**
     * A ENUM_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENUM_CALLBACK {
        /**
         * Creates a ENUM_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DCISURFACEINFO, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DCISURFACEINFO.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

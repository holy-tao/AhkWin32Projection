#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FDINOTIFICATION.ahk" { FDINOTIFICATION }
#Import ".\FDINOTIFICATIONTYPE.ahk" { FDINOTIFICATIONTYPE }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFDINOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFNFDINOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {FDINOTIFICATIONTYPE} fdint 
     * @param {Pointer<FDINOTIFICATION>} pfdin 
     * @returns {Pointer} 
     */
    Call(fdint, pfdin) {
        result := DllCall(this.value, FDINOTIFICATIONTYPE, fdint, FDINOTIFICATION.Ptr, pfdin, IntPtr)
        return result
    }

    /**
     * A PFNFDINOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFDINOTIFY {
        /**
         * Creates a PFNFDINOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(FDINOTIFICATIONTYPE, FDINOTIFICATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [FDINOTIFICATIONTYPE, FDINOTIFICATION.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback function for the MFAddPeriodicCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nc-mfapi-mfperiodiccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPERIODICCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is MFPERIODICCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} pContext Pointer to the <b>IUnknown</b> interface, or <b>NULL</b>. This pointer is specified by the caller in the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfaddperiodiccallback">MFAddPeriodicCallback</a> function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pContext) {
        DllCall(this.value, "ptr", pContext)
    }

    /**
     * A MFPERIODICCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MFPERIODICCALLBACK {
        /**
         * Creates a MFPERIODICCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }

/**
 * The capYieldCallback function is the yield callback function used with video capture. The name capYieldCallback is a placeholder for the application-supplied function name.
 * @remarks
 * The capture window calls the yield callback function at least once for every captured video frame, but the exact rate depends on the frame rate and the overhead of the capture driver and disk.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nc-vfw-capyieldcallback
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPYIELDCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CAPYIELDCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hWnd Handle to the capture window associated with the callback function.
     * @returns {LRESULT} 
     */
    Call(_hWnd) {
        result := DllCall(this.value, HWND, _hWnd, LRESULT)
        return result
    }

    /**
     * A CAPYIELDCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CAPYIELDCALLBACK {
        /**
         * Creates a CAPYIELDCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, LRESULT])
        }

        __Delete() => CallbackFree(this.value)
    }
}

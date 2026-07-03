#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }

/**
 * The capControlCallback function is the callback function used for precision control to begin and end streaming capture. The name capControlCallback is a placeholder for the application-supplied function name.
 * @remarks
 * The first message sent to the callback procedure sets the <i>nState</i> parameter to CONTROLCALLBACK_PREROLL after allocating all buffers and all other capture preparations are complete.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nc-vfw-capcontrolcallback
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPCONTROLCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CAPCONTROLCALLBACK) {
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
     * @param {Integer} nState Current state of the capture operation. The CONTROLCALLBACK_PREROLL value is sent initially to enable prerolling of the video sources and to return control to the capture application at the exact moment recording is to begin. The CONTROLCALLBACK_CAPTURING value is sent once per captured frame to indicate that streaming capture is in progress and to enable the application to end capture.
     * @returns {LRESULT} When <i>nState</i> is set to CONTROLCALLBACK_PREROLL, this callback function must return <b>TRUE</b> to start capture or <b>FALSE</b> to abort it. When <i>nState</i> is set to CONTROLCALLBACK_CAPTURING, this callback function must return <b>TRUE</b> to continue capture or <b>FALSE</b> to end it.
     */
    Call(_hWnd, nState) {
        result := DllCall(this.value, HWND, _hWnd, Int32, nState, LRESULT)
        return result
    }

    /**
     * A CAPCONTROLCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CAPCONTROLCALLBACK {
        /**
         * Creates a CAPCONTROLCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, Int32) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, Int32, LRESULT])
        }

        __Delete() => CallbackFree(this.value)
    }
}

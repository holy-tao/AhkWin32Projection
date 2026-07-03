#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\VIDEOHDR.ahk" { VIDEOHDR }

/**
 * The capVideoStreamCallback function is the callback function used with streaming capture to optionally process a frame of captured video. The name capVideoStreamCallback is a placeholder for the application-supplied function name.
 * @remarks
 * The capture window calls a video stream callback function when a video buffer is marked done by the capture driver. When capturing to disk, this will precede the disk write operation.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nc-vfw-capvideocallback
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPVIDEOCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CAPVIDEOCALLBACK) {
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
     * @param {Pointer<VIDEOHDR>} lpVHdr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-videohdr">VIDEOHDR</a> structure containing information about the captured frame.
     * @returns {LRESULT} 
     */
    Call(_hWnd, lpVHdr) {
        result := DllCall(this.value, HWND, _hWnd, VIDEOHDR.Ptr, lpVHdr, LRESULT)
        return result
    }

    /**
     * A CAPVIDEOCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CAPVIDEOCALLBACK {
        /**
         * Creates a CAPVIDEOCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, VIDEOHDR) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, VIDEOHDR.Ptr, LRESULT])
        }

        __Delete() => CallbackFree(this.value)
    }
}

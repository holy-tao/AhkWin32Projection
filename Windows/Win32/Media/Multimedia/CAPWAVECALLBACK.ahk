#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\Audio\WAVEHDR.ahk" { WAVEHDR }

/**
 * The capWaveStreamCallback function is the callback function used with streaming capture to optionally process buffers of audio data. The name capWaveStreamCallback is a placeholder for the application-supplied function name.
 * @remarks
 * The capture window calls a wave stream callback function when an audio buffer is marked done by the waveform-audio driver. When capturing to disk, this will precede the disk write operation.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nc-vfw-capwavecallback
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPWAVECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CAPWAVECALLBACK) {
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
     * @param {Pointer<WAVEHDR>} lpWHdr Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure containing information about the captured audio data.
     * @returns {LRESULT} 
     */
    Call(_hWnd, lpWHdr) {
        result := DllCall(this.value, HWND, _hWnd, WAVEHDR.Ptr, lpWHdr, LRESULT)
        return result
    }

    /**
     * A CAPWAVECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CAPWAVECALLBACK {
        /**
         * Creates a CAPWAVECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, WAVEHDR) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, WAVEHDR.Ptr, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

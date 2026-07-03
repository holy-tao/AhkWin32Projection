#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The capStatusCallback function is the status callback function used with video capture. The name capStatusCallback is a placeholder for the application-supplied function name. (Unicode)
 * @remarks
 * During capture operations, the first message sent to the callback function is always IDS_CAP_BEGIN and the last is always IDS_CAP_END. A message identifier of zero indicates a new operation is starting and the callback function should clear the current status.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines CAPSTATUSCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nc-vfw-capstatuscallbackw
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct CAPSTATUSCALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is CAPSTATUSCALLBACKW) {
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
     * @param {Integer} nID Message identification number.
     * @param {PWSTR} lpsz Pointer to a textual description of the returned status.
     * @returns {LRESULT} 
     */
    Call(_hWnd, nID, lpsz) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall(this.value, HWND, _hWnd, Int32, nID, "ptr", lpsz, LRESULT)
        return result
    }

    /**
     * A CAPSTATUSCALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CAPSTATUSCALLBACKW {
        /**
         * Creates a CAPSTATUSCALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(HWND, Int32, PWSTR) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, Int32, PWSTR, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

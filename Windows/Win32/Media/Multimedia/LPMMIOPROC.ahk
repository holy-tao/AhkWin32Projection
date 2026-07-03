#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct LPMMIOPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPMMIOPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpmmioinfo 
     * @param {Integer} uMsg 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {LRESULT} 
     */
    Call(lpmmioinfo, uMsg, lParam1, lParam2) {
        lpmmioinfo := lpmmioinfo is String ? StrPtr(lpmmioinfo) : lpmmioinfo

        result := DllCall(this.value, "ptr", lpmmioinfo, UInt32, uMsg, LPARAM, lParam1, LPARAM, lParam2, LRESULT)
        return result
    }

    /**
     * A LPMMIOPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMMIOPROC {
        /**
         * Creates a LPMMIOPROC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt32, LPARAM, LPARAM) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt32, LPARAM, LPARAM, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

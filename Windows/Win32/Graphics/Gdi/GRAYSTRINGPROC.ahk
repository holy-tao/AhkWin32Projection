#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HDC.ahk" { HDC }

/**
 * The OutputProc function is an application-defined callback function used with the GrayString function.
 * @remarks
 * The callback function must draw an image relative to the coordinates (0,0).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-graystringproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GRAYSTRINGPROC {
    value : IntPtr

    __value {
        set {
            if (value is GRAYSTRINGPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} param0 A handle to a device context with a bitmap of at least the width and height specified by the <i>nWidth</i> and <i>nHeight</i> parameters passed to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-graystringa">GrayString</a>.
     * @param {LPARAM} param1 A pointer to the string to be drawn.
     * @param {Integer} param2 The length, in characters, of the string.
     * @returns {BOOL} If it succeeds, the callback function should return <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HDC, param0, LPARAM, param1, Int32, param2, BOOL)
        return result
    }

    /**
     * A GRAYSTRINGPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GRAYSTRINGPROC {
        /**
         * Creates a GRAYSTRINGPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, LPARAM, Int32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, LPARAM, Int32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

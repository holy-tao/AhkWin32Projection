#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HDC.ahk" { HDC }

/**
 * The DrawStateProc function is an application-defined callback function that renders a complex image for the DrawState function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-drawstateproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAWSTATEPROC {
    value : IntPtr

    __value {
        set {
            if (value is DRAWSTATEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} _hdc A handle to the device context to draw in. The device context is a memory device context with a bitmap selected, the dimensions of which are at least as great as those specified by the <i>cx</i> and <i>cy</i> parameters.
     * @param {LPARAM} lData Specifies information about the image, which the application passed to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawstatea">DrawState</a>.
     * @param {WPARAM} wData Specifies information about the image, which the application passed to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawstatea">DrawState</a>.
     * @param {Integer} cx The image width, in device units, as specified by the call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawstatea">DrawState</a>.
     * @param {Integer} _cy The image height, in device units, as specified by the call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawstatea">DrawState</a>.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     */
    Call(_hdc, lData, wData, cx, _cy) {
        result := DllCall(this.value, HDC, _hdc, LPARAM, lData, WPARAM, wData, Int32, cx, Int32, _cy, BOOL)
        return result
    }

    /**
     * A DRAWSTATEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRAWSTATEPROC {
        /**
         * Creates a DRAWSTATEPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, LPARAM, WPARAM, Int32, Int32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, LPARAM, WPARAM, Int32, Int32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

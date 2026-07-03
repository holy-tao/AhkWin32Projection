#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Defines the prototype for the callback function used by RemoveWindowSubclass and SetWindowSubclass.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nc-commctrl-subclassproc
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SUBCLASSPROC {
    value : IntPtr

    __value {
        set {
            if (value is SUBCLASSPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hWnd Type: <b>HWND</b>
     * 
     * The handle to the subclassed window.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message being passed.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional message information. The contents of this parameter depend on the value of <i>uMsg</i>.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional message information. The contents of this parameter depend on the value of <i>uMsg</i>.
     * @param {Pointer} uIdSubclass Type: <b>UINT_PTR</b>
     * 
     * The subclass ID.
     * @param {Pointer} dwRefData Type: <b>DWORD_PTR</b>
     * 
     * The reference data provided to the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-setwindowsubclass">SetWindowSubclass</a> function. This can be used to associate the subclass instance with a "this" pointer.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value is the result of the message processing and depends on the message sent.
     */
    Call(_hWnd, uMsg, _wParam, _lParam, uIdSubclass, dwRefData) {
        result := DllCall(this.value, HWND, _hWnd, UInt32, uMsg, WPARAM, _wParam, LPARAM, _lParam, IntPtr, uIdSubclass, IntPtr, dwRefData, LRESULT)
        return result
    }

    /**
     * A SUBCLASSPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SUBCLASSPROC {
        /**
         * Creates a SUBCLASSPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM, IntPtr, IntPtr) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, IntPtr, IntPtr, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

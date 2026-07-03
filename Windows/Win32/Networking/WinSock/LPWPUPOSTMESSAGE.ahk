#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUPOSTMESSAGE {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUPOSTMESSAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} _Msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} 
     */
    Call(_hWnd, _Msg, _wParam, _lParam) {
        result := DllCall(this.value, HWND, _hWnd, UInt32, _Msg, WPARAM, _wParam, LPARAM, _lParam, BOOL)
        return result
    }

    /**
     * A LPWPUPOSTMESSAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUPOSTMESSAGE {
        /**
         * Creates a LPWPUPOSTMESSAGE pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IDirectDrawClipper.ahk" { IDirectDrawClipper }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPCLIPPERCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPCLIPPERCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirectDrawClipper} lpDDClipper 
     * @param {HWND} _hWnd 
     * @param {Integer} code 
     * @param {Pointer<Void>} lpContext 
     * @returns {Integer} 
     */
    Call(lpDDClipper, _hWnd, code, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpDDClipper, HWND, _hWnd, UInt32, code, lpContextMarshal, lpContext, UInt32)
        return result
    }

    /**
     * A LPCLIPPERCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCLIPPERCALLBACK {
        /**
         * Creates a LPCLIPPERCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HWND, UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HWND, UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LPDDENUMCALLBACKEXW.ahk" { LPDDENUMCALLBACKEXW }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @charset Unicode
 */
export default struct LPDIRECTDRAWENUMERATEEXW {
    value : IntPtr

    __value {
        set {
            if (value is LPDIRECTDRAWENUMERATEEXW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LPDDENUMCALLBACKEXW>} lpCallback 
     * @param {Pointer<Void>} lpContext 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(lpCallback, lpContext, dwFlags) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LPDDENUMCALLBACKEXW, lpCallback, lpContextMarshal, lpContext, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A LPDIRECTDRAWENUMERATEEXW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIRECTDRAWENUMERATEEXW {
        /**
         * Creates a LPDIRECTDRAWENUMERATEEXW pointer that invokes the given AHK function when called.
         * @param {Func(LPDDENUMCALLBACKEXW, "ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPDDENUMCALLBACKEXW, "ptr", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

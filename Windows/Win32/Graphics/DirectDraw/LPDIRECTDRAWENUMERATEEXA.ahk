#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDENUMCALLBACKEXA.ahk" { LPDDENUMCALLBACKEXA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @charset ANSI
 */
export default struct LPDIRECTDRAWENUMERATEEXA {
    value : IntPtr

    __value {
        set {
            if (value is LPDIRECTDRAWENUMERATEEXA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LPDDENUMCALLBACKEXA>} lpCallback 
     * @param {Pointer<Void>} lpContext 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(lpCallback, lpContext, dwFlags) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LPDDENUMCALLBACKEXA, lpCallback, lpContextMarshal, lpContext, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A LPDIRECTDRAWENUMERATEEXA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIRECTDRAWENUMERATEEXA {
        /**
         * Creates a LPDIRECTDRAWENUMERATEEXA pointer that invokes the given AHK function when called.
         * @param {Func(LPDDENUMCALLBACKEXA, "ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPDDENUMCALLBACKEXA, "ptr", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

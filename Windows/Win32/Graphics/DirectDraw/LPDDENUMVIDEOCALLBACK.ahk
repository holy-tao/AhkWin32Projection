#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDVIDEOPORTCAPS.ahk" { DDVIDEOPORTCAPS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMVIDEOCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMVIDEOCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTCAPS>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DDVIDEOPORTCAPS.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A LPDDENUMVIDEOCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMVIDEOCALLBACK {
        /**
         * Creates a LPDDENUMVIDEOCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DDVIDEOPORTCAPS, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDVIDEOPORTCAPS.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

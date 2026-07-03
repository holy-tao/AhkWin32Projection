#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDGAMMARAMP.ahk" { DDGAMMARAMP }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDGAMMACALIBRATORPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPDDGAMMACALIBRATORPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDGAMMARAMP>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, DDGAMMARAMP.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A LPDDGAMMACALIBRATORPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDGAMMACALIBRATORPROC {
        /**
         * Creates a LPDDGAMMACALIBRATORPROC pointer that invokes the given AHK function when called.
         * @param {Func(DDGAMMARAMP, "char*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDGAMMARAMP.Ptr, "char*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

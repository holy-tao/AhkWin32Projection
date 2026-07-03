#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PCOGETCALLSTATE {
    value : IntPtr

    __value {
        set {
            if (value is PCOGETCALLSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, Int32, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A PCOGETCALLSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCOGETCALLSTATE {
        /**
         * Creates a PCOGETCALLSTATE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HRECOCONTEXT.ahk" { HRECOCONTEXT }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct PfnRecoCallback {
    value : IntPtr

    __value {
        set {
            if (value is PfnRecoCallback) {
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
     * @param {HRECOCONTEXT} param2 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, param0, param1Marshal, param1, HRECOCONTEXT, param2, "HRESULT")
        return result
    }

    /**
     * A PfnRecoCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PfnRecoCallback {
        /**
         * Creates a PfnRecoCallback pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*", HRECOCONTEXT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", HRECOCONTEXT, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct LPD3DVALIDATECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DVALIDATECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpUserArg 
     * @param {Integer} dwOffset 
     * @returns {HRESULT} 
     */
    Call(lpUserArg, dwOffset) {
        lpUserArgMarshal := lpUserArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, lpUserArgMarshal, lpUserArg, UInt32, dwOffset, "HRESULT")
        return result
    }

    /**
     * A LPD3DVALIDATECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DVALIDATECALLBACK {
        /**
         * Creates a LPD3DVALIDATECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

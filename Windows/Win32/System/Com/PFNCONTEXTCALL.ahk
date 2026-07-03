#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ComCallData.ahk" { ComCallData }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct PFNCONTEXTCALL {
    value : IntPtr

    __value {
        set {
            if (value is PFNCONTEXTCALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<ComCallData>} pParam 
     * @returns {HRESULT} 
     */
    Call(pParam) {
        result := DllCall(this.value, ComCallData.Ptr, pParam, "HRESULT")
        return result
    }

    /**
     * A PFNCONTEXTCALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCONTEXTCALL {
        /**
         * Creates a PFNCONTEXTCALL pointer that invokes the given AHK function when called.
         * @param {Func(ComCallData) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [ComCallData.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

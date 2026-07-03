#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslFreeBufferFn {
    value : IntPtr

    __value {
        set {
            if (value is SslFreeBufferFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvInput 
     * @returns {HRESULT} 
     */
    Call(pvInput) {
        pvInputMarshal := pvInput is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvInputMarshal, pvInput, "HRESULT")
        return result
    }

    /**
     * A SslFreeBufferFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslFreeBufferFn {
        /**
         * Creates a SslFreeBufferFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

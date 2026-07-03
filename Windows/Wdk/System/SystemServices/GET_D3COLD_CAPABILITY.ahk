#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_D3COLD_CAPABILITY {
    value : IntPtr

    __value {
        set {
            if (value is GET_D3COLD_CAPABILITY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<BOOLEAN>} D3ColdSupported 
     * @returns {NTSTATUS} 
     */
    Call(_Context, D3ColdSupported) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        D3ColdSupportedMarshal := D3ColdSupported is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, D3ColdSupportedMarshal, D3ColdSupported, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GET_D3COLD_CAPABILITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_D3COLD_CAPABILITY {
        /**
         * Creates a GET_D3COLD_CAPABILITY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

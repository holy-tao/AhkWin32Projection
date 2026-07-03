#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_SETDYNAMICCODETRUST_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_SETDYNAMICCODETRUST_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hFileHandle 
     * @returns {HRESULT} 
     */
    Call(hFileHandle) {
        result := DllCall(this.value, HANDLE, hFileHandle, "HRESULT")
        return result
    }

    /**
     * A PWLDP_SETDYNAMICCODETRUST_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_SETDYNAMICCODETRUST_API {
        /**
         * Creates a PWLDP_SETDYNAMICCODETRUST_API pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

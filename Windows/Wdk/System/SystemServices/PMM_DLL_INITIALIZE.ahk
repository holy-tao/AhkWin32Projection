#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PMM_DLL_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is PMM_DLL_INITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @returns {NTSTATUS} 
     */
    Call(RegistryPath) {
        result := DllCall(this.value, UNICODE_STRING.Ptr, RegistryPath, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PMM_DLL_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMM_DLL_INITIALIZE {
        /**
         * Creates a PMM_DLL_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

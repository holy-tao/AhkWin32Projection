#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspSetPagingModeFn {
    value : IntPtr

    __value {
        set {
            if (value is KspSetPagingModeFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} PagingMode 
     * @returns {NTSTATUS} 
     */
    Call(PagingMode) {
        result := DllCall(this.value, BOOLEAN, PagingMode, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspSetPagingModeFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspSetPagingModeFn {
        /**
         * Creates a KspSetPagingModeFn pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

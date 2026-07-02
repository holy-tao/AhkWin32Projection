#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_KERNEL_FUNCTIONS.ahk" { SECPKG_KERNEL_FUNCTIONS }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspInitPackageFn {
    value : IntPtr

    __value {
        set {
            if (value is KspInitPackageFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_KERNEL_FUNCTIONS>} FunctionTable 
     * @returns {NTSTATUS} 
     */
    Call(FunctionTable) {
        result := DllCall(this.value, SECPKG_KERNEL_FUNCTIONS.Ptr, FunctionTable, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspInitPackageFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspInitPackageFn {
        /**
         * Creates a KspInitPackageFn pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_KERNEL_FUNCTIONS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_KERNEL_FUNCTIONS.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

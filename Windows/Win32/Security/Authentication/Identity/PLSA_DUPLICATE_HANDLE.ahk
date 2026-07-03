#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_DUPLICATE_HANDLE {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_DUPLICATE_HANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} SourceHandle 
     * @param {Pointer<HANDLE>} DestionationHandle 
     * @returns {NTSTATUS} 
     */
    Call(SourceHandle, DestionationHandle) {
        result := DllCall(this.value, HANDLE, SourceHandle, HANDLE.Ptr, DestionationHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_DUPLICATE_HANDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_DUPLICATE_HANDLE {
        /**
         * Creates a PLSA_DUPLICATE_HANDLE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

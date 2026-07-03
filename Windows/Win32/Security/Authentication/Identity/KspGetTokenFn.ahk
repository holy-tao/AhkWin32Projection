#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspGetTokenFn {
    value : IntPtr

    __value {
        set {
            if (value is KspGetTokenFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextId 
     * @param {Pointer<HANDLE>} ImpersonationToken 
     * @param {Pointer<Pointer<Void>>} RawToken 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, ImpersonationToken, RawToken) {
        RawTokenMarshal := RawToken is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, HANDLE.Ptr, ImpersonationToken, RawTokenMarshal, RawToken, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspGetTokenFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspGetTokenFn {
        /**
         * Creates a KspGetTokenFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, HANDLE, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, HANDLE.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

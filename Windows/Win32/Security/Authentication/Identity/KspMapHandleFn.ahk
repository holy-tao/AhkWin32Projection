#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspMapHandleFn {
    value : IntPtr

    __value {
        set {
            if (value is KspMapHandleFn) {
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
     * @param {Pointer<Pointer>} LsaContextId 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, LsaContextId) {
        LsaContextIdMarshal := LsaContextId is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, LsaContextIdMarshal, LsaContextId, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspMapHandleFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspMapHandleFn {
        /**
         * Creates a KspMapHandleFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

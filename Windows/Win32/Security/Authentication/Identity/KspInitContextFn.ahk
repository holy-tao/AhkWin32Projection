#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspInitContextFn {
    value : IntPtr

    __value {
        set {
            if (value is KspInitContextFn) {
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
     * @param {Pointer<SecBuffer>} ContextData 
     * @param {Pointer<Pointer>} NewContextId 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, ContextData, NewContextId) {
        NewContextIdMarshal := NewContextId is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, SecBuffer.Ptr, ContextData, NewContextIdMarshal, NewContextId, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspInitContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspInitContextFn {
        /**
         * Creates a KspInitContextFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBuffer, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBuffer.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

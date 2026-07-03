#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspCompleteTokenFn {
    value : IntPtr

    __value {
        set {
            if (value is KspCompleteTokenFn) {
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
     * @param {Pointer<SecBufferDesc>} Token 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, Token) {
        result := DllCall(this.value, IntPtr, ContextId, SecBufferDesc.Ptr, Token, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspCompleteTokenFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspCompleteTokenFn {
        /**
         * Creates a KspCompleteTokenFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBufferDesc) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBufferDesc.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

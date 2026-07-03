#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HANDLE.ahk" { BCRYPT_HANDLE }
#Import ".\BCRYPT_MULTI_OPERATION_TYPE.ahk" { BCRYPT_MULTI_OPERATION_TYPE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptProcessMultiOperationsFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptProcessMultiOperationsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_HANDLE} hObject 
     * @param {BCRYPT_MULTI_OPERATION_TYPE} operationType 
     * @param {Integer} pOperations 
     * @param {Integer} cbOperations 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hObject, operationType, pOperations, cbOperations, dwFlags) {
        result := DllCall(this.value, BCRYPT_HANDLE, hObject, BCRYPT_MULTI_OPERATION_TYPE, operationType, IntPtr, pOperations, UInt32, cbOperations, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptProcessMultiOperationsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptProcessMultiOperationsFn {
        /**
         * Creates a BCryptProcessMultiOperationsFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HANDLE, BCRYPT_MULTI_OPERATION_TYPE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HANDLE, BCRYPT_MULTI_OPERATION_TYPE, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

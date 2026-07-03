#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FS_FILTER_CALLBACK_DATA.ahk" { FS_FILTER_CALLBACK_DATA }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFS_FILTER_COMPLETION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFS_FILTER_COMPLETION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FS_FILTER_CALLBACK_DATA>} Data 
     * @param {NTSTATUS} OperationStatus 
     * @param {Pointer<Void>} CompletionContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Data, OperationStatus, CompletionContext) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FS_FILTER_CALLBACK_DATA.Ptr, Data, NTSTATUS, OperationStatus, CompletionContextMarshal, CompletionContext)
    }

    /**
     * A PFS_FILTER_COMPLETION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFS_FILTER_COMPLETION_CALLBACK {
        /**
         * Creates a PFS_FILTER_COMPLETION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FS_FILTER_CALLBACK_DATA, NTSTATUS, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FS_FILTER_CALLBACK_DATA.Ptr, NTSTATUS, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FS_FILTER_CALLBACK_DATA.ahk" { FS_FILTER_CALLBACK_DATA }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFS_FILTER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFS_FILTER_CALLBACK) {
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
     * @param {Pointer<Pointer<Void>>} CompletionContext 
     * @returns {NTSTATUS} 
     */
    Call(Data, CompletionContext) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, FS_FILTER_CALLBACK_DATA.Ptr, Data, CompletionContextMarshal, CompletionContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFS_FILTER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFS_FILTER_CALLBACK {
        /**
         * Creates a PFS_FILTER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FS_FILTER_CALLBACK_DATA, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FS_FILTER_CALLBACK_DATA.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

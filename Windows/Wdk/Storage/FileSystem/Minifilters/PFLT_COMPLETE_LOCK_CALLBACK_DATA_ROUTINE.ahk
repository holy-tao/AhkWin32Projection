#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    Call(_Context, CallbackData) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE {
        /**
         * Creates a PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FLT_CALLBACK_DATA) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FLT_CALLBACK_DATA.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

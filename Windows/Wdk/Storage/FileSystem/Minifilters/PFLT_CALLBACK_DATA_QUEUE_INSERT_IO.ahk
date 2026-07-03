#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\FLT_CALLBACK_DATA_QUEUE.ahk" { FLT_CALLBACK_DATA_QUEUE }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CALLBACK_DATA_QUEUE_INSERT_IO {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CALLBACK_DATA_QUEUE_INSERT_IO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Pointer<FLT_CALLBACK_DATA>} Cbd 
     * @param {Pointer<Void>} InsertContext 
     * @returns {NTSTATUS} 
     */
    Call(Cbdq, Cbd, InsertContext) {
        InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, FLT_CALLBACK_DATA.Ptr, Cbd, InsertContextMarshal, InsertContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_CALLBACK_DATA_QUEUE_INSERT_IO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CALLBACK_DATA_QUEUE_INSERT_IO {
        /**
         * Creates a PFLT_CALLBACK_DATA_QUEUE_INSERT_IO pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA_QUEUE, FLT_CALLBACK_DATA, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA_QUEUE.Ptr, FLT_CALLBACK_DATA.Ptr, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

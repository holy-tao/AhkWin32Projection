#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_TRANSACTION_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_TRANSACTION_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {PFLT_CONTEXT} _TransactionContext 
     * @param {Integer} NotificationMask 
     * @returns {NTSTATUS} 
     */
    Call(FltObjects, _TransactionContext, NotificationMask) {
        result := DllCall(this.value, FLT_RELATED_OBJECTS.Ptr, FltObjects, PFLT_CONTEXT, _TransactionContext, UInt32, NotificationMask, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFLT_TRANSACTION_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_TRANSACTION_NOTIFICATION_CALLBACK {
        /**
         * Creates a PFLT_TRANSACTION_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_RELATED_OBJECTS, PFLT_CONTEXT, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_RELATED_OBJECTS.Ptr, PFLT_CONTEXT, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

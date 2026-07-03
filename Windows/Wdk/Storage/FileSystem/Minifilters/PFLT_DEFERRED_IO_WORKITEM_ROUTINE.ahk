#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\PFLT_DEFERRED_IO_WORKITEM.ahk" { PFLT_DEFERRED_IO_WORKITEM }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_DEFERRED_IO_WORKITEM_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_DEFERRED_IO_WORKITEM_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_DEFERRED_IO_WORKITEM} FltWorkItem 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FltWorkItem, CallbackData, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PFLT_DEFERRED_IO_WORKITEM, FltWorkItem, FLT_CALLBACK_DATA.Ptr, CallbackData, _ContextMarshal, _Context)
    }

    /**
     * A PFLT_DEFERRED_IO_WORKITEM_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_DEFERRED_IO_WORKITEM_ROUTINE {
        /**
         * Creates a PFLT_DEFERRED_IO_WORKITEM_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_DEFERRED_IO_WORKITEM, FLT_CALLBACK_DATA, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_DEFERRED_IO_WORKITEM, FLT_CALLBACK_DATA.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

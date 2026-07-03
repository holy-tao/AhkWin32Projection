#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_GENERIC_WORKITEM.ahk" { PFLT_GENERIC_WORKITEM }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_GENERIC_WORKITEM_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_GENERIC_WORKITEM_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_GENERIC_WORKITEM} FltWorkItem 
     * @param {Pointer<Void>} FltObject 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FltWorkItem, FltObject, _Context) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PFLT_GENERIC_WORKITEM, FltWorkItem, FltObjectMarshal, FltObject, _ContextMarshal, _Context)
    }

    /**
     * A PFLT_GENERIC_WORKITEM_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_GENERIC_WORKITEM_ROUTINE {
        /**
         * Creates a PFLT_GENERIC_WORKITEM_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_GENERIC_WORKITEM, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_GENERIC_WORKITEM, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

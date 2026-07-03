#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PIO_WORKITEM.ahk" { PIO_WORKITEM }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_WORKITEM_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is IO_WORKITEM_ROUTINE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} IoObject 
     * @param {Pointer<Void>} _Context 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(IoObject, _Context, IoWorkItem) {
        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IoObjectMarshal, IoObject, _ContextMarshal, _Context, PIO_WORKITEM, IoWorkItem)
    }

    /**
     * A IO_WORKITEM_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_WORKITEM_ROUTINE_EX {
        /**
         * Creates a IO_WORKITEM_ROUTINE_EX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", PIO_WORKITEM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", PIO_WORKITEM, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

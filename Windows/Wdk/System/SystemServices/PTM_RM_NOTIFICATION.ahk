#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KENLISTMENT.ahk" { KENLISTMENT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_RM_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PTM_RM_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} EnlistmentObject 
     * @param {Pointer<Void>} RMContext 
     * @param {Pointer<Void>} _TransactionContext 
     * @param {Integer} TransactionNotification 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @param {Integer} ArgumentLength 
     * @param {Pointer<Void>} Argument 
     * @returns {NTSTATUS} 
     */
    Call(EnlistmentObject, RMContext, _TransactionContext, TransactionNotification, TmVirtualClock, ArgumentLength, Argument) {
        EnlistmentObjectMarshal := EnlistmentObject is VarRef ? "ptr*" : "ptr"
        RMContextMarshal := RMContext is VarRef ? "ptr" : "ptr"
        _TransactionContextMarshal := _TransactionContext is VarRef ? "ptr" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"
        ArgumentMarshal := Argument is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EnlistmentObjectMarshal, EnlistmentObject, RMContextMarshal, RMContext, _TransactionContextMarshal, _TransactionContext, UInt32, TransactionNotification, TmVirtualClockMarshal, TmVirtualClock, UInt32, ArgumentLength, ArgumentMarshal, Argument, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PTM_RM_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTM_RM_NOTIFICATION {
        /**
         * Creates a PTM_RM_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(KENLISTMENT, "ptr", "ptr", UInt32, "int64*", UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KENLISTMENT.Ptr, "ptr", "ptr", UInt32, "int64*", UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

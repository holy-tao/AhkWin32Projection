#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KDPC.ahk" { KDPC }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KDEFERRED_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KDEFERRED_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<Void>} DeferredContext 
     * @param {Pointer<Void>} SystemArgument1 
     * @param {Pointer<Void>} SystemArgument2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Dpc, DeferredContext, SystemArgument1, SystemArgument2) {
        DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"
        SystemArgument1Marshal := SystemArgument1 is VarRef ? "ptr" : "ptr"
        SystemArgument2Marshal := SystemArgument2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, KDPC.Ptr, Dpc, DeferredContextMarshal, DeferredContext, SystemArgument1Marshal, SystemArgument1, SystemArgument2Marshal, SystemArgument2)
    }

    /**
     * A KDEFERRED_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KDEFERRED_ROUTINE {
        /**
         * Creates a KDEFERRED_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(KDPC, "ptr", "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KDPC.Ptr, "ptr", "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Threading\INIT_ONCE.ahk" { INIT_ONCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_RUN_ONCE_INIT_FN {
    value : IntPtr

    __value {
        set {
            if (value is RTL_RUN_ONCE_INIT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} RunOnce 
     * @param {Pointer<Void>} Parameter 
     * @param {Pointer<Pointer<Void>>} _Context 
     * @returns {Integer} 
     */
    Call(RunOnce, Parameter, _Context) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, INIT_ONCE.Ptr, RunOnce, ParameterMarshal, Parameter, _ContextMarshal, _Context, UInt32)
        return result
    }

    /**
     * A RTL_RUN_ONCE_INIT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_RUN_ONCE_INIT_FN {
        /**
         * Creates a RTL_RUN_ONCE_INIT_FN pointer that invokes the given AHK function when called.
         * @param {Func(INIT_ONCE, "ptr", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INIT_ONCE.Ptr, "ptr", "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

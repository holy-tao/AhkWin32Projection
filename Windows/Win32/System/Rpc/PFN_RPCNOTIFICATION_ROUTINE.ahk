#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_ASYNC_STATE.ahk" { RPC_ASYNC_STATE }
#Import ".\RPC_ASYNC_EVENT.ahk" { RPC_ASYNC_EVENT }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct PFN_RPCNOTIFICATION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_RPCNOTIFICATION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync 
     * @param {Pointer<Void>} _Context 
     * @param {RPC_ASYNC_EVENT} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pAsync, _Context, Event) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, RPC_ASYNC_STATE.Ptr, pAsync, _ContextMarshal, _Context, RPC_ASYNC_EVENT, Event)
    }

    /**
     * A PFN_RPCNOTIFICATION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_RPCNOTIFICATION_ROUTINE {
        /**
         * Creates a PFN_RPCNOTIFICATION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(RPC_ASYNC_STATE, "ptr", RPC_ASYNC_EVENT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RPC_ASYNC_STATE.Ptr, "ptr", RPC_ASYNC_EVENT, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

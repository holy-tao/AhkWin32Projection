#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_BLOCKING_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_BLOCKING_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _hWnd 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Void>} hSyncEvent 
     * @returns {RPC_STATUS} 
     */
    Call(_hWnd, _Context, hSyncEvent) {
        _hWndMarshal := _hWnd is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        hSyncEventMarshal := hSyncEvent is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _hWndMarshal, _hWnd, _ContextMarshal, _Context, hSyncEventMarshal, hSyncEvent, RPC_STATUS)
        return result
    }

    /**
     * A RPC_BLOCKING_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_BLOCKING_FN {
        /**
         * Creates a RPC_BLOCKING_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", RPC_STATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyGetConnectionTimeoutFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyGetConnectionTimeoutFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} ConnectionTimeout 
     * @returns {RPC_STATUS} 
     */
    Call(ConnectionTimeout) {
        ConnectionTimeoutMarshal := ConnectionTimeout is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ConnectionTimeoutMarshal, ConnectionTimeout, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcProxyGetConnectionTimeoutFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyGetConnectionTimeoutFn {
        /**
         * Creates a I_RpcProxyGetConnectionTimeoutFn pointer that invokes the given AHK function when called.
         * @param {Func("uint*") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", RPC_STATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

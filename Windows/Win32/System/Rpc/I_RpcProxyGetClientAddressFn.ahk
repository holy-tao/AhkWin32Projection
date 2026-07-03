#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyGetClientAddressFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcProxyGetClientAddressFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {PSTR} _Buffer 
     * @param {Pointer<Integer>} BufferLength 
     * @returns {RPC_STATUS} 
     */
    Call(_Context, _Buffer, BufferLength) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, "ptr", _Buffer, BufferLengthMarshal, BufferLength, RPC_STATUS)
        return result
    }

    /**
     * A I_RpcProxyGetClientAddressFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcProxyGetClientAddressFn {
        /**
         * Creates a I_RpcProxyGetClientAddressFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, "uint*") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, "uint*", RPC_STATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

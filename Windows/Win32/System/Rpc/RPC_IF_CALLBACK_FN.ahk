#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * The RPC_IF_CALLBACK_FN is a prototype for a security-callback function that your application supplies. Your program can provide a callback function for each interface it defines.
 * @remarks
 * In some cases, the RPC run time may call the security-callback function more than once per client per interface. Be sure your callback function can handle this possibility.
 * 
 * The security callback must be declared as RPC_ENTRY.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/nc-rpcdce-rpc_if_callback_fn
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_IF_CALLBACK_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_IF_CALLBACK_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} InterfaceUuid 
     * @param {Pointer<Void>} _Context Pointer to an RPC_IF_ID server binding handle representing the client. In the function declaration, this must be of type RPC_IF_HANDLE, but it is a client binding handle and can be safely cast to it. The callback function may pass this handle to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcimpersonateclient">RpcImpersonateClient</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingserverfromclient">RpcBindingServerFromClient</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcgetauthorizationcontextforclient">RpcGetAuthorizationContextForClient</a>, or any other server side function that accepts a client binding handle to obtain information about the client.
     * @returns {RPC_STATUS} The callback function should return RPC_S_OK if the client is allowed to call methods in this interface. Any other return code will cause the client to receive the exception RPC_S_ACCESS_DENIED.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     */
    Call(InterfaceUuid, _Context) {
        InterfaceUuidMarshal := InterfaceUuid is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterfaceUuidMarshal, InterfaceUuid, _ContextMarshal, _Context, RPC_STATUS)
        return result
    }

    /**
     * A RPC_IF_CALLBACK_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_IF_CALLBACK_FN {
        /**
         * Creates a RPC_IF_CALLBACK_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

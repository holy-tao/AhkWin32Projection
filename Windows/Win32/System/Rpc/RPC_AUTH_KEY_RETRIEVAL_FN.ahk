#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * The RPC_AUTH_KEY_RETRIEVAL_FN function is a prototype for a function that specifies the address of a server-application-provided routine returning encryption keys.
 * @remarks
 * An authorization key–retrieval function specifies the address of a server-application-provided routine returning encryption keys.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/nc-rpcdce-rpc_auth_key_retrieval_fn
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_AUTH_KEY_RETRIEVAL_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_AUTH_KEY_RETRIEVAL_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Arg Pointer to a user-defined argument to the user-supplied encryption key acquisition function. The RPC run-time library uses the <i>Arg</i> parameter supplied to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a>.
     * @param {PWSTR} ServerPrincName Pointer to the principal name to use for the server when authenticating remote procedure calls. The RPC run-time library uses the <i>ServerPrincName</i> parameter supplied to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a>.
     * @param {Integer} KeyVer Value that the RPC run-time library automatically provides for the key-version parameter. When the value is zero, the acquisition function must return the most recent key available.
     * @param {Pointer<Pointer<Void>>} Key Pointer to a pointer to the authentication key returned by the user-supplied function.
     * @param {Pointer<RPC_STATUS>} _Status Pointer to the status returned by the acquisition function when it is called by the RPC run-time library to authenticate the client RPC request. If the status is other than RPC_S_OK, the request fails and the run-time library returns the error status to the client application.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Arg, ServerPrincName, KeyVer, Key, _Status) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        ArgMarshal := Arg is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "ptr*" : "ptr"
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        DllCall(this.value, ArgMarshal, Arg, "ptr", ServerPrincName, UInt32, KeyVer, KeyMarshal, Key, _StatusMarshal, _Status)
    }

    /**
     * A RPC_AUTH_KEY_RETRIEVAL_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_AUTH_KEY_RETRIEVAL_FN {
        /**
         * Creates a RPC_AUTH_KEY_RETRIEVAL_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, "ptr*", "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, "ptr*", "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

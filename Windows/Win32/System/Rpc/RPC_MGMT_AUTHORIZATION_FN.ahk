#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * The RPC_MGMT_AUTHORIZATION_FN enables server programs to implement custom RPC authorization techniques.
 * @remarks
 * When a client requests one of the server's remote management functions, the server run-time library calls the authorization function with <i>ClientBinding</i> and <i>RequestedMgmtOperation</i>. The authorization function uses these parameters to determine whether the calling client can execute the requested management function.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/nc-rpcdce-rpc_mgmt_authorization_fn
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_MGMT_AUTHORIZATION_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_MGMT_AUTHORIZATION_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ClientBinding Client/server binding handle.
     * @param {Integer} RequestedMgmtOperation The value for <i>RequestedMgmtOperation</i> depends on the remote function requested, as shown in the following table. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Called remote function</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcMgmtInqIfIds"></a><a id="rpcmgmtinqifids"></a><a id="RPCMGMTINQIFIDS"></a><dl>
     * <dt><b>RpcMgmtInqIfIds</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC_C_MGMT_INQ_IF_IDS
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcMgmtInqServerPrincName"></a><a id="rpcmgmtinqserverprincname"></a><a id="RPCMGMTINQSERVERPRINCNAME"></a><dl>
     * <dt><b>RpcMgmtInqServerPrincName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC_C_MGMT_INQ_PRINC_NAME
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcMgmtInqStats"></a><a id="rpcmgmtinqstats"></a><a id="RPCMGMTINQSTATS"></a><dl>
     * <dt><b>RpcMgmtInqStats</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC_C_MGMT_INQ_STATS
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcMgmtIsServerListening"></a><a id="rpcmgmtisserverlistening"></a><a id="RPCMGMTISSERVERLISTENING"></a><dl>
     * <dt><b>RpcMgmtIsServerListening</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC_C_MGMT_IS_SERVER_LISTEN
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcMgmtStopServerListening"></a><a id="rpcmgmtstopserverlistening"></a><a id="RPCMGMTSTOPSERVERLISTENING"></a><dl>
     * <dt><b>RpcMgmtStopServerListening</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC_C_MGMT_STOP_SERVER_LISTEN
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The authorization function must handle all of these values.
     * @param {Pointer<RPC_STATUS>} _Status If <i>Status</i> is either 0 (zero) or RPC_S_OK, the <i>Status</i> value RPC_S_ACCESS_DENIED is returned to the client by the remote management function. If the authorization function returns any other value for <i>Status</i>, that <i>Status</i> value is returned to the client by the remote management function.
     * @returns {Integer} Returns <b>TRUE</b> if the calling client is allowed access to the requested management function. If the authorization function returns <b>FALSE</b>, the management function cannot execute. In this case, the function returns a <i>Status</i> value to the client:
     */
    Call(ClientBinding, RequestedMgmtOperation, _Status) {
        ClientBindingMarshal := ClientBinding is VarRef ? "ptr" : "ptr"
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, ClientBindingMarshal, ClientBinding, UInt32, RequestedMgmtOperation, _StatusMarshal, _Status, Int32)
        return result
    }

    /**
     * A RPC_MGMT_AUTHORIZATION_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_MGMT_AUTHORIZATION_FN {
        /**
         * Creates a RPC_MGMT_AUTHORIZATION_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

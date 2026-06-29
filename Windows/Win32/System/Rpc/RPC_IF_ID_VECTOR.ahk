#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_IF_ID.ahk" { RPC_IF_ID }

/**
 * The RPC_IF_ID_VECTOR structure contains a list of interfaces offered by a server.
 * @remarks
 * The interface identification vector contains a count member (<b>Count</b>), followed by an array of pointers to interface identifiers (
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_if_id">RPC_IF_ID</a>).
 * 
 * The interface identification vector is a read-only vector. To obtain a vector of the interface identifiers registered by a server with the run-time library, an application calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtinqifids">RpcMgmtInqIfIds</a>. To obtain a vector of the interface identifiers exported by a server, an application calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsmgmtentryinqifidsa">RpcNsMgmtEntryInqIfIds</a>.
 * 
 * The RPC run-time library allocates memory for the interface identification vector. The application calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcifidvectorfree">RpcIfIdVectorFree</a> to free the interface identification vector.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_if_id_vector
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_IF_ID_VECTOR {
    #StructPack 8

    /**
     * Number of interface-identification structures present in the array <b>IfHandl</b>.
     */
    Count : UInt32

    IfId : RPC_IF_ID.Ptr[1]

}

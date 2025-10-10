#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_IF_ID_VECTOR structure contains a list of interfaces offered by a server.
 * @remarks
 * 
  * The interface identification vector contains a count member (<b>Count</b>), followed by an array of pointers to interface identifiers (
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_if_id">RPC_IF_ID</a>).
  * 
  * The interface identification vector is a read-only vector. To obtain a vector of the interface identifiers registered by a server with the run-time library, an application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtinqifids">RpcMgmtInqIfIds</a>. To obtain a vector of the interface identifiers exported by a server, an application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsmgmtentryinqifidsa">RpcNsMgmtEntryInqIfIds</a>.
  * 
  * The RPC run-time library allocates memory for the interface identification vector. The application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcifidvectorfree">RpcIfIdVectorFree</a> to free the interface identification vector.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcdce/ns-rpcdce-rpc_if_id_vector
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_IF_ID_VECTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of interface-identification structures present in the array <b>IfHandl</b>.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Array<RPC_IF_ID>}
     */
    IfId{
        get {
            if(!this.HasProp("__IfIdProxyArray"))
                this.__IfIdProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__IfIdProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the basic options with which to create an RPC binding handle.
 * @remarks
 * 
  * Fast binding handles are slightly different from "classic" binding handles in the way they are handled during calls to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingreset">RpcBindingReset</a>. <b>RpcBindingReset</b> is a no-op call for static fast binding handles. For classic binding handles, however, <b>RpcBindingReset</b> converts a static binding handle into a dynamic one to preserve backwards compatibility.
  * 
  * The following table demonstrates the behavior of static and dynamic binding handles with regards to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingreset">RpcBindingReset</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcepresolvebinding">RpcEpResolveBinding</a>.
  *   <table>
  * <tr>
  * <th>Endpoint Type</th>
  * <th colspan="2">Static</th>
  * <th colspan="2">Dynamic</th>
  * </tr>
  * <tr>
  * <th>Binding Handle Type</th>
  * <th>Fast</th>
  * <th>Classic</th>
  * <th>Fast</th>
  * <th>Classic</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingreset">RpcBindingReset</a>
  * </td>
  * <td>No-op</td>
  * <td>Converts to dynamic</td>
  * <td>Removes resolved endpoint if one is present</td>
  * <td>Removes resolved endpoint if one is present</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcepresolvebinding">RpcEpResolveBinding</a>
  * </td>
  * <td>No-op</td>
  * <td>No-op</td>
  * <td>Resolves endpoint if not previously resolved</td>
  * <td>Resolves endpoint if not previously resolved</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcdce/ns-rpcdce-rpc_binding_handle_template_v1_a
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_BINDING_HANDLE_TEMPLATE_V1_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The version of this structure. For <b>RPC_BINDING_HANDLE_TEMPLATE_V1</b> this must be set to 1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flag values that describe specific properties of the RPC template.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_BHT_OBJECT_UUID_VALID"></a><a id="rpc_bht_object_uuid_valid"></a><dl>
     * <dt><b>RPC_BHT_OBJECT_UUID_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectUuid</b> member contains a valid value. If this flag is not set, then the ObjectUuid member does not contain a valid UUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    ProtocolSequence {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a string representation of the network address to bind to.
     * @type {Pointer<Byte>}
     */
    NetworkAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a string representation of the endpoint to bind to. If a dynamic endpoint is used, set this member to <b>NULL</b>. After the endpoint is resolved, use <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingtostringbinding">RpcBindingToStringBinding</a> to obtain it.
     * @type {Pointer<Byte>}
     */
    StringEndpoint {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<Byte>}
     */
    u1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The UUID of the remote object. The semantics for this UUID are the same as those for a string binding. After the binding handle is created, call <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetobject">RpcBindingSetObject</a> to change the UUID as needed.
     * @type {Pointer<Guid>}
     */
    ObjectUuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

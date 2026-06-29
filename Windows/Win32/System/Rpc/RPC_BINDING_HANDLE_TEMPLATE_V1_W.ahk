#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the basic options with which to create an RPC binding handle. (Unicode)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_binding_handle_template_v1_w
 * @namespace Windows.Win32.System.Rpc
 * @charset Unicode
 */
export default struct RPC_BINDING_HANDLE_TEMPLATE_V1_W {
    #StructPack 8


    struct _u1 {
        Reserved : IntPtr

    }

    /**
     * The version of this structure. For <b>RPC_BINDING_HANDLE_TEMPLATE_V1</b> this must be set to 1.
     */
    Version : UInt32

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
     */
    Flags : UInt32

    ProtocolSequence : UInt32

    /**
     * Pointer to a string representation of the network address to bind to.
     */
    NetworkAddress : IntPtr

    /**
     * Pointer to a string representation of the endpoint to bind to. If a dynamic endpoint is used, set this member to <b>NULL</b>. After the endpoint is resolved, use <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingtostringbinding">RpcBindingToStringBinding</a> to obtain it.
     */
    StringEndpoint : IntPtr

    u1 : RPC_BINDING_HANDLE_TEMPLATE_V1_W._u1

    /**
     * The UUID of the remote object. The semantics for this UUID are the same as those for a string binding. After the binding handle is created, call <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetobject">RpcBindingSetObject</a> to change the UUID as needed.
     */
    ObjectUuid : Guid

}

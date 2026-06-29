#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Initializes a remote resource manager for a client.
 * @remarks
 * For a sample that uses this structure, see the [Effective access rights for files sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Security/EffectiveAccessRights).
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_rpc_init_info_client
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_RPC_INIT_INFO_CLIENT {
    #StructPack 8

    /**
     * Version of the structure. The highest currently supported version is AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1.
     */
    version : UInt16

    /**
     * Null-terminated string representation of the resource manager UUID. Only the following values are valid.
     * 
     * <ul>
     * <li>Use “5fc860e0-6f6e-4fc2-83cd-46324f25e90b” for remote effective access evaluation that ignores central policy.</li>
     * <li>Use “9a81c2bd-a525-471d-a4ed-49907c0b23da” for remote effective access evaluation that takes central policy into account.</li>
     * </ul>
     */
    ObjectUuid : PWSTR

    /**
     * Null-terminated string representation of a protocol sequence. This can be the following value.
     * 
     * <ul>
     * <li>“ncacn_ip_tcp”.</li>
     * </ul>
     */
    ProtSeq : PWSTR

    /**
     * Null-terminated string representation of a network address. The network-address format is associated with the protocol sequence.
     */
    NetworkAddr : PWSTR

    /**
     * Null-terminated string representation of an endpoint. The endpoint format and content are associated with the protocol sequence. For example, the endpoint associated with the protocol sequence <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> is a pipe name in the format <b>\\</b><i>Pipe</i><b>\\</b><i>PipeName</i>.
     */
    Endpoint : PWSTR

    /**
     * Null-terminated string representation of network options. The option string is associated with the protocol sequence.
     */
    Options : PWSTR

    /**
     * Server Principal Name (SPN) of the server. If this member is missing, it is constructed from <b>NetworkAddr</b> assuming "host" service class.
     */
    ServerSpn : PWSTR

}

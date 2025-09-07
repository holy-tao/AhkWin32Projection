#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Initializes a remote resource manager for a client.
 * @remarks
 * For a sample that uses this structure, see the [Effective access rights for files sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Security/EffectiveAccessRights).
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_rpc_init_info_client
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_RPC_INIT_INFO_CLIENT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Version of the structure. The highest currently supported version is AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Null-terminated string representation of the resource manager UUID. Only the following values are valid.
     * 
     * <ul>
     * <li>Use “5fc860e0-6f6e-4fc2-83cd-46324f25e90b” for remote effective access evaluation that ignores central policy.</li>
     * <li>Use “9a81c2bd-a525-471d-a4ed-49907c0b23da” for remote effective access evaluation that takes central policy into account.</li>
     * </ul>
     * @type {PWSTR}
     */
    ObjectUuid{
        get {
            if(!this.HasProp("__ObjectUuid"))
                this.__ObjectUuid := PWSTR(this.ptr + 8)
            return this.__ObjectUuid
        }
    }

    /**
     * Null-terminated string representation of a protocol sequence. This can be the following value.
     * 
     * <ul>
     * <li>“ncacn_ip_tcp”.</li>
     * </ul>
     * @type {PWSTR}
     */
    ProtSeq{
        get {
            if(!this.HasProp("__ProtSeq"))
                this.__ProtSeq := PWSTR(this.ptr + 16)
            return this.__ProtSeq
        }
    }

    /**
     * Null-terminated string representation of a network address. The network-address format is associated with the protocol sequence.
     * @type {PWSTR}
     */
    NetworkAddr{
        get {
            if(!this.HasProp("__NetworkAddr"))
                this.__NetworkAddr := PWSTR(this.ptr + 24)
            return this.__NetworkAddr
        }
    }

    /**
     * Null-terminated string representation of an endpoint. The endpoint format and content are associated with the protocol sequence. For example, the endpoint associated with the protocol sequence <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> is a pipe name in the format <b>\\</b><i>Pipe</i><b>\\</b><i>PipeName</i>.
     * @type {PWSTR}
     */
    Endpoint{
        get {
            if(!this.HasProp("__Endpoint"))
                this.__Endpoint := PWSTR(this.ptr + 32)
            return this.__Endpoint
        }
    }

    /**
     * Null-terminated string representation of network options. The option string is associated with the protocol sequence.
     * @type {PWSTR}
     */
    Options{
        get {
            if(!this.HasProp("__Options"))
                this.__Options := PWSTR(this.ptr + 40)
            return this.__Options
        }
    }

    /**
     * Server Principal Name (SPN) of the server. If this member is missing, it is constructed from <b>NetworkAddr</b> assuming "host" service class.
     * @type {PWSTR}
     */
    ServerSpn{
        get {
            if(!this.HasProp("__ServerSpn"))
                this.__ServerSpn := PWSTR(this.ptr + 48)
            return this.__ServerSpn
        }
    }
}

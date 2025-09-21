#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an RPC interface group server interface. (RPC_INTERFACE_TEMPLATEA)
 * @remarks
 * To register an interface, the server provides the following information:<ul>
  * <li>Interface specification The interface specification is a data structure that the MIDL compiler generates.
  * 
  * </li>
  * <li>Manager type <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> and manager EPV The manager type <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> and the manager EPV determine which manager routine executes when a server receives a remote procedure call request from a client. For each implementation of an interface offered by a server, it must register a separate manager EPV.
  * Note that when specifying a non-nil, manager type <b>UUID</b>, the server must also call <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcobjectsettype">RpcObjectSetType</a> to register objects of this non-nil type.
  * 
  * </li>
  * </ul>
  * 
  * 
  * All interface group interfaces are treated as <b>auto-listen</b>.  The runtime begins listening for calls as soon as the interface group is activated.  Calls to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtstopserverlistening">RpcMgmtStopServerListening</a> do not affect the interface, nor does a call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverunregisterif">RpcServerUnregisterIf</a> with <i>IfSpec</i> set to <b>NULL</b>.
  * 
  * Specifying a security-callback function in <i>IfCallback</i> allows the server application to restrict access to its interfaces on an individual client basis. That is, by default, security is optional; the server run-time will dispatch unsecured calls even if the server has called <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a>. If the server wants to accept only authenticated clients, an interface callback function must call <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindinginqauthclient">RpcBindingInqAuthClient</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcgetauthorizationcontextforclient">RpcGetAuthorizationContextForClient</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserverinqcallattributesa">RpcServerInqCallAttributes</a> to retrieve the security level, or attempt to impersonate the client with <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcimpersonateclient">RpcImpersonateClient</a>. It can also specify the <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">RPC_IF_ALLOW_SECURE_ONLY</a> flag in <i>Flags</i> to reject unauthenticated calls.
  * 
  * When a server application specifies a security-callback function for its interface(s) in <i>IfCallback</i>, the RPC run time automatically rejects calls without authentication information to that interface. In addition, the run-time records the interfaces each client has used. When a client makes an RPC to an interface that it has not used during the current communication session, the RPC run-time library calls the interface's security-callback function. Specifying <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH</a> in <i>Flags</i> will prevent the automatic rejection of unauthenticated clients. Note that calls on the <b>NULL</b> security session can have authentication information, even though they come from anonymous clients. Thus, the existence of a callback alone is not sufficient to prevent anonymous clients from connecting; either the security callback function must check for that, or the RPC_IF_ALLOW_SECURE_ONLY flag must be used. RPC_IF_ALLOW_SECURE_ONLY rejects null session calls only on Windows XP and later versions of Windows.
  * 
  * For the signature for the callback function, see <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_if_callback_fn">RPC_IF_CALLBACK_FN</a>.
  * 
  * The callback function in <i>IfCallback</i> should return <b>RPC_S_OK</b> if the client is allowed to call methods in this interface. Any other return code will cause the client to receive the exception <b>RPC_S_ACCESS_DENIED</b>.
  * 
  * In some cases, the RPC run time may call the security-callback function more than once per client, per interface. The callback function must be able to handle this possibility.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The rpcdce.h header defines RPC_INTERFACE_TEMPLATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_interface_templatea
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_INTERFACE_TEMPLATEA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * This field is reserved and must be set to 0.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * MIDL-generated structure that defines the interface to register.
     * @type {Pointer<Void>}
     */
    IfSpec {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> to associate with <i>MgrEpv</i>. <b>NULL</b> or a nil <b>UUID</b> registers <i>IfSpec</i> with a nil <b>UUID</b>.
     * @type {Pointer<Guid>}
     */
    MgrTypeUuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-mgr-epv">RPC_MGR_EPV</a> structure that contains the manager routines' entry-point vector (EPV). If <b>NULL</b>,the MIDL-generated default EPV is used.
     * @type {Pointer<Void>}
     */
    MgrEpv {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Flags. For a list of flag values, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">Interface Registration Flags</a>. Interface group interfaces are always treated as <b>auto-listen</b>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Maximum number of concurrent remote procedure call requests the server can accept on this interface.  The RPC run-time library makes its best effort to ensure the server does not allow more concurrent call requests than the number of calls specified in <i>MaxCalls</i>. However, the actual number can be greater than <i>MaxCalls</i> and can vary for each protocol sequence.
     * 
     * Calls on other interfaces are governed by the value of the process-wide <i>MaxCalls</i> parameter specified in <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a>.
     * 
     * If the number of concurrent calls is not a concern, slightly better server-side performance can be achieved by specifying the default value using <b>RPC_C_LISTEN_MAX_CALLS_DEFAULT</b>. Doing so relieves the RPC run-time environment from enforcing an unnecessary restriction.
     * @type {Integer}
     */
    MaxCalls {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Maximum size, in bytes, of incoming data blocks. <i>MaxRpcSize</i> may be used to help prevent malicious denial-of-service attacks. If the data block of a remote procedure call is larger than <i>MaxRpcSize</i>, the RPC run-time library rejects the call and sends an <b>RPC_S_ACCESS_DENIED</b> error to the client. Specifying a value of (unsigned int) –1 in <i>MaxRpcSize</i> removes the limit on the size of incoming data blocks. This parameter has no effect on calls made over the <a href="https://docs.microsoft.com/windows/desktop/Rpc/protocol-sequence-constants">ncalrpc</a> protocol.
     * @type {Integer}
     */
    MaxRpcSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_interface_group_idle_callback_fn">RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN</a> security-callback function, or <b>NULL</b> for no callback. Each registered interface can have a different callback function.
     * @type {Pointer<RPC_IF_CALLBACK_FN>}
     */
    IfCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a vector of object <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUIDs</a> offered by the server to be registered with the RPC endpoint mapper. The server application constructs this vector.  <b>NULL</b> indicates there are no object <b>UUIDs</b> to register.
     * @type {Pointer<UUID_VECTOR>}
     */
    UuidVector {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the character-string comment applied to each cross-product element added to the local endpoint-map database. The string can be up to 64 characters long, including the null terminating character. Specify a null value or a null-terminated string ("\0") if there is no annotation string.
     * 
     * The annotation string is used by applications for information only. RPC does not use this string to determine which server instance a client communicates with or for enumerating elements in the endpoint-map database.
     * @type {Pointer<Byte>}
     */
    Annotation {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Optional security descriptor describing which clients have the right to access the interface.
     * @type {Pointer<Void>}
     */
    SecurityDescriptor {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}

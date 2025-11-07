#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to implement external caching of connections.
 * @remarks
 * 
 * Use the <b>LDAP_REFERRAL_CALLBACK</b> structure to implement a mechanism for caching connections. The structure contains three callback functions which you implement in your client code.
 * 
 * <b>QUERYFORCONNECTION</b>: If a connection is available, this function should return a pointer to the connection to use in <i>ConnectionToUse</i>. If no connection is available, the function should set <i>ConnectionToUse</i> to <b>NULL</b>. The signature for this callback function is as follows.
 * 
 * 
 * ```cpp
 * typedef ULONG (_cdecl QUERYFORCONNECTION)(
 *     PLDAP       PrimaryConnection,
 *     PLDAP       ReferralFromConnection,
 *     PWCHAR      NewDN,
 *     PCHAR       HostName,
 *     ULONG       PortNumber,
 *     PVOID       SecAuthIdentity,    // If NULL, use CurrentUser below
 *     PVOID       CurrentUserToken,   // pointer to current user LUID.
 *     PLDAP       *ConnectionToUse
 * );
 * ```
 * 
 * 
 * <b>NOTIFYOFNEWCONNECTION</b>: The run time calls this function if a new connection was created in the course of chasing a referral. This function should return <b>FALSE</b> if not required to cache the connection. When <b>FALSE</b> is returned, the connection is destroyed when the operation completes. The function should return <b>TRUE</b> if it has taken ownership of the connection and the connection will be cached. Be aware that any new connections so created inherit the current callbacks from the primary connection on which the request was initiated. The signature for this function is.
 * 
 * 
 * ```cpp
 * typedef BOOLEAN (_cdecl NOTIFYOFNEWCONNECTION) 
 *     (
 *     PLDAP       PrimaryConnection,
 *     PLDAP       ReferralFromConnection,
 *     PWCHAR      NewDN,
 *     PCHAR       HostName,
 *     PLDAP       NewConnection,
 *     ULONG       PortNumber,
 *     PVOID       SecAuthIdentity,    // If null, use CurrentUser below.
 *     PVOID       CurrentUser,        // Pointer to current user LUID.
 *     ULONG       ErrorCodeFromBind   // If nonzero, bind to server failed.
 *     );
 * ```
 * 
 * 
 * <b>DEREFERENCECONNECTION</b>: The LDAP run time calls this function to dereference a connection that is no longer required. The connection may have come from a successful call to <b>QueryForConnection</b> or from <b>NotifyOfNewConnection</b>. The function should return LDAP_SUCCESS if the call succeeds; currently, however, the run time ignores the return value. The signature for this function is as follows.
 * 
 * 
 * ```cpp
 * typedef ULONG (_cdecl DEREFERENCECONNECTION)
 *     (
 *     PLDAP       PrimaryConnection,
 *     PLDAP       ConnectionToDereference
 *     );
 * ```
 * 
 * 
 * To configure a session to use callbacks to obtain a cached connection, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> (conn, LDAP_OPT_REFERRAL_CALLBACK, &amp;referralRoutines), where <i>referralRoutines</i> is the address of the <b>LDAP_REFERRAL_CALLBACK</b> structure that contains your routines. The addresses may be <b>NULL</b>, in which case the LDAP run time will not make the calls.
 * 
 * The parameter descriptions for the preceding three functions are as follows:
 * 
 * <ul>
 * <li>
 * <i>PrimaryConnection</i>
 * 
 * The LDAP connection handle on which the operation was originally performed. For example, the handle passed in to a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a>, and so on.
 * 
 * </li>
 * <li>
 * <i>ReferralFromConnection</i>
 * 
 * The connection which sent the referral currently tracked. Referrals can be tracked across multiple "hops". For example, the referral can be from the original server to a second server, then the second server can refer the operation to a third server, and so on. If <i>ReferralFromConnection</i> equates to <i>PrimaryConnection</i>, the first "hop" is being tracked (a referral sent from the original server).
 * 
 * </li>
 * <li>
 * <i>NewDN</i>
 * 
 * Pointer to a wide, null-terminated string that contains the DN of the referred-to object.
 * 
 * </li>
 * <li>
 * <i>HostName</i>
 * 
 * Pointer to a null-terminated string that contains the name of the referred-to server; that is the server to which a connection must be made.
 * 
 * </li>
 * <li><i>PortNumber</i>Port on the referred-to server, to which a connection must be made.
 * 
 * </li>
 * <li>
 * <i>SecAuthIdentity</i>
 * 
 * The <b>SEC_WINNT_AUTH_IDENTITY</b> or <b>SEC_WINNT_AUTH_IDENTITY_EX</b> for the credentials used when tracking the referral, or a <b>NULL</b> if the user's default credentials are used.
 * 
 * </li>
 * <li>
 * <i>CurrentUserToken/CurrentUser</i>
 * 
 * The AuthenticationID LUID of the user for which a connection is required. If <i>SecAuthIdentity</i> is <b>NULL</b>, use this parameter to identify the user.
 * 
 * </li>
 * <li>
 * <i>NewConnection</i>
 * 
 * Used to announce the existence of the  new connection.
 * 
 * </li>
 * <li>
 * <i>ErrorCodeFromBind</i>
 * 
 * Error code returned from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a> when an attempt is made to  bind to the newly created connection (<i>NewConnection</i>).
 * 
 * </li>
 * <li>
 * <i>ConnectionToDereference</i>
 * 
 * The connection to be dereferenced.
 * 
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldap_referral_callback
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAP_REFERRAL_CALLBACK extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The amount of memory required for the callback. Set this field to <c>sizeof(LDAP_REFERRAL_CALLBACK)</c>.
     * @type {Integer}
     */
    SizeOfCallbacks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a callback function to determine whether there is a cached connection cached available. For more information, see Remarks.
     * @type {Pointer<QUERYFORCONNECTION>}
     */
    QueryForConnection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a callback function that determines whether a new connection will be cached or destroyed after the operation completes. For more information, see Remarks.
     * @type {Pointer<NOTIFYOFNEWCONNECTION>}
     */
    NotifyRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a callback function to dereference a connection that is not in use. For more information, see Remarks.
     * @type {Pointer<DEREFERENCECONNECTION>}
     */
    DereferenceRoutine {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class Multicast {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_CLIENT_ID_LEN => 17

    /**
     * @type {Integer (Int32)}
     */
    static MCAST_API_CURRENT_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCAST_API_VERSION_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static MCAST_API_VERSION_1 => 1
;@endregion Constants

;@region Methods
    /**
     * The McastApiStartup function facilitates MADCAP-version negotiation between requesting clients and the version of MADCAP implemented on the system.
     * @remarks
     * Clients can specify which version they want to use in the <i>pVersion</i> parameter. If the system's implementation supports the requested MCAST version, the function call succeeds. If the system's implementation does not support the requested version, the function fails with MCAST_API_CURRENT_VERSION.
     * 
     * The client can automatically negotiate the first version of MCAST (MCAST_API_VERSION_1) by setting the <i>pVersion</i> parameter to zero.
     * 
     * The 
     * <b>McastApiStartup</b> function always returns the most recent version of MADCAP available on the system (MCAST_API_CURRENT_VERSION) in <i>pVersion</i>, enabling clients to discover the most recent version implemented on the system.
     * @param {Pointer<Integer>} Version Pointer to the version of multicast (MCAST) that the client wishes to use. 
     * 
     * 
     * 
     * 
     * [out] Pointer to the version of MCAST implemented on the system.
     * @returns {Integer} If the client requests a version of MADCAP that is not supported by the system, the 
     * <b>McastApiStartup</b> function returns ERROR_NOT_SUPPORTED. If resources fail to be allocated for the function call, ERROR_NO_SYSTEM_RESOURCES is returned.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastapistartup
     * @since windows5.0
     */
    static McastApiStartup(Version) {
        VersionMarshal := Version is VarRef ? "uint*" : "ptr"

        result := DllCall("dhcpcsvc.dll\McastApiStartup", VersionMarshal, Version, "uint")
        return result
    }

    /**
     * The McastApiCleanup function deallocates resources that are allocated with McastApiStartup. The McastApiCleanup function must only be called after a successful call to McastApiStartup.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastapicleanup
     * @since windows5.0
     */
    static McastApiCleanup() {
        DllCall("dhcpcsvc.dll\McastApiCleanup")
    }

    /**
     * The McastGenUID function generates a unique identifier, subsequently used by clients to request and renew addresses.
     * @param {Pointer<MCAST_CLIENT_UID>} pRequestID Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_client_uid">MCAST_CLIENT_UID</a> structure into which the unique identifier is stored. The size of the buffer to which <i>pRequestID</i> points must be at least MCAST_CLIENT_ID_LEN in size.
     * @returns {Integer} The 
     * <b>McastGenUID</b> function returns the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastgenuid
     * @since windows5.0
     */
    static McastGenUID(pRequestID) {
        result := DllCall("dhcpcsvc.dll\McastGenUID", "ptr", pRequestID, "uint")
        return result
    }

    /**
     * The McastEnumerateScopes function enumerates multicast scopes available on the network.
     * @remarks
     * The 
     * <b>McastEnumerateScopes</b> function queries multicast scopes for each network interface, and the interface on which the scope is retrieved is returned as part of the <i>pScopeList</i> parameter. Therefore, on multihomed computers it is possible that some scopes will get listed multiple times, once for each interface.
     * @param {Integer} AddrFamily Specifies the address family to be used in enumeration, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure. Use AF_INET for IPv4 addresses and AF_INET6 for IPv6 addresses.
     * @param {BOOL} ReQuery Enables a caller to query a list again. Set this parameter to <b>TRUE</b> if the list is to be queried more than once. Otherwise, set it to <b>FALSE</b>.
     * @param {Pointer<MCAST_SCOPE_ENTRY>} pScopeList Pointer to a buffer used for storing scope list information, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_scope_entry">MCAST_SCOPE_ENTRY</a> structure. The return value of <i>pScopeList</i> depends on its input value, and on the value of the buffer to which it points: 
     * 
     * 
     * 
     * 
     * If <i>pScopeList</i> is a valid pointer on input, the scope list is returned.
     * 
     * If <i>pScopeList</i> is <b>NULL</b> on input, the length of the buffer required to hold the scope list is returned.
     * 
     * If the buffer pointed to in <i>pScopeList</i> is <b>NULL</b> on input, 
     * <b>McastEnumerateScopes</b> forces a repeat querying of scope lists from MCAST servers.
     * 
     * To determine the size of buffer required to hold scope list data, set <i>pScopeList</i> to <b>NULL</b> and <i>pScopeLen</i> to a non-<b>NULL</b> value. The 
     * <b>McastEnumerateScopes</b> function will then return ERROR_SUCCESS and store the size of the scope list data, in bytes, in <i>pScopeLen</i>.
     * @param {Pointer<Integer>} pScopeLen Pointer to a value used to communicate the size of data or buffer space in <i>pScopeList</i>. On input, <i>pScopeLen</i> points to the size, in bytes, of the buffer pointed to by <i>pScopeList</i>. On return, <i>pScopeLen</i> points to the size of the data copied to <i>pScopeList</i>. 
     * 
     * 
     * 
     * 
     * The <i>pScopeLen</i> parameter cannot be <b>NULL</b>. If the buffer pointed to by <i>pScopeList</i> is not large enough to hold the scope list data, 
     * <b>McastEnumerateScopes</b> returns ERROR_MORE_DATA and stores the required buffer size, in bytes, in <i>pScopeLen</i>.
     * 
     * To determine the size of buffer required to hold scope list data, set <i>pScopeList</i> to <b>NULL</b> and <i>pScopeLen</i> to a non-<b>NULL</b> value. The 
     * <b>McastEnumerateScopes</b> function will then return ERROR_SUCCESS and store the size of the scope list data, in bytes, in <i>pScopeLen</i>.
     * @param {Pointer<Integer>} pScopeCount Pointer to the number of scopes returned in <i>pScopeList</i>.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 
     * If the buffer pointed to by <i>pScopeList</i> is too small to hold the scope list, the 
     * <b>McastEnumerateScopes</b> function returns ERROR_MORE_DATA, and stores the required buffer size, in bytes, in <i>pScopeLen</i>.
     * 
     * If the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastapistartup">McastApiStartup</a> function has not been called (it must be called before any other MADCAP client functions may be called), the 
     * <b>McastEnumerateScopes</b> function returns ERROR_NOT_READY.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastenumeratescopes
     * @since windows5.0
     */
    static McastEnumerateScopes(AddrFamily, ReQuery, pScopeList, pScopeLen, pScopeCount) {
        pScopeLenMarshal := pScopeLen is VarRef ? "uint*" : "ptr"
        pScopeCountMarshal := pScopeCount is VarRef ? "uint*" : "ptr"

        result := DllCall("dhcpcsvc.dll\McastEnumerateScopes", "ushort", AddrFamily, "int", ReQuery, "ptr", pScopeList, pScopeLenMarshal, pScopeLen, pScopeCountMarshal, pScopeCount, "uint")
        return result
    }

    /**
     * The McastRequestAddress function requests one or more multicast addresses from a MADCAP server.
     * @remarks
     * Before the 
     * <b>McastRequestAddress</b> function is called, the scope context must be retrieved by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastenumeratescopes">McastEnumerateScopes</a> function.
     * @param {Integer} AddrFamily Specifies the address family to be used in the request, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure. Use AF_INET for IPv4 addresses and AF_INET6 for IPv6 addresses.
     * @param {Pointer<MCAST_CLIENT_UID>} pRequestID Pointer to a unique identifier for the request, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_client_uid">MCAST_CLIENT_UID</a> structure. Clients are responsible for ensuring that each request contains a unique identifier; unique identifiers can be obtained by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastgenuid">McastGenUID</a> function.
     * @param {Pointer<MCAST_SCOPE_CTX>} pScopeCtx Pointer to the context of the scope from which the address is to be allocated, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_scope_ctx">MCAST_SCOPE_CTX</a> structure. The scope context must be retrieved by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastenumeratescopes">McastEnumerateScopes</a> function prior to calling the 
     * <b>McastRequestAddress</b> function.
     * @param {Pointer<MCAST_LEASE_REQUEST>} pAddrRequest Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_lease_request">MCAST_LEASE_REQUEST</a> structure containing multicast lease–request parameters.
     * @param {Pointer<MCAST_LEASE_RESPONSE>} pAddrResponse Pointer to a buffer containing response parameters for the multicast address request, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_lease_response">MCAST_LEASE_RESPONSE</a> structure. The caller is responsible for allocating sufficient buffer space for the <i>pAddrBuf</i> member of the 
     * <b>MCAST_LEASE_RESPONSE</b> structure to hold the requested number of addresses; the caller is also responsible for setting the pointer to that buffer.
     * @returns {Integer} The 
     * <b>McastRequestAddress</b> function returns the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastrequestaddress
     * @since windows5.0
     */
    static McastRequestAddress(AddrFamily, pRequestID, pScopeCtx, pAddrRequest, pAddrResponse) {
        result := DllCall("dhcpcsvc.dll\McastRequestAddress", "ushort", AddrFamily, "ptr", pRequestID, "ptr", pScopeCtx, "ptr", pAddrRequest, "ptr", pAddrResponse, "uint")
        return result
    }

    /**
     * The McastRenewAddress function renews one or more multicast addresses from a MADCAP server.
     * @param {Integer} AddrFamily Designates the address family. Use AF_INET for Internet Protocol version 4 (IPv4), and AF_INET6 for Internet Protocol version 6 (IPv6).
     * @param {Pointer<MCAST_CLIENT_UID>} pRequestID Unique identifier used when the address or addresses were initially obtained.
     * @param {Pointer<MCAST_LEASE_REQUEST>} pRenewRequest Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_lease_request">MCAST_LEASE_REQUEST</a> structure containing multicast renew–request parameters.
     * @param {Pointer<MCAST_LEASE_RESPONSE>} pRenewResponse Pointer to a buffer containing response parameters for the multicast address–renew request, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_lease_response">MCAST_LEASE_RESPONSE</a> structure. The caller is responsible for allocating sufficient buffer space for the <b>pAddrBuf</b> member of the 
     * <b>MCAST_LEASE_RESPONSE</b> structure to hold the requested number of addresses; the caller is also responsible for setting the pointer to that buffer.
     * @returns {Integer} The 
     * <b>McastRenewAddress</b> function returns the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastrenewaddress
     * @since windows5.0
     */
    static McastRenewAddress(AddrFamily, pRequestID, pRenewRequest, pRenewResponse) {
        result := DllCall("dhcpcsvc.dll\McastRenewAddress", "ushort", AddrFamily, "ptr", pRequestID, "ptr", pRenewRequest, "ptr", pRenewResponse, "uint")
        return result
    }

    /**
     * The McastReleaseAddress function releases leased multicast addresses from the MCAST server.
     * @param {Integer} AddrFamily Designates the address family. Use AF_INET for Internet Protocol version 4 (IPv4), and AF_INET6 for Internet Protocol version 6 (IPv6).
     * @param {Pointer<MCAST_CLIENT_UID>} pRequestID Unique identifier used when the address or addresses were initially obtained.
     * @param {Pointer<MCAST_LEASE_REQUEST>} pReleaseRequest Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_lease_request">MCAST_LEASE_REQUEST</a> structure containing multicast parameters associated with the release request.
     * @returns {Integer} The 
     * <b>McastReleaseAddress</b> function returns the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/madcapcl/nf-madcapcl-mcastreleaseaddress
     * @since windows5.0
     */
    static McastReleaseAddress(AddrFamily, pRequestID, pReleaseRequest) {
        result := DllCall("dhcpcsvc.dll\McastReleaseAddress", "ushort", AddrFamily, "ptr", pRequestID, "ptr", pReleaseRequest, "uint")
        return result
    }

;@endregion Methods
}

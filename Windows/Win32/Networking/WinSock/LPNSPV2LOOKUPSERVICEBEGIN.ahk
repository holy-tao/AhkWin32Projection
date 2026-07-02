#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WSAQUERYSET2W.ahk" { WSAQUERYSET2W }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Initiates a client query of a namespace version-2 service provider that is constrained by the information contained within a WSAQUERYSET2 structure.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function only returns a handle, which should be used by subsequent calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a> to get the actual results. Because this operation cannot be canceled, it should be implemented to execute quickly. While it is acceptable to initiate a network query, this function should not require a response  to return successfully.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. If a value was specified for the client session argument in the call to the **NSPv2Startup** function, then this same client session argument is passed in the  <i>lpvClientSessionArg </i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function.
 * 
 * If **LUP_CONTAINERS** is specified in a call, avoid all other restriction values. If any are supplied, the name service provider must decide if it can support this restriction over the containers. If not, it should return an error.
 * 
 * Some name service providers may have other means of finding containers. For example, containers can all be of some well-known type, or of a set of well-known types, and therefore a query restriction could be created for finding them. No matter what other means the name service provider has for locating containers, **LUP_CONTAINERS** and **LUP_NOCONTAINERS** take precedence. Therefore, if a query restriction is given that includes containers, specifying **LUP_NOCONTAINERS** will prevent the container items from being returned. Similarly, no matter what the query restriction, if **LUP_CONTAINERS** is given, only containers should be returned. If a namespace does not support containers and **LUP_CONTAINERS** is specified, it should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANO_DATA</a>.
 * 
 * The preferred method of obtaining the containers within another container, is the call:
 * 
 * 
 * ```cpp
 * dwStatus = NSPv2LookupServiceBegin(
 *     lpProviderId,
 *     lpqsRestrictions,
 *     LUP_CONTAINERS,
 *     lpClientSession,
 *     lphLookup);
 * 
 * ```
 * 
 * 
 * followed by the requisite number of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a> calls. This will return all containers contained immediately within the starting context; that is, it is not a deep query. With this, one can map the address space structure by walking the hierarchy, perhaps enumerating the content of selected containers. Subsequent uses of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> use the containers returned from a previous call.
 * 
 * <h3><a id="Forming_Queries"></a><a id="forming_queries"></a><a id="FORMING_QUERIES"></a>Forming Queries</h3>
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> structure is used as an input parameter to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> to qualify the query. The following table lists **WSAQUERYSET2** member names and describes how the 
 * **WSAQUERYSET2** is used to construct a query. Members labeled as optional and dependent on the requirements of the NSPv2 provider may be supplied as a **NULL** pointer when unused as a search criteria by the namespace provider. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/name-resolution-data-structures-2">Query-Related Data Structures</a>.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET2 member name</th>
 * <th>Query interpretation</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>Will be set to sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a>). This is a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>A string that contains the service name. The semantics for wildcarding within the string are not defined, but can be supported by certain namespace providers. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>The  desired version number that provides version comparison semantics (that is, version must match exactly, or version must be not less than the value supplied). This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>This member is ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>The identifier of a single namespace in which to constrain the search, or **NS_ALL** to include all namespaces.</td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>The GUID of a specific namespace provider that limits the query to this provider only. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpszContext**</td>
 * <td>The starting point of the query in a hierarchical namespace. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfProtocols**</td>
 * <td>The size, in bytes, of the number of entries in the protocol constraint array. This member can be zero.</td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>An array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-afprotocols">AFPROTOCOLS</a> structures. Only services that use these protocols will be returned. It is permissible for the value **AF_UNSPEC** to appear as a protocol family value, signifying a wildcard. Namespace providers may supply information about any service that uses the corresponding protocol, regardless of address family. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpszQueryString**</td>
 * <td>Some namespaces (such as whois++) support rich SQL-like queries contained in a simple text string. This parameter is used to specify that string.This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfCsAddrs**</td>
 * <td>This member is ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>This member is ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>This member is ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>A pointer to a provider-specific entity. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspv2lookupservicebegin
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPV2LOOKUPSERVICEBEGIN {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPV2LOOKUPSERVICEBEGIN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the identifier for the namespace service provider to query.
     * @param {Pointer<WSAQUERYSET2W>} lpqsRestrictions A pointer to the search criteria. See Remarks.
     * @param {Integer} dwControlFlags 
     * @param {Pointer<Void>} lpvClientSessionArg A pointer to the client session.
     * @param {Pointer<HANDLE>} lphLookup A pointer to the handle to be used in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a> in order to retrieve the results set.
     * @returns {Integer} The function should return **NO_ERROR** (zero) if the routine succeeds. It should return **SOCKET_ERROR** (that is, 1) if the routine fails and it must set the appropriate error code using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters were invalid, or missing, for this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANO_DATA</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The name was found in the database, but it does not have the correct associated data that is resolved for.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unknown. The service cannot be found in the specified namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_NOT_ENOUGH_MEMORY</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(lpProviderId, lpqsRestrictions, dwControlFlags, lpvClientSessionArg, lphLookup) {
        lpvClientSessionArgMarshal := lpvClientSessionArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, WSAQUERYSET2W.Ptr, lpqsRestrictions, UInt32, dwControlFlags, lpvClientSessionArgMarshal, lpvClientSessionArg, HANDLE.Ptr, lphLookup, Int32)
        return result
    }

    /**
     * A LPNSPV2LOOKUPSERVICEBEGIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPV2LOOKUPSERVICEBEGIN {
        /**
         * Creates a LPNSPV2LOOKUPSERVICEBEGIN pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WSAQUERYSET2W, UInt32, "ptr", HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WSAQUERYSET2W.Ptr, UInt32, "ptr", HANDLE.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

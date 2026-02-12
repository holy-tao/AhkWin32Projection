#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called after obtaining a handle from a previous call to NSPv2LookupServiceBegin in order to retrieve the requested information from a namespace version-2 service provider.
 * @remarks
 * The 
 * **NSPv2LookupServiceNextEx** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2LookupServiceNextEx** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The provider will pass a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> structure in the <i>lpqsResults</i> buffer. The client should call the **NSPv2LookupServiceNextEx** function until it returns **WSA_E_NOMORE**, indicating that all the 
 * **WSAQUERYSET2** structures have been returned.
 * 
 * The <i>dwControlFlags</i> specified in this function and the ones specified at the time of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> are handled as "restrictions" for the purpose of combination. The restrictions are combined between the ones at 
 * **NSPv2LookupServiceBegin** time and the ones at 
 * **NSPv2LookupServiceNextEx** time. Therefore, the flags at 
 * **NSPv2LookupServiceNextEx** can never increase the amount of data returned beyond what was requested at 
 * **NSPv2LookupServiceBegin**, although it is not an error to specify more or less flags. The flags specified at a given 
 * **NSPv2LookupServiceNextEx** apply only to that call.
 * 
 * The <i>dwControlFlags</i> **LUP_FLUSHPREVIOUS** and **LUP_RES_SERVICE** are exceptions to the combined restrictions rule (because they are behavior flags instead of "restriction" flags). If either flag is used in 
 * **NSPv2LookupServiceNextEx**, they have their defined effect regardless of the setting of the same flags at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a>.
 * 
 * For example, if **LUP_RETURN_VERSION** is specified at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a>, the service provider retrieves records including the version. If **LUP_RETURN_VERSION** is not specified at 
 * **NSPv2LookupServiceNextEx**, the returned information does not include the version, even though it was available. No error is generated.
 * 
 * Also for example, if **LUP_RETURN_BLOB** is not specified at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a>, but is specified at 
 * **NSPv2LookupServiceNextEx**, the returned information does not include the private data. No error is generated.
 * 
 * The **NSPv2LookupServiceNextEx** function is typically called at least twice. The first time to get the size of the needed buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> pointed to by the <i>lpqsResults</i> parameter, and the second time to get the actual query result set. On the first call, the NSPv2 provider should return the size necessary for the **WSAQUERYSET2** results.  
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> structure pointed to by the <i>lpqsResults</i> parameter that is returned is only useful in the same process context, since several of the members in the **WSAQUERYSET2** structure contains pointers to the actual data returned. If the query result needs to be passed to another process (using RPC, for example), then it will be necessary to serialize and marshal the data returned in the **WSAQUERYSET2** structure pointed to by the <i>lpqsResults</i> parameter including the data pointed to by members in the **WSAQUERYSET2** structure. The data needs to be serialized in a form that can be passed across process boundaries. Just passing a copy of the **WSAQUERYSET2** structure  is insufficient, since only pointers to data will be passed and the actual data will be unavailable to other processes.
 * 
 * <h3><a id="Query_Results"></a><a id="query_results"></a><a id="QUERY_RESULTS"></a>Query Results</h3>
 * The following table lists <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> and describes how query results are represented in the 
 * **WSAQUERYSET2** structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/name-resolution-data-structures-2">Query-Related Data Structures</a>.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET2 member name</th>
 * <th>Result interpretation</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>The  size, in bytes, of <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> structure. This is used as a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>A string that contains the service name.</td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>References version number of the particular service instance.</td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>A comment string supplied by service instance. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>The namespace identifier in which the name or service instance was found.</td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>The specific namespace provider that supplied this query result.</td>
 * </tr>
 * <tr>
 * <td>**lpszContext**</td>
 * <td>The context point in a hierarchical namespace at which the service is located.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfProtocols**</td>
 * <td>This member is undefined for results.</td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>This member is undefined for results. All needed protocol information is in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures.</td>
 * </tr>
 * <tr>
 * <td>**lpszQueryString**</td>
 * <td>When <i>dwControlFlags</i> includes **LUP_RETURN_QUERY_STRING**, this member returns the unparsed remainder of the **lpszServiceInstanceName** specified in the original query. For example, in a namespace that identifies services by hierarchical names that specify a host name and a file path within that host, the address returned might be the host address and the unparsed remainder might be the file path. If the **lpszServiceInstanceName** is fully parsed and **LUP_RETURN_QUERY_STRING** is used, this member is null or points to a zero-length string.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfCsAddrs**</td>
 * <td>The number of elements in the array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>A pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures, with one complete transport address contained within each element.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>The **RESULT_IS_ALIAS** flag indicates this is an alias result.</td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>A pointer to a provider-specific entity. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2LOOKUPSERVICENEXTEX extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hAsyncCall 
     * @param {HANDLE} hLookup 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<Integer>} lpdwBufferLength 
     * @param {Pointer<WSAQUERYSET2W>} lpqsResults 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hAsyncCall, hLookup, dwControlFlags, lpdwBufferLength, lpqsResults) {
        hAsyncCall := hAsyncCall is Win32Handle ? NumGet(hAsyncCall, "ptr") : hAsyncCall
        hLookup := hLookup is Win32Handle ? NumGet(hLookup, "ptr") : hLookup

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        ComCall(3, this, "ptr", hAsyncCall, "ptr", hLookup, "uint", dwControlFlags, lpdwBufferLengthMarshal, lpdwBufferLength, "ptr", lpqsResults)
    }
}

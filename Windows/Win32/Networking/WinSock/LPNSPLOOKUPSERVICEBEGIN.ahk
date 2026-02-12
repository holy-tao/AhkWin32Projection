#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initiates a client query that is constrained by the information contained within a WSAQUERYSET structure.
 * @remarks
 * If **LUP_CONTAINERS** is specified in a call, avoid all other restriction values. If any are supplied, the name service provider must decide if it can support this restriction over the containers. If not, it should return an error.
 * 
 * Some name service providers may have other means of finding containers. For example, containers can all be of some well-known type, or of a set of well-known types, and therefore a query restriction could be created for finding them. No matter what other means the name service provider has for locating containers, **LUP_CONTAINERS** and **LUP_NOCONTAINERS** take precedence. Therefore, if a query restriction is given that includes containers, specifying **LUP_NOCONTAINERS** will prevent the container items from being returned. Similarly, no matter what the query restriction, if **LUP_CONTAINERS** is given, only containers should be returned. If a namespace does not support containers and **LUP_CONTAINERS** is specified, it should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANO_DATA</a>.
 * 
 * The preferred method of obtaining the containers within another container, is the call:
 * 
 * 
 * ```cpp
 * dwStatus = NSPLookupServiceBegin(
 *     lpqsRestrictions,
 *     LUP_CONTAINERS,
 *     lphLookup);
 * 
 * ```
 * 
 * 
 * followed by the requisite number of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicenext">NSPLookupServiceNext</a> calls. This will return all containers contained immediately within the starting context; that is, it is not a deep query. With this, one can map the address space structure by walking the hierarchy, perhaps enumerating the content of selected containers. Subsequent uses of 
 * **NSPLookupServiceBegin** use the containers returned from a previous call.
 * 
 * <h3><a id="Forming_Queries"></a><a id="forming_queries"></a><a id="FORMING_QUERIES"></a>Forming Queries</h3>
 * 
 * 
 * As mentioned, a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a> structure is used as an input parameter to 
 * **NSPLookupServiceBegin** to qualify the query. The following table lists **WSAQUERYSET** member names and describes how the 
 * **WSAQUERYSET** is used to construct a query. When a member is marked as (Optional) a null pointer can be supplied, indicating that the parameter will not be used as a search criteria. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/name-resolution-data-structures-2">Query-Related Data Structures</a>.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET member name</th>
 * <th>Query interpretation</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>Will be set to sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a>). This is a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>Ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>Optional. Referenced string contains service name. The semantics for wildcarding within the string are not defined, but can be supported by certain namespace providers.</td>
 * </tr>
 * <tr>
 * <td>**lpServiceClassId**</td>
 * <td>Required. GUID corresponding to the service class.</td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>Optional. References desired version number and provides version comparison semantics (that is, version must match exactly, or version must be not less than the value supplied).</td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>Ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>Identifier of a single namespace in which to constrain the search, or **NS_ALL** to include all namespaces.</td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>Optional. References the GUID of a specific namespace provider and limits the query to this provider only.</td>
 * </tr>
 * <tr>
 * <td>**lpszContext**</td>
 * <td>Optional. Specifies the starting point of the query in a hierarchical namespace.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfProtocols**</td>
 * <td>Size, in bytes, of the number of entries in the protocol constraint array, can be zero.</td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>Optional. A references to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-afprotocols">AFPROTOCOLS</a> structures. Only services that use these protocols will be returned. It is permissible for the value **AF_UNSPEC** to appear as a protocol family value, signifying a wildcard. Namespace providers may supply information about any service that uses the corresponding protocol, regardless of address family.</td>
 * </tr>
 * <tr>
 * <td>**lpszQueryString**</td>
 * <td>Optional. Some namespaces (such as whois++) support rich SQL-like queries contained in a simple text string. This parameter is used to specify that string.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfCsAddrs**</td>
 * <td>Ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>Ignored for queries.</td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>Optional. A pointer to a provider-specific entity.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnsplookupservicebegin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPLOOKUPSERVICEBEGIN extends IUnknown {

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
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<WSAQUERYSETW>} lpqsRestrictions 
     * @param {Pointer<WSASERVICECLASSINFOW>} lpServiceClassInfo 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<HANDLE>} lphLookup 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, lpqsRestrictions, lpServiceClassInfo, dwControlFlags, lphLookup) {
        result := ComCall(3, this, "ptr", lpProviderId, "ptr", lpqsRestrictions, "ptr", lpServiceClassInfo, "uint", dwControlFlags, "ptr", lphLookup, "int")
        return result
    }
}

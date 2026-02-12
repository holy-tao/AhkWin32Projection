#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called after obtaining a handle from a previous call to NSPLookupServiceBegin in order to retrieve the requested service information.
 * @remarks
 * The <i>dwControlFlags</i> specified in this function and the ones specified at the time of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> are handled as "restrictions" for the purpose of combination. The restrictions are combined between the ones at 
 * **NSPLookupServiceBegin** time and the ones at 
 * **NSPLookupServiceNext** time. Therefore, the flags at 
 * **NSPLookupServiceNext** can never increase the amount of data returned beyond what was requested at 
 * **NSPLookupServiceBegin**, although it is not an error to specify more or less flags. The flags specified at a given 
 * **NSPLookupServiceNext** apply only to that call.
 * 
 * The <i>dwControlFlags</i> **LUP_FLUSHPREVIOUS** and **LUP_RES_SERVICE** are exceptions to the combined restrictions rule (because they are behavior flags instead of "restriction" flags). If either flag is used in 
 * **NSPLookupServiceNext**, they have their defined effect regardless of the setting of the same flags at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a>.
 * 
 * For example, if **LUP_RETURN_VERSION** is specified at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a>, the service provider retrieves records including the version. If **LUP_RETURN_VERSION** is not specified at 
 * **NSPLookupServiceNext**, the returned information does not include the version, even though it was available. No error is generated.
 * 
 * Also for example, if **LUP_RETURN_BLOB** is not specified at 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a>, but is specified at 
 * **NSPLookupServiceNext**, the returned information does not include the private data. No error is generated.
 * 
 * <h3><a id="Query_Results"></a><a id="query_results"></a><a id="QUERY_RESULTS"></a>Query Results</h3>
 * The following table lists <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a> and describes how query results are represented in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/name-resolution-data-structures-2">Query-Related Data Structures</a>.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET member name</th>
 * <th>Result interpretation</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>Will be set to sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a>). This is used as a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>**RESULT_IS_ALIAS** flag indicates this is an alias result.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>References the string that contains the service name.</td>
 * </tr>
 * <tr>
 * <td>**lpServiceClassId**</td>
 * <td>GUID corresponding to the service class.</td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>References version number of the particular service instance.</td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>Optional. Comment string supplied by service instance.</td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>Namespace in which the service instance was found.</td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>Identifies the specific namespace provider that supplied this query result.</td>
 * </tr>
 * <tr>
 * <td>**lpszContext**</td>
 * <td>Specifies the context point in a hierarchical namespace at which the service is located.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfProtocols**</td>
 * <td>Undefined for results.</td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>Undefined for results, all needed protocol information is in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures.</td>
 * </tr>
 * <tr>
 * <td>**lpszQueryString**</td>
 * <td>When <i>dwControlFlags</i> includes **LUP_RETURN_QUERY_STRING**, this member returns the unparsed remainder of the **lpszServiceInstanceName** specified in the original query. For example, in a namespace that identifies services by hierarchical names that specify a host name and a file path within that host, the address returned might be the host address and the unparsed remainder might be the file path. If the **lpszServiceInstanceName** is fully parsed and **LUP_RETURN_QUERY_STRING** is used, this member is null or points to a zero-length string.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfCsAddrs**</td>
 * <td>Indicates the number of elements in the array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>A pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures, with one complete transport address contained within each element.</td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>Optional. A pointer to a provider-specific entity.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnsplookupservicenext
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPLOOKUPSERVICENEXT extends IUnknown {

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
     * @param {HANDLE} hLookup 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<Integer>} lpdwBufferLength 
     * @param {Pointer} lpqsResults 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hLookup, dwControlFlags, lpdwBufferLength, lpqsResults) {
        hLookup := hLookup is Win32Handle ? NumGet(hLookup, "ptr") : hLookup

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hLookup, "uint", dwControlFlags, lpdwBufferLengthMarshal, lpdwBufferLength, "ptr", lpqsResults, "int")
        return result
    }
}

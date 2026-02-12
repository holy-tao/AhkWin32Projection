#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers or deregisters a service instance within a namespace.
 * @remarks
 * The following table lists the available values for <i>essOperation</i> and <i>dwControlFlags</i>.
 * 
 * <table>
 * <tr>
 * <th>Operation</th>
 * <th>Flags</th>
 * <th>Service already exists</th>
 * <th>Service does not exist</th>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_REGISTER**</td>
 * <td>None</td>
 * <td>Overwrites the object. Uses only addresses specified. Object is REGISTERED.</td>
 * <td>Creates a new object. Uses only addresses specified. Object is REGISTERED.</td>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_REGISTER**</td>
 * <td>**SERVICE_MULTIPLE**</td>
 * <td>Updates object. Adds new addresses to existing set. Object is REGISTERED.</td>
 * <td>Creates a new object. Uses all addresses specified. Object is REGISTERED.</td>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_DEREGISTER**</td>
 * <td>None</td>
 * <td>Removes all addresses, but does not remove object from namespace. Object is DEREGISTERED.</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a>
 * </td>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_DEREGISTER**</td>
 * <td>**SERVICE_MULTIPLE**</td>
 * <td>Updates object. Removes only addresses that are specified. Only mark object as DEREGISTERED if no addresses are present. Does not remove from the namespace.</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a>
 * </td>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_DELETE**</td>
 * <td>None</td>
 * <td>Removes object from the namespace.</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a>
 * </td>
 * </tr>
 * <tr>
 * <td>**RNRSERVICE_DELETE**</td>
 * <td>**SERVICE_MULTIPLE**</td>
 * <td>Removes only addresses that are specified. Only removes object from the namespace if no addresses remain.</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * When the  <i>dwControlFlags</i> parameter is set to **SERVICE_MULTIPLE**, this enables an application to manage its addresses independently. This is useful when the application must manage its protocols individually or when the service resides on more than one computer. For example, when a service uses more than one protocol, one listening socket may abort, but the other sockets remain operational. In this example, the service could deregister the aborted address without affecting the other addresses.
 * 
 * When using **SERVICE_MULTIPLE**, an application must not let old addresses remain in the object. This can happen if the application aborts without issuing a **RNRSERVICE_DEREGISTER** request. When a service registers, it should store its addresses. On its next call, the service should explicitly deregister these old addresses before registering new addresses.
 * 
 * <h3><a id="Service_Properties"></a><a id="service_properties"></a><a id="SERVICE_PROPERTIES"></a>Service Properties</h3>
 * The following table lists <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a> member names and describes how service property data is represented. Members labeled as (Optional) can be supplied with a null pointer.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET member name</th>
 * <th>Service property description</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>Set to the sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaquerysetw">WSAQUERYSET</a>). This is a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>The referenced string contains the service instance name.</td>
 * </tr>
 * <tr>
 * <td>**lpServiceClassId**</td>
 * <td>The GUID that corresponds to this service class.</td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>Optional. Supplies the service instance version number.</td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>Optional. An optional comment string.</td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>Ignored for this operation.</td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>Ignored for this operation. The provider identifier is contained in the <i>lpProviderId</i> parameter.</td>
 * </tr>
 * <tr>
 * <td>**lpszContext**</td>
 * <td>Optional. The starting point of the query in a hierarchical namespace.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfProtocols**</td>
 * <td>Ignored for this operation.</td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>Ignored for this operation.</td>
 * </tr>
 * <tr>
 * <td>**pszQueryString**</td>
 * <td>Ignored for this operation.</td>
 * </tr>
 * <tr>
 * <td>**dwNumberOfCsAddrs**</td>
 * <td>The number of elements in the array of <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures referenced by <i>lpcsaBuffer</i>.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures that contain the address or addresses that the service is listening on.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>Ignored for this operation.</td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>Optional. Pointer to a provider-specific entity.</td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert">**Note**  It is acceptable for the **iProtocol** member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structure to contain the manifest constant **IPROTOCOL_ANY**, indicating a wildcard value. The namespace provider should substitute an acceptable value for the given address family and socket type.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspsetservice
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPSETSERVICE extends IUnknown {

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
     * @param {Pointer<WSASERVICECLASSINFOW>} lpServiceClassInfo 
     * @param {Pointer<WSAQUERYSETW>} lpqsRegInfo 
     * @param {Integer} essOperation 
     * @param {Integer} dwControlFlags 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, lpServiceClassInfo, lpqsRegInfo, essOperation, dwControlFlags) {
        result := ComCall(3, this, "ptr", lpProviderId, "ptr", lpServiceClassInfo, "ptr", lpqsRegInfo, "int", essOperation, "uint", dwControlFlags, "int")
        return result
    }
}

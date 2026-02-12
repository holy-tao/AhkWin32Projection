#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers or deregisters a name or service instance within a namespace of a namespace service provider version-2 (NSPv2) provider.
 * @remarks
 * The 
 * **NSPv2SetServiceEx** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2SetServiceEx** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. This client session argument can be passed to the **NSPv2SetServiceEx** function in the <i>lpvClientSessionArg</i> parameter.
 * 
 * The **NSPv2SetServiceEx** function is optional, dependent on the requirements of the NSPv2 provider. If the **NSPv2SetServiceEx** function isn't implemented, then the NSPv2 function pointer can be to a stub function that always returns **NO_ERROR**.
 * 
 * The following table lists the possible combination of values for <i>essOperation</i> and <i>dwControlFlags</i> parameters.
 * 
 * <table>
 * <tr>
 * <th>essOperation</th>
 * <th>dwControlFlags</th>
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
 *  If the **NSPv2SetServiceEx** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2SetServiceEx** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function. 
 * 
 * <h3><a id="Service_Properties"></a><a id="service_properties"></a><a id="SERVICE_PROPERTIES"></a>Service Properties</h3>
 * The following table lists <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a> member names and describes how service property data is represented. Members labeled as optional and dependent on the requirements of the NSPv2 provider may be supplied as a **NULL** pointer when unused by the namespace provider.
 * 
 * <table>
 * <tr>
 * <th>WSAQUERYSET2 member name</th>
 * <th>Service property description</th>
 * </tr>
 * <tr>
 * <td>**dwSize**</td>
 * <td>Set to the sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaqueryset2w">WSAQUERYSET2</a>). This is a versioning mechanism.</td>
 * </tr>
 * <tr>
 * <td>**lpszServiceInstanceName**</td>
 * <td>A string that contains the service instance name.</td>
 * </tr>
 * <tr>
 * <td>**lpVersion**</td>
 * <td>The service instance version number. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpszComment**</td>
 * <td>A comment string. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**dwNameSpace**</td>
 * <td>The namespace identifier. This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpNSProviderId**</td>
 * <td>The provider identifier. Note that the namespace provider identifier is also passed in the <i>lpProviderId</i> parameter. This member is optional, dependent on the requirements of the NSPv2 service provider.
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
 * <td>The size, in bytes, of the number of entries in the protocol constraint array. This member can be zero.This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpafpProtocols**</td>
 * <td>An array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-afprotocols">AFPROTOCOLS</a> structures. This member is optional, dependent on the requirements of the NSPv2 service provider.
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
 * <td>The number of elements in the array of <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures referenced by <i>lpcsaBuffer</i>.</td>
 * </tr>
 * <tr>
 * <td>**lpcsaBuffer**</td>
 * <td>A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures that contain the address or addresses that the service is listening on.</td>
 * </tr>
 * <tr>
 * <td>**dwOutputFlags**</td>
 * <td>
 * This member is optional, dependent on the requirements of the NSPv2 service provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>**lpBlob**</td>
 * <td>A pointer to a provider-specific entity. This member is required for the NS_EMAIL namespace. This member is optional, dependent on the requirements for other NSPv2 service providers.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert">**Note**  It is acceptable for the **iProtocol** member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structure to contain the manifest constant **IPROTOCOL_ANY**, indicating a wildcard value. The namespace provider should substitute an acceptable value for the given address family and socket type.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2setserviceex
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2SETSERVICEEX extends IUnknown {

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
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<WSAQUERYSET2W>} lpqsRegInfo 
     * @param {Integer} essOperation 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<Void>} lpvClientSessionArg 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hAsyncCall, lpProviderId, lpqsRegInfo, essOperation, dwControlFlags, lpvClientSessionArg) {
        hAsyncCall := hAsyncCall is Win32Handle ? NumGet(hAsyncCall, "ptr") : hAsyncCall

        lpvClientSessionArgMarshal := lpvClientSessionArg is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hAsyncCall, "ptr", lpProviderId, "ptr", lpqsRegInfo, "int", essOperation, "uint", dwControlFlags, lpvClientSessionArgMarshal, lpvClientSessionArg)
    }
}

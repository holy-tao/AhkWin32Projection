#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WSAESETSERVICEOP.ahk" { WSAESETSERVICEOP }
#Import ".\WSAQUERYSET2W.ahk" { WSAQUERYSET2W }

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
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspv2setserviceex
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPV2SETSERVICEEX {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPV2SETSERVICEEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hAsyncCall A handle returned from the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> used for asynchronous calls.
     * @param {Pointer<Guid>} lpProviderId A pointer to the GUID of the specific namespace provider in which the name or service is registered.
     * @param {Pointer<WSAQUERYSET2W>} lpqsRegInfo The property information to be updated upon registration.
     * @param {WSAESETSERVICEOP} essOperation The type of operation requested. 
     * 
     * This parameter can be one of the values from the **WSAESETSERVICEOP** enumeration type defined in the <i>Winsock2.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RNRSERVICE_REGISTER"></a><a id="rnrservice_register"></a><dl>
     * <dt><b>RNRSERVICE_REGISTER</b></dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Register the service. For the Service Advertising Protocol (SAP) namespace used within a NetWare environment, this means sending a periodic broadcast. This is an NOP for the Domain Name System (DNS) namespace. For persistent data stores this means updating the address information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RNRSERVICE_DEREGISTER"></a><a id="rnrservice_deregister"></a><dl>
     * <dt><b>RNRSERVICE_DEREGISTER</b></dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deregister the service. For the SAP namespace, this means stop sending the periodic broadcast. This is a NOP for the DNS namespace. For persistent data stores this means deleting address information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RNRSERVICE_DELETE"></a><a id="rnrservice_delete"></a><dl>
     * <dt><b>RNRSERVICE_DELETE</b></dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the service from dynamic name and persistent spaces. For services represented by multiple 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-csaddr_info">CSADDR_INFO</a> structures (using the SERVICE_MULTIPLE flag), only the supplied address will be deleted, and this must match exactly the corresponding **CSADDR_INFO** structure supplied when the service was registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwControlFlags A set of flags that controls the operation requested. 
     * 
     * The possible values for this parameter are defined in the <i>Winsock2.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_MULTIPLE"></a><a id="service_multiple"></a><dl>
     * <dt><b>SERVICE_MULTIPLE</b></dl>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Control the scope of the operation. 
     * 
     * When this value is set, the action is only performed on the given address set. A register operation does not invalidate existing addresses and a deregister operation only invalidates the given set of addresses.
     * 
     * When this value is absent, service addresses are managed as a group. A register or deregister invalidates all existing addresses before adding the given address set. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpvClientSessionArg A pointer to the client session.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hAsyncCall, lpProviderId, lpqsRegInfo, essOperation, dwControlFlags, lpvClientSessionArg) {
        lpvClientSessionArgMarshal := lpvClientSessionArg is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hAsyncCall, Guid.Ptr, lpProviderId, WSAQUERYSET2W.Ptr, lpqsRegInfo, WSAESETSERVICEOP, essOperation, UInt32, dwControlFlags, lpvClientSessionArgMarshal, lpvClientSessionArg)
    }

    /**
     * A LPNSPV2SETSERVICEEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPV2SETSERVICEEX {
        /**
         * Creates a LPNSPV2SETSERVICEEX pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Guid, WSAQUERYSET2W, WSAESETSERVICEOP, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Guid.Ptr, WSAQUERYSET2W.Ptr, WSAESETSERVICEOP, UInt32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

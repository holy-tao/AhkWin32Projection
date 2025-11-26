#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumNetworkConnections.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetwork interface represents a network on the local machine. It can also represent a collection of network connections with a similar network signature.
 * @remarks
 * 
 * The COM Object that implements <b>INetwork</b> also implements a property bag for additional properties. To get access to this property bag you can use the <b>INetwork</b> interface and <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms890661(v=msdn.10)">QueryInterface</a> for <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>. The property bag on this COM Object contains the following properties:
 * 
 * <table>
 * <tr>
 * <th>Parameter</th>
 * <th>Type</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>NA_DomainAuthenticationFailed</td>
 * <td>VT_BOOL</td>
 * <td>Specifies that a domain network is not able to authenticate against the domain controller.</td>
 * </tr>
 * <tr>
 * <td>NA_NetworkClass</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_network_class">NLM_NETWORK_CLASS</a> value stored as VT_UINT </td>
 * <td>Specifies the class of network. Possible values include:<ul>
 * <li>
 * NLM_NETWORK_IDENTIFYING     (0x01)
 * 
 * This is the special "Identifying" network. No properties on this network class can be changed.
 * 
 * </li>
 * <li>
 * NLM_NETWORK_IDENTIFIED       (0x02)
 * 
 * This is an Identified network.
 * 
 * </li>
 * <li>
 * NLM_NETWORK_UNIDENTIFIED    (0x03)
 * 
 * This is the special "Unidentified" network. The category of this network can be changed, but it will not persist when the network is disconnected.
 * 
 * </li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * NA_InternetConnectivityV4 
 * 
 * or
 * 
 * NA_InternetConnectivityV6 
 * 
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_internet_connectivity">NLM_INTERNET_CONNECTIVITY</a> value stored as VT_UINT</td>
 * <td>
 * Provides details regarding IPv4 or IPv6 network connectivity. Possible values include:<ul>
 * <li>
 * NLM_INTERNET_CONNECTIVITY_WEBHIJACK (0x1)
 * 
 * The detected network is a hotspot. For example, when connected to a coffee Wi-Fi hotspot network and the local HTTP traffic is being redirected to a captive portal, this flag will be set.
 * 
 * </li>
 * <li>
 * NLM_INTERNET_CONNECTIVITY_PROXIED (0x2)
 * 
 * The detected network has a proxy configuration. For example, when connected to a corporate network using a proxy for HTTP access, this flag will be set.
 * 
 * </li>
 * <li>
 * NLM_INTERNET_CONNECTIVITY_CORPORATE (0x4)
 * 
 * The machine has been configured for Direct Access and access is detected to the corporate domain network Direct Access has been configured for.
 * 
 * </li>
 * </ul>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>NA_NameSetByPolicy</td>
 * <td>VT_BOOL</td>
 * <td>The name of the network has been set by group policy.</td>
 * </tr>
 * <tr>
 * <td>NA_IconSetByPolicy</td>
 * <td>VT_BOOL</td>
 * <td>The icon of the network has been set by group policy.</td>
 * </tr>
 * <tr>
 * <td>NA_DescriptionSetByPolicy</td>
 * <td>VT_BOOL</td>
 * <td>The description of the network has been set by group policy.</td>
 * </tr>
 * <tr>
 * <td>NA_CategorySetByPolicy</td>
 * <td>VT_BOOL</td>
 * <td>The category of the network has been set by group policy.</td>
 * </tr>
 * <tr>
 * <td>NA_NameReadOnly</td>
 * <td>VT_BOOL</td>
 * <td>The name of the network is read only.</td>
 * </tr>
 * <tr>
 * <td>NA_IconReadOnly</td>
 * <td>VT_BOOL</td>
 * <td>The icon of the network is read only.</td>
 * </tr>
 * <tr>
 * <td>NA_DescriptionReadOnly</td>
 * <td>VT_BOOL</td>
 * <td>The description of the network is read only.</td>
 * </tr>
 * <tr>
 * <td>NA_CategoryReadOnly</td>
 * <td>VT_BOOL</td>
 * <td>The category of the network is read only.</td>
 * </tr>
 * <tr>
 * <td>NA_AllowMerge</td>
 * <td>VT_BOOL</td>
 * <td>The network can be merged with another network.</td>
 * </tr>
 * </table>
 *  
 * 
 * The <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> interface accepts <i>LPCOLESTR</i> as part of the <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms884257(v=msdn.10)">IPropertyBag::Read</a> and <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag::Write</a> methods. For convenience, the string values for these properties are defined inside <b>netlistmgr.h</b> using the same names.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetwork
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetwork extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetwork
     * @type {Guid}
     */
    static IID => Guid("{dcb00002-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "SetName", "GetDescription", "SetDescription", "GetNetworkId", "GetDomainType", "GetNetworkConnections", "GetTimeCreatedAndConnected", "get_IsConnectedToInternet", "get_IsConnected", "GetConnectivity", "GetCategory", "SetCategory"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnectedToInternet {
        get => this.get_IsConnectedToInternet()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * The GetName method returns the name of a network.
     * @returns {BSTR} Pointer to the name of the network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getname
     */
    GetName() {
        pszNetworkName := BSTR()
        result := ComCall(7, this, "ptr", pszNetworkName, "HRESULT")
        return pszNetworkName
    }

    /**
     * The SetName method sets or renames a network.
     * @param {BSTR} szNetworkNewName Zero-terminated string that contains the new name of the network.
     * @returns {HRESULT} Returns S_OK if the method succeeds. Otherwise, the method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>szNetworkNewName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILENAME_EXCED_RANGE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name provided is too long. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-setname
     */
    SetName(szNetworkNewName) {
        szNetworkNewName := szNetworkNewName is String ? BSTR.Alloc(szNetworkNewName).Value : szNetworkNewName

        result := ComCall(8, this, "ptr", szNetworkNewName, "HRESULT")
        return result
    }

    /**
     * The GetDescription method returns a description string for the network.
     * @returns {BSTR} Pointer to a string that specifies the text description of the network. This value must be freed using the SysFreeString API.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getdescription
     */
    GetDescription() {
        pszDescription := BSTR()
        result := ComCall(9, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * The SetDescription method sets or replaces the description for a network.
     * @param {BSTR} szDescription Zero-terminated string that contains the description of the network.
     * @returns {HRESULT} Returns S_OK if the method succeeds. Otherwise, the method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>szDescription</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILENAME_EXCED_RANGE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given name is too long. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-setdescription
     */
    SetDescription(szDescription) {
        szDescription := szDescription is String ? BSTR.Alloc(szDescription).Value : szDescription

        result := ComCall(10, this, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * The GetNetworkId method returns the unique identifier of a network.
     * @returns {Guid} Pointer to a GUID that specifies the network ID.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getnetworkid
     */
    GetNetworkId() {
        pgdGuidNetworkId := Guid()
        result := ComCall(11, this, "ptr", pgdGuidNetworkId, "HRESULT")
        return pgdGuidNetworkId
    }

    /**
     * The GetDomainType method returns the domain type of a network.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_domain_type">NLM_DOMAIN_TYPE</a> enumeration value that specifies the domain type of the network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getdomaintype
     */
    GetDomainType() {
        result := ComCall(12, this, "int*", &pNetworkType := 0, "HRESULT")
        return pNetworkType
    }

    /**
     * The GetNetworkConnections method returns an enumeration of all network connections for a network. A network can have multiple connections to it from different interfaces or different links from the same interface.
     * @returns {IEnumNetworkConnections} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworkconnections">IEnumNetworkConnections</a> interface instance that enumerates the list of local connections to this network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getnetworkconnections
     */
    GetNetworkConnections() {
        result := ComCall(13, this, "ptr*", &ppEnumNetworkConnection := 0, "HRESULT")
        return IEnumNetworkConnections(ppEnumNetworkConnection)
    }

    /**
     * The GetTimeCreatedAndConnected method returns the local date and time when the network was created and connected.
     * @param {Pointer<Integer>} pdwLowDateTimeCreated Pointer to a datetime when  the network was created. Specifically, it contains the  low DWORD of <b>FILETIME.dwLowDateTime</b>.
     * @param {Pointer<Integer>} pdwHighDateTimeCreated Pointer to a datetime when  the network was created. Specifically, it contains the  high DWORD of <b>FILETIME.dwLowDateTime</b>.
     * @param {Pointer<Integer>} pdwLowDateTimeConnected Pointer to a datetime when the network was last connected to. Specifically, it contains the  low DWORD of <b>FILETIME.dwLowDateTime</b>.
     * @param {Pointer<Integer>} pdwHighDateTimeConnected Pointer to a datetime when the network was last connected to. Specifically, it contains the  high DWORD of <b>FILETIME.dwLowDateTime</b>.
     * @returns {HRESULT} Returns S_OK if the method succeeds. Otherwise, the method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer passed is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-gettimecreatedandconnected
     */
    GetTimeCreatedAndConnected(pdwLowDateTimeCreated, pdwHighDateTimeCreated, pdwLowDateTimeConnected, pdwHighDateTimeConnected) {
        pdwLowDateTimeCreatedMarshal := pdwLowDateTimeCreated is VarRef ? "uint*" : "ptr"
        pdwHighDateTimeCreatedMarshal := pdwHighDateTimeCreated is VarRef ? "uint*" : "ptr"
        pdwLowDateTimeConnectedMarshal := pdwLowDateTimeConnected is VarRef ? "uint*" : "ptr"
        pdwHighDateTimeConnectedMarshal := pdwHighDateTimeConnected is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwLowDateTimeCreatedMarshal, pdwLowDateTimeCreated, pdwHighDateTimeCreatedMarshal, pdwHighDateTimeCreated, pdwLowDateTimeConnectedMarshal, pdwLowDateTimeConnected, pdwHighDateTimeConnectedMarshal, pdwHighDateTimeConnected, "HRESULT")
        return result
    }

    /**
     * The get_IsConnectedToInternet property specifies if the network has internet connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network has connectivity to the internet; if <b>FALSE</b>, it does not.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(15, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The get_IsConnected property specifies if the network has any network connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network is connected; if <b>FALSE</b>, it is not.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(16, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The GetConnectivity method returns the connectivity state of the network.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains a bitmask  that specifies the connectivity state of this network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(17, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
    }

    /**
     * The GetCategory method returns the category of a network.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_network_category">NLM_NETWORK_CATEGORY</a> enumeration value that specifies the category information for the network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-getcategory
     */
    GetCategory() {
        result := ComCall(18, this, "int*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * The SetCategory method sets the category of a network. Changes made take effect immediately. Callers of this API must be members of the Administrators group.
     * @param {Integer} NewCategory Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_network_category">NLM_NETWORK_CATEGORY</a> enumeration value that specifies the new category of the network.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetwork-setcategory
     */
    SetCategory(NewCategory) {
        result := ComCall(19, this, "int", NewCategory, "HRESULT")
        return result
    }
}

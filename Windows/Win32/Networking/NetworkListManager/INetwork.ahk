#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pszNetworkName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getname
     */
    GetName(pszNetworkName) {
        result := ComCall(7, this, "ptr", pszNetworkName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} szNetworkNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-setname
     */
    SetName(szNetworkNewName) {
        szNetworkNewName := szNetworkNewName is String ? BSTR.Alloc(szNetworkNewName).Value : szNetworkNewName

        result := ComCall(8, this, "ptr", szNetworkNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getdescription
     */
    GetDescription(pszDescription) {
        result := ComCall(9, this, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} szDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-setdescription
     */
    SetDescription(szDescription) {
        szDescription := szDescription is String ? BSTR.Alloc(szDescription).Value : szDescription

        result := ComCall(10, this, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pgdGuidNetworkId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getnetworkid
     */
    GetNetworkId(pgdGuidNetworkId) {
        result := ComCall(11, this, "ptr", pgdGuidNetworkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNetworkType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getdomaintype
     */
    GetDomainType(pNetworkType) {
        pNetworkTypeMarshal := pNetworkType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pNetworkTypeMarshal, pNetworkType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworkConnections>} ppEnumNetworkConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getnetworkconnections
     */
    GetNetworkConnections(ppEnumNetworkConnection) {
        result := ComCall(13, this, "ptr*", ppEnumNetworkConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLowDateTimeCreated 
     * @param {Pointer<Integer>} pdwHighDateTimeCreated 
     * @param {Pointer<Integer>} pdwLowDateTimeConnected 
     * @param {Pointer<Integer>} pdwHighDateTimeConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-gettimecreatedandconnected
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-get_isconnectedtointernet
     */
    get_IsConnectedToInternet(pbIsConnected) {
        result := ComCall(15, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-get_isconnected
     */
    get_IsConnected(pbIsConnected) {
        result := ComCall(16, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConnectivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getconnectivity
     */
    GetConnectivity(pConnectivity) {
        pConnectivityMarshal := pConnectivity is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pConnectivityMarshal, pConnectivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-getcategory
     */
    GetCategory(pCategory) {
        pCategoryMarshal := pCategory is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pCategoryMarshal, pCategory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetwork-setcategory
     */
    SetCategory(NewCategory) {
        result := ComCall(19, this, "int", NewCategory, "HRESULT")
        return result
    }
}

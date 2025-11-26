#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDXMLContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to discover services on the network advertised by WS-Discovery.
 * @remarks
 * 
 * The Discovery Provider represents the "client" view of WS-Discovery.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoveryprovider
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDiscoveryProvider
     * @type {Guid}
     */
    static IID => Guid("{8ffc8e55-f0eb-480f-88b7-b435dd281d45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAddressFamily", "Attach", "Detach", "SearchById", "SearchByAddress", "SearchByType", "GetXMLContext"]

    /**
     * Specifies the IP address family (IPv4, IPv6, or both) to search when discovering WSD devices.
     * @param {Integer} dwAddressFamily The address family to search when discovering devices.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV4"></a><a id="wsdapi_addressfamily_ipv4"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search over IPv4 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV6"></a><a id="wsdapi_addressfamily_ipv6"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search over IPv6 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV4___WSDAPI_ADDRESSFAMILY_IPV6"></a><a id="wsdapi_addressfamily_ipv4___wsdapi_addressfamily_ipv6"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV4 | WSDAPI_ADDRESSFAMILY_IPV6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search over IPv4 and IPv6 addresses.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwAddressFamily</i> has a value other than WSDAPI_ADDRESSFAMILY_IPV4, WSDAPI_ADDRESSFAMILY_IPV6, or WSDAPI_ADDRESSFAMILY_IPV4 | WSDAPI_ADDRESSFAMILY_IPV6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INVALIDFUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family has already been set for this publisher.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(WSAESOCKTNOSUPPORT)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not support the address family specified by <i>dwAddressFamily</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-setaddressfamily
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "HRESULT")
        return result
    }

    /**
     * Attaches a callback interface to the discovery provider.
     * @param {IWSDiscoveryProviderNotify} pSink Interface to receive callback notifications.  Search results as well as the Hello and Bye messages are communicated to this interface via the callbacks.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSink</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A callback interface has already been attached to the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach
     */
    Attach(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Detaches a callback interface from the discovery provider.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A callback interface has not been attached. You must call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-detach
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device identifier.
     * @param {PWSTR} pszId Device identifier of the desired discovery provider.
     * @param {PWSTR} pszTag Optional identifier tag for this search.  May be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszId</i> is <b>NULL</b>, the length in characters of <i>pszId</i>  exceeds WSD_MAX_TEXT_LENGTH (8192), or the length in characters of  <i>pszTag</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A callback interface has not been attached. You must call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyid
     */
    SearchById(pszId, pszTag) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszId, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device address.
     * @param {PWSTR} pszAddress The HTTP transport address of the device.
     * @param {PWSTR} pszTag Optional identifier tag for this search.  May be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszAddress</i> is <b>NULL</b>, the length in characters of <i>pszAddress</i>  exceeds WSD_MAX_TEXT_LENGTH (8192), or the length in characters of  <i>pszTag</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A callback interface has not been attached. You must call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyaddress
     */
    SearchByAddress(pszAddress, pszTag) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(7, this, "ptr", pszAddress, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device type.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of discovery provider types to search for. May be <b>NULL</b>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of discovery provider scopes to search for. May be <b>NULL</b>.
     * @param {PWSTR} pszMatchBy Matching rule used for scopes. May be <b>NULL</b>.
     * @param {PWSTR} pszTag Optional identifier tag for this search.  May be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length in characters of <i>pszMatchBy</i>  exceeds WSD_MAX_TEXT_LENGTH (8192) or the length in characters of  <i>pszTag</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A callback interface has not been attached. You must call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbytype
     */
    SearchByType(pTypesList, pScopesList, pszMatchBy, pszTag) {
        pszMatchBy := pszMatchBy is String ? StrPtr(pszMatchBy) : pszMatchBy
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(8, this, "ptr", pTypesList, "ptr", pScopesList, "ptr", pszMatchBy, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Gets the XML context associated with this provider.
     * @returns {IWSDXMLContext} Pointer to a pointer variable containing the XML context.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovider-getxmlcontext
     */
    GetXMLContext() {
        result := ComCall(9, this, "ptr*", &ppContext := 0, "HRESULT")
        return IWSDXMLContext(ppContext)
    }
}

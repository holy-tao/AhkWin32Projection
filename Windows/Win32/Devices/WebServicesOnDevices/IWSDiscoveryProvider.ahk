#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WSD_URI_LIST.ahk" { WSD_URI_LIST }
#Import ".\IWSDXMLContext.ahk" { IWSDXMLContext }
#Import ".\IWSDiscoveryProviderNotify.ahk" { IWSDiscoveryProviderNotify }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_NAME_LIST.ahk" { WSD_NAME_LIST }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to discover services on the network advertised by WS-Discovery.
 * @remarks
 * The Discovery Provider represents the "client" view of WS-Discovery.
 * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDiscoveryProvider extends IUnknown {
    /**
     * The interface identifier for IWSDiscoveryProvider
     * @type {Guid}
     */
    static IID := Guid("{8ffc8e55-f0eb-480f-88b7-b435dd281d45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDiscoveryProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAddressFamily : IntPtr
        Attach           : IntPtr
        Detach           : IntPtr
        SearchById       : IntPtr
        SearchByAddress  : IntPtr
        SearchByType     : IntPtr
        GetXMLContext    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDiscoveryProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the IP address family (IPv4, IPv6, or both) to search when discovering WSD devices.
     * @remarks
     * This method can be called only once on a provider. This method must be called before a notification sink is attached to the provider. That means <b>SetAddressFamily</b> must be called before <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> is called on a provider.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-setaddressfamily
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "HRESULT")
        return result
    }

    /**
     * Attaches a callback interface to the discovery provider.
     * @remarks
     * <div class="alert"><b>Note</b>  Attach must be called before any other <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> method is used, except for <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-setaddressfamily">SetAddressFamily</a>.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach
     */
    Attach(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Detaches a callback interface from the discovery provider.
     * @remarks
     * If a callback interface has been attached to a discovery provider via the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> method, then <b>Detach</b> must be called before releasing the reference to the provider interface object.
     * 
     * The <b>Detach</b> operation blocks until all callbacks into the associated <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovidernotify">IWSDiscoveryProviderNotify</a> object have completed.
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
     * A callback interface has not been attached. You must call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-detach
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device identifier.
     * @remarks
     * <b>SearchById</b> initiates a WS-Discovery <a href="https://docs.microsoft.com/windows/desktop/WsdApi/resolve-message">Resolve</a> in an attempt to locate a previously known specific device. <i>pszId</i> is used as the endpoint address in the Resolve. This call may result in one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add">Add</a> callbacks. If any <b>Add</b> callbacks are issued before the search completes, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete">SearchComplete</a> callback will be issued; otherwise, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed">SearchFailed</a> callback will be issued.
     * 
     * <i>pszTag</i> is an optional user provided string which will be fed back in either callback, allowing the caller to associate the callback with the original query.
     * 
     * For information about troubleshooting applications calling this method, see <a href="https://docs.microsoft.com/windows/desktop/WsdApi/troubleshooting-wsdapi-applications">Troubleshooting WSDAPI Applications</a>.
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
     * A callback interface has not been attached. You must call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyid
     */
    SearchById(pszId, pszTag) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszId, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device address.
     * @remarks
     * <b>SearchByAddress</b> initiates a WS-Discovery <a href="https://docs.microsoft.com/windows/desktop/WsdApi/probe-message">Probe</a> over HTTP in an attempt to identify a device at a known URL. The Probe is sent to the address specified by <i>pszAddress</i>. This call may result in one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add">Add</a> callbacks. If any <b>Add</b> callbacks are issued before the search completes, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete">SearchComplete</a> callback will be issued; otherwise, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed">SearchFailed</a> callback will be issued.  The interval between initiating the search and receiving either of these notifications can be up to 30 seconds.
     * 
     * <i>pszTag</i> is an optional user provided string which will be fed back in either callback, allowing the caller to associate the callback with the original query.
     * 
     * For information about troubleshooting applications calling this method, see <a href="https://docs.microsoft.com/windows/desktop/WsdApi/troubleshooting-wsdapi-applications">Troubleshooting WSDAPI Applications</a>.
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
     * A callback interface has not been attached. You must call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyaddress
     */
    SearchByAddress(pszAddress, pszTag) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(7, this, "ptr", pszAddress, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Initializes a search for WS-Discovery hosts by device type.
     * @remarks
     * <b>SearchByType</b> initiates a WS-Discovery <a href="https://docs.microsoft.com/windows/desktop/WsdApi/probe-message">Probe</a> in an attempt to locate discovery hosts matching the provided criteria. This method allows matching by types, scopes, some combination of the two, or matching all discovery capable devices (when no scopes or types are provided). 
     * 
     * <i>pszMatchBy</i> should be provided if and only if <i>pScopesList</i> is also provided. This call may result in one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add">Add</a> callbacks. If any <b>Add</b> callbacks are issued before the search completes, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete">SearchComplete</a> callback will be issued; otherwise, a <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed">SearchFailed</a> callback will be issued.
     * 
     * <i>pszTag</i> is an optional user provided string which will be fed back in either callback, allowing the caller to associate the callback with the original query.
     * 
     * For information about troubleshooting applications calling this method, see <a href="https://docs.microsoft.com/windows/desktop/WsdApi/troubleshooting-wsdapi-applications">Troubleshooting WSDAPI Applications</a>.
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
     * A callback interface has not been attached. You must call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> before calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbytype
     */
    SearchByType(pTypesList, pScopesList, pszMatchBy, pszTag) {
        pszMatchBy := pszMatchBy is String ? StrPtr(pszMatchBy) : pszMatchBy
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(8, this, WSD_NAME_LIST.Ptr, pTypesList, WSD_URI_LIST.Ptr, pScopesList, "ptr", pszMatchBy, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Gets the XML context associated with this provider.
     * @remarks
     * Returns an optional context for the XML state of the transaction. If the service layer is used then this should be the context the XML namespaces and types were registered with.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach">Attach</a> must be called before any other <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> method is used.</div>
     * <div> </div>
     * @returns {IWSDXMLContext} Pointer to a pointer variable containing the XML context.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-getxmlcontext
     */
    GetXMLContext() {
        result := ComCall(9, this, "ptr*", &ppContext := 0, "HRESULT")
        return IWSDXMLContext(ppContext)
    }

    Query(iid) {
        if (IWSDiscoveryProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAddressFamily := CallbackCreate(GetMethod(implObj, "SetAddressFamily"), flags, 2)
        this.vtbl.Attach := CallbackCreate(GetMethod(implObj, "Attach"), flags, 2)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 1)
        this.vtbl.SearchById := CallbackCreate(GetMethod(implObj, "SearchById"), flags, 3)
        this.vtbl.SearchByAddress := CallbackCreate(GetMethod(implObj, "SearchByAddress"), flags, 3)
        this.vtbl.SearchByType := CallbackCreate(GetMethod(implObj, "SearchByType"), flags, 5)
        this.vtbl.GetXMLContext := CallbackCreate(GetMethod(implObj, "GetXMLContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAddressFamily)
        CallbackFree(this.vtbl.Attach)
        CallbackFree(this.vtbl.Detach)
        CallbackFree(this.vtbl.SearchById)
        CallbackFree(this.vtbl.SearchByAddress)
        CallbackFree(this.vtbl.SearchByType)
        CallbackFree(this.vtbl.GetXMLContext)
    }
}

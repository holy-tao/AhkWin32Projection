#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnMultiCarrier.ahk" { IMbnMultiCarrier }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is a notification interface used to handle asynchronous IMbnMultiCarrier method calls.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnmulticarrierevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnMultiCarrierEvents extends IUnknown {
    /**
     * The interface identifier for IMbnMultiCarrierEvents
     * @type {Guid}
     */
    static IID := Guid("{dcdddab6-2021-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnMultiCarrierEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSetHomeProviderComplete    : IntPtr
        OnCurrentCellularClassChange : IntPtr
        OnPreferredProvidersChange   : IntPtr
        OnScanNetworkComplete        : IntPtr
        OnInterfaceCapabilityChange  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnMultiCarrierEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation.
     * @remarks
     * If <i>status</i> is <b>S_OK</b>, the home provider for the interface has been successfully set to the new provider by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>. Otherwise, the original home provider is not changed and the previous states, such as connection, packet service etc, of the interface remain unchanged.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {HRESULT} _status A status code that indicates the outcome of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation  was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_PROVIDER_NOT_VISIBLE"></a><a id="e_mbn_provider_not_visible"></a><dl>
     * <dt><b>E_MBN_PROVIDER_NOT_VISIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested provider is not visible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_INVALIDARG"></a><a id="e_invalidarg"></a><dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid registration mode input, the provider ID provided as input is longer than the maximum length 7 characters, or data class provided is invalid. The Mobile Broadband service will not send the request to the device when invalid arguments are provided in the input.
     * In manual registration mode, this indicates that the requested provider is forbidden.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_FAIL"></a><a id="e_fail"></a><dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed. More information is available in the network error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HRESULT_FROM_WIN32_ERROR_NOT_SUPPORTED_"></a><a id="hresult_from_win32_error_not_supported_"></a><dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not supported by the device. This may be returned by devices which do not support multi-carrier.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete
     */
    OnSetHomeProviderComplete(mbnInterface, requestID, _status) {
        result := ComCall(3, this, "ptr", mbnInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a GetCurrentCellularClass operation.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass">GetCurrentCellularClass</a> operation.
     * @returns {HRESULT} This method can return one of these values.
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
     * The operation  was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oncurrentcellularclasschange
     */
    OnCurrentCellularClassChange(mbnInterface) {
        result := ComCall(4, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a GetPreferredProviders operation and a change in a device's preferred provider list.
     * @remarks
     * A device's preferred provider list can be updated by the network by SMS or OTA (over The air) update. The Mobile Broadband service will call this method to notify the application about any change in the preferred provider list. The application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders">GetPreferredProviders</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object to get the updated list of preferred providers.
     * @param {IMbnMultiCarrier} mbnInterface <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a>
     * 
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders">GetPreferredProviders</a> operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange
     */
    OnPreferredProvidersChange(mbnInterface) {
        result := ComCall(5, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a ScanNetwork operation.
     * @remarks
     * If <i>status</i> is <b>S_OK</b>, the Mobile Broadband service successfully updated the cached list of visible providers. An application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders">GetVisibleProviders</a> method of the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> to get the list of visible providers.
     * 
     * If multiple applications registered for notifications, then this method will be called on all registered applications. This means that an application that did not initiate the update operation will receive a notification.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {HRESULT} _status A status code that indicates the outcome of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation  was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_RADIO_POWER_OFF"></a><a id="e_mbn_radio_power_off"></a><dl>
     * <dt><b>E_MBN_RADIO_POWER_OFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can't get a visible network list because the device radio is off.  The application can issue a network scan request when it gets the radio-turned-on notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_DEVICE_BUSY"></a><a id="e_mbn_device_busy"></a><dl>
     * <dt><b>E_MBN_DEVICE_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is busy and can't currently perform a network scan operation.  This is returned by devices which don't support a network scan operation when it has a data connection established.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_ALREADY_ACTIVE"></a><a id="e_mbn_already_active"></a><dl>
     * <dt><b>E_MBN_ALREADY_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network scan operation is already in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HRESULT_FROM_WIN32_ERROR_NOT_SUPPORTED_"></a><a id="hresult_from_win32_error_not_supported_"></a><dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not supported by the device. This may be returned by devices which do not support multi-carrier.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete
     */
    OnScanNetworkComplete(mbnInterface, requestID, _status) {
        result := ComCall(6, this, "ptr", mbnInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation that updates the interface capabilities.
     * @remarks
     * When a network carrier is changed due to a call to <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>, <b>OnInterfaceCapabilityChange</b>  is called when the interface capabilities are updated with the capabilities of the new carrier. An application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability">GetInterfaceCapability</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> object passed to <b>SetHomeProvider</b> to get the available capability information. The <b>IMbnInterface</b> can be retrieved by calling <b>QueryInterface</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object passed to <b>OnInterfaceCapabilityChange</b>. For a list of interface capabilities, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oninterfacecapabilitychange
     */
    OnInterfaceCapabilityChange(mbnInterface) {
        result := ComCall(7, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnMultiCarrierEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetHomeProviderComplete := CallbackCreate(GetMethod(implObj, "OnSetHomeProviderComplete"), flags, 4)
        this.vtbl.OnCurrentCellularClassChange := CallbackCreate(GetMethod(implObj, "OnCurrentCellularClassChange"), flags, 2)
        this.vtbl.OnPreferredProvidersChange := CallbackCreate(GetMethod(implObj, "OnPreferredProvidersChange"), flags, 2)
        this.vtbl.OnScanNetworkComplete := CallbackCreate(GetMethod(implObj, "OnScanNetworkComplete"), flags, 4)
        this.vtbl.OnInterfaceCapabilityChange := CallbackCreate(GetMethod(implObj, "OnInterfaceCapabilityChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetHomeProviderComplete)
        CallbackFree(this.vtbl.OnCurrentCellularClassChange)
        CallbackFree(this.vtbl.OnPreferredProvidersChange)
        CallbackFree(this.vtbl.OnScanNetworkComplete)
        CallbackFree(this.vtbl.OnInterfaceCapabilityChange)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is a notification interface used to handle asynchronous IMbnMultiCarrier method calls.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnmulticarrierevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnMultiCarrierEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnMultiCarrierEvents
     * @type {Guid}
     */
    static IID => Guid("{dcdddab6-2021-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetHomeProviderComplete", "OnCurrentCellularClassChange", "OnPreferredProvidersChange", "OnScanNetworkComplete", "OnInterfaceCapabilityChange"]

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {HRESULT} status A status code that indicates the outcome of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete
     */
    OnSetHomeProviderComplete(mbnInterface, requestID, status) {
        result := ComCall(3, this, "ptr", mbnInterface, "uint", requestID, "int", status, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrierevents-oncurrentcellularclasschange
     */
    OnCurrentCellularClassChange(mbnInterface) {
        result := ComCall(4, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a GetPreferredProviders operation and a change in a device's preferred provider list.
     * @param {IMbnMultiCarrier} mbnInterface <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a>
     * 
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders">GetPreferredProviders</a> operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange
     */
    OnPreferredProvidersChange(mbnInterface) {
        result := ComCall(5, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a ScanNetwork operation.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {HRESULT} status A status code that indicates the outcome of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete
     */
    OnScanNetworkComplete(mbnInterface, requestID, status) {
        result := ComCall(6, this, "ptr", mbnInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation that updates the interface capabilities.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrierevents-oninterfacecapabilitychange
     */
    OnInterfaceCapabilityChange(mbnInterface) {
        result := ComCall(7, this, "ptr", mbnInterface, "HRESULT")
        return result
    }
}

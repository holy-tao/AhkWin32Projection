#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is a notification interface used to handle asynchronous IMbnInterface method calls as well as changes in the device state.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnInterfaceEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnInterfaceEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbninterfaceevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnInterfaceEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnInterfaceEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2002-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInterfaceCapabilityAvailable", "OnSubscriberInformationChange", "OnReadyStateChange", "OnEmergencyModeChange", "OnHomeProviderAvailable", "OnPreferredProvidersChange", "OnSetPreferredProvidersComplete", "OnScanNetworkComplete"]

    /**
     * This notification method is called by the Mobile Broadband service to indicate that interface capability information is available.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> whose capability information has become available.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-oninterfacecapabilityavailable
     */
    OnInterfaceCapabilityAvailable(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate that the subscriber information for the device has changed.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents a device on which the subscriber information has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onsubscriberinformationchange
     */
    OnSubscriberInformationChange(newInterface) {
        result := ComCall(4, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate a change in an interface's ready state.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the Mobile Broadband device whose ready state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onreadystatechange
     */
    OnReadyStateChange(newInterface) {
        result := ComCall(5, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate that the emergency mode has changed.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the device whose emergency mode has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onemergencymodechange
     */
    OnEmergencyModeChange(newInterface) {
        result := ComCall(6, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate that home provider information for the device is available.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the device whose home provider information has become available.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onhomeprovideravailable
     */
    OnHomeProviderAvailable(newInterface) {
        result := ComCall(7, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate a change in a device's preferred provider list.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the Mobile Broadband device whose preferred provider list has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onpreferredproviderschange
     */
    OnPreferredProvidersChange(newInterface) {
        result := ComCall(8, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetPreferredProviders operation.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents a device on which this operation was performed.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service for this asynchronous operation.
     * @param {HRESULT} status The operation completion status.
     * 
     * The following table lists the valid values for this status.
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
     * <td width="40%"><a id="E_MBN_PIN_REQUIRED"></a><a id="e_mbn_pin_required"></a><dl>
     * <dt><b>E_MBN_PIN_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device requires a PIN to be entered for this operation to complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_SIM_NOT_INSERTED"></a><a id="e_mbn_sim_not_inserted"></a><dl>
     * <dt><b>E_MBN_SIM_NOT_INSERTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SIM is not inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_BAD_SIM"></a><a id="e_mbn_bad_sim"></a><dl>
     * <dt><b>E_MBN_BAD_SIM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A bad SIM is inserted in the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HRESULT_FROM_WIN32_ERROR_NOT_SUPPORTED_"></a><a id="hresult_from_win32_error_not_supported_"></a><dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onsetpreferredproviderscomplete
     */
    OnSetPreferredProvidersComplete(newInterface, requestID, status) {
        result := ComCall(9, this, "ptr", newInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a network scan.
     * @param {IMbnInterface} newInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents a device on which this operation was performed.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service for this notification.
     * @param {HRESULT} status The operation completion status
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterfaceevents-onscannetworkcomplete
     */
    OnScanNetworkComplete(newInterface, requestID, status) {
        result := ComCall(10, this, "ptr", newInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }
}

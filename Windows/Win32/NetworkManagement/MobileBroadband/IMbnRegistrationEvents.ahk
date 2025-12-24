#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notification interface used to indicate when registration events have occurred.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnRegistrationEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnRegistrationEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnregistrationevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnRegistrationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnRegistrationEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200a-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRegisterModeAvailable", "OnRegisterStateChange", "OnPacketServiceStateChange", "OnSetRegisterModeComplete"]

    /**
     * Notification method called by the Mobile Broadband service to indicate that registration mode information is available.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistrationevents-onregistermodeavailable
     */
    OnRegisterModeAvailable(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate a change in the device's registration state.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange
     */
    OnRegisterStateChange(newInterface) {
        result := ComCall(4, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate a change in the device packet service state.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the device whose packet service state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange
     */
    OnPacketServiceStateChange(newInterface) {
        result := ComCall(5, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification method called by the Mobile Broadband service to indicate that it has completed a set registration operation.
     * @param {IMbnRegistration} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface that represents the applicable device.  The handling application can use this interface to get the current registration state of the device.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to track the set registration operation.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * 
     * A calling application can expect one of the possible values.
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
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HRESULT_FROM_WIN32_ERROR_INVALID_STATE_"></a><a id="hresult_from_win32_error_invalid_state_"></a><dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already an active network connection. The registration mode cannot be changed when there is an already established data connection. The application should first disconnect the connection and then try changing registration mode. If the device is already in the requested mode and connected to requested provider, then the return code will be <b>S_OK</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HRESULT_FROM_WIN32_ERROR_NOT_SUPPORTED_"></a><a id="hresult_from_win32_error_not_supported_"></a><dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not supported by the device. This may be returned by devices which do not support the requested registration mode. For example, a CDMA device will return this error when requested to switch to manual registration mode.
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
     * <td width="40%"><a id="E_INVALIDARG"></a><a id="e_invalidarg"></a><dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid registration mode input or the provider ID provided as input is longer than maximum length 7 characters or data class provided is invalid.  the Mobile Broadband service will not send the request to the device when invalid arguments are provided in the input.
     * 
     * In manual registration mode, this indicates that the requested provider is forbidden.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_PIN_REQUIRED"></a><a id="e_mbn_pin_required"></a><dl>
     * <dt><b>E_MBN_PIN_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A PIN is needed for the operation to complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_SERVICE_NOT_ACTIVATED"></a><a id="e_mbn_service_not_activated"></a><dl>
     * <dt><b>E_MBN_SERVICE_NOT_ACTIVATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network service subscription has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_MBN_PROVIDER_NOT_VISIBLE"></a><a id="e_mbn_provider_not_visible"></a><dl>
     * <dt><b>E_MBN_PROVIDER_NOT_VISIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This occurs only when switching to manual registration mode. The switch is successful but the requested provider is not visible. The device will register to the requested provider when it is visible.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistrationevents-onsetregistermodecomplete
     */
    OnSetRegisterModeComplete(newInterface, requestID, status) {
        result := ComCall(6, this, "ptr", newInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }
}

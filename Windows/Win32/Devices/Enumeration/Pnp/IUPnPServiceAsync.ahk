#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to asynchronously query state variables and invoke actions on an instance of a service .
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpserviceasync
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServiceAsync
     * @type {Guid}
     */
    static IID => Guid("{098bdaf5-5ec1-49e7-a260-b3a11dd8680c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginInvokeAction", "EndInvokeAction", "BeginQueryStateVariable", "EndQueryStateVariable", "BeginSubscribeToEvents", "EndSubscribeToEvents", "BeginSCPDDownload", "EndSCPDDownload", "CancelAsyncOperation"]

    /**
     * BeginInvokeAction method invokes an action on a device in asynchronous mode. Additionally, if a delayed SCPD download and event subscription is opted-in, and it has not taken place already, this method will initiate SCPD download.
     * @param {BSTR} bstrActionName Specifies the method to invoke.
     * @param {VARIANT} vInActionArgs Specifies an array of input arguments to the method. If the action has no input arguments, this parameter must contain an empty array.  The contents of this array are service-specific.
     * @param {IUPnPAsyncResult} pAsyncResult Pointer  to a <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpasyncresult">IUPnPAsyncResult</a> object. When the <b>BeginInvokeAction</b> call is complete, 
     * 	UPnP will use the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete">IUPnPAsyncResult::AsyncOperationComplete</a> method to notify the control 
     * 	point.
     * @returns {Integer} Pointer to a 64-bit <b>ULONG</b> value used to identify the asynchronous I/O operation. The control point must use this handle as a cookie while ending or cancelling this  operation with <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-endinvokeaction">EndInvokeAction</a>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-begininvokeaction
     */
    BeginInvokeAction(bstrActionName, vInActionArgs, pAsyncResult) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        result := ComCall(3, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pAsyncResult, "uint*", &pullRequestID := 0, "HRESULT")
        return pullRequestID
    }

    /**
     * EndInvokeAction method retrieves the results of a previous BeginInvokeAction operation and retrieves the resultant output arguments.
     * @param {Integer} ullRequestID On input, contains a reference to an empty array. On output, receives a reference to the array of service-specific output arguments. In the event the action doesn't have output arguments, this parameter contains an empty array.
     * 
     * <div class="alert"><b>Note</b>  Clear this parameter with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.</div>
     * <div> </div>
     * @param {Pointer<VARIANT>} pvOutActionArgs On input contains a reference to an empty array. On output, receives a reference to a VARIANT that contains the return value of the invoked action. 
     * 
     * <div class="alert"><b>Note</b>  Clear this parameter with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.</div>
     * <div> </div>
     * @param {Pointer<VARIANT>} pvRetVal A 64-bit <b>ULONG</b> value that corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-begininvokeaction">BeginInvokeAction</a> operation initiated prior to this call.
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, the method returns a COM error code defined in <b>WinError.h</b> or one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has not responded within the 30 second time-out period.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments passed is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This action is not supported by the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ERROR_PROCESSING_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has sent a response that cannot be processed; for example, the response was corrupted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_PROTOCOL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred at the UPnP control-protocol level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_TRANSPORT_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An HTTP error occurred. Use the <a href="/windows/desktop/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus">IUPnPService::LastTransportStatus</a> property to obtain the actual HTTP status code.  
     * 
     * <div class="alert"><b>Note</b>  This error code is also returned when the SOAP response exceeds 100 kilobytes.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Some values can indicate that an error was received from a UPnP-certified device. For more information, see <a href="/windows/desktop/UPnP/device-error-codes">Device Error Codes</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-endinvokeaction
     */
    EndInvokeAction(ullRequestID, pvOutActionArgs, pvRetVal) {
        result := ComCall(4, this, "uint", ullRequestID, "ptr", pvOutActionArgs, "ptr", pvRetVal, "HRESULT")
        return result
    }

    /**
     * BeginQueryStateVariable method initiates an asynchronous request for the state variable value from a specific service.
     * @param {BSTR} bstrVariableName Specifies the requested state variable value.
     * @param {IUPnPAsyncResult} pAsyncResult Pointer  to a <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpasyncresult">IUPnPAsyncResult</a> object. When the <b>BeginQueryStateVariable</b> call is complete, 
     * 	UPnP will use the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete">IUPnPAsyncResult::AsyncOperationComplete</a> method to notify the control 
     * 	point.
     * @returns {Integer} Pointer to a 64-bit <b>ULONG</b> value used to identify the asynchronous I/O operation. The UPnP control point must use this handle when ending or cancelling this  operation with <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-endquerystatevariable">EndQueryStateVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-beginquerystatevariable
     */
    BeginQueryStateVariable(bstrVariableName, pAsyncResult) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        result := ComCall(5, this, "ptr", bstrVariableName, "ptr", pAsyncResult, "uint*", &pullRequestID := 0, "HRESULT")
        return pullRequestID
    }

    /**
     * EndQueryStateVariable method retrieves the results of a previous BeginQueryStateVariable operation and retrieves the resultant service-specific state variable value.
     * @param {Integer} ullRequestID Pointer to a 64-bit <b>ULONG</b> value that corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-beginquerystatevariable">BeginQueryStateVariable</a> operation initiated prior to this call.
     * @param {Pointer<VARIANT>} pValue On input, contains an empty array. On output,  receives a reference to the value of the variable specified in <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-beginquerystatevariable">BeginQueryStateVariable</a> by <i>bstrVariableName</i>. The type of the data returned depends on the state variable for which the query was invoked.
     * 
     * <div class="alert"><b>Note</b>  Clear this parameter with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.</div>
     * <div> </div>
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, the method returns a COM error code defined in <b>WinError.h</b> or one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state variable is not evented and the remote query returned an error code. This is not a transport error; the device received the request, but it returned an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_VARIABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested state variable does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has not responded within the 30 second time-out period.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments passed with <i>vInActionArgs</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_PROTOCOL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query did not complete because of problems at the UPnP protocol level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_TRANSPORT_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state variable is not evented and the remote query for the value failed because of an HTTP problem. To retrieve the HTTP error code, use <a href="/windows/desktop/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus">IUPnPService::LastTransportStatus</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_VARIABLE_VALUE_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state variable is evented, but the UPnP software cannot return a value because it is still waiting for an event notification.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Some values can indicate that an error was received from a UPnP-certified device. For more information, see <a href="/windows/desktop/UPnP/device-error-codes">Device Error Codes</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-endquerystatevariable
     */
    EndQueryStateVariable(ullRequestID, pValue) {
        result := ComCall(6, this, "uint", ullRequestID, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * BeginSubscribeToEvents initiates event subscription in asynchronous mode and registers the application callback with the UPnP framework.
     * @param {IUnknown} pUnkCallback Specifies the reference to the interface object that contains the callback to register. This object must either support the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservicecallback">IUPnPServiceCallback</a> interface or the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface.
     * @param {IUPnPAsyncResult} pAsyncResult Specifies a reference to <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpasyncresult">IUPnPAsyncResult</a> object. When the <b>BeginSubscribeToEvents</b> call is complete, 
     * 	UPnP will use the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete">IUPnPAsyncResult::AsyncOperationComplete</a> method to notify the control point.
     * @returns {Integer} Pointer to a 64-bit <b>ULONG</b> value used to identify the asynchronous I/O operation. The control point must use this handle while ending or cancelling the operation via <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-endsubscribetoevents">EndSubscribeToEvents</a> or <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-cancelasyncoperation">CancelAsyncOperation</a>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-beginsubscribetoevents
     */
    BeginSubscribeToEvents(pUnkCallback, pAsyncResult) {
        result := ComCall(7, this, "ptr", pUnkCallback, "ptr", pAsyncResult, "uint*", &pullRequestID := 0, "HRESULT")
        return pullRequestID
    }

    /**
     * EndSubscribeToEvents method retrieves the results of a previous BeginSubscribeToEvents operation.
     * @param {Integer} ullRequestID A 64-bit <b>ULONG</b> value that corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-beginsubscribetoevents">BeginSubscribeToEvents</a> operation requested prior to this call.
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, the method returns a COM error code defined in <b>WinError.h</b> or one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device received the request, but returned an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has not responded within the 30 second time-out period.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_PROTOCOL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query did not complete due to problems at the UPnP protocol level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_TRANSPORT_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote operation failed due to an HTTP problem. To retrieve the HTTP error code, use <a href="/windows/desktop/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus">IUPnPService::LastTransportStatus</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Some values can indicate that an error was received from a UPnP-certified device. For more information, see <a href="/windows/desktop/UPnP/device-error-codes">Device Error Codes</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-endsubscribetoevents
     */
    EndSubscribeToEvents(ullRequestID) {
        result := ComCall(8, this, "uint", ullRequestID, "HRESULT")
        return result
    }

    /**
     * BeginSCPDDownload method initiates the asynchronous download of an Service Control Protocol Description (SCPD) document.
     * @param {IUPnPAsyncResult} pAsyncResult Specifies a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpasyncresult">IUPnPAsyncResult</a> object. When the <b>BeginSCPDDownload</b> call is complete, 
     * 	UPnP will use the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete">IUPnPAsyncResult::AsyncOperationComplete</a> method to notify the control 
     * 	point.
     * @returns {Integer} Pointer to a 64-bit <b>ULONG</b> value used to identify the <b>BeginSCPDDownload</b> operation requested prior to this call.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-beginscpddownload
     */
    BeginSCPDDownload(pAsyncResult) {
        result := ComCall(9, this, "ptr", pAsyncResult, "uint*", &pullRequestID := 0, "HRESULT")
        return pullRequestID
    }

    /**
     * EndSCPDDownload method retrieves the results of a previous asynchronous download of an Service Control Protocol Description (SCPD) document.
     * @param {Integer} ullRequestID Pointer to a 64-bit <b>ULONG</b> value that corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpserviceasync-beginscpddownload">BeginSCPDDownload</a> operation requested prior to this call.
     * @returns {BSTR} A  buffer containing the SCPD document.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-endscpddownload
     */
    EndSCPDDownload(ullRequestID) {
        pbstrSCPDDoc := BSTR()
        result := ComCall(10, this, "uint", ullRequestID, "ptr", pbstrSCPDDoc, "HRESULT")
        return pbstrSCPDDoc
    }

    /**
     * CancelAsyncOperation method cancels a pending asynchronous operation initiated by the BeginInvokeAction, BeginQueryStateVariable, BeginSubscribeToEvents, or BeginSCPDDownload methods.
     * @param {Integer} ullRequestID A 64-bit <b>ULONG</b> value that corresponds to the pending asynchronous UPnP operation.
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, the method returns a COM error code defined in <b>WinError.h</b> or one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to cancel the asynchronous operation.
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
     * <i>ullRequestID</i> does not match the pending asynchronous call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpserviceasync-cancelasyncoperation
     */
    CancelAsyncOperation(ullRequestID) {
        result := ComCall(11, this, "uint", ullRequestID, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Signals an application about notification events related to Mobile Broadband device services on the system.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.<ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesmanager">IMbnDeviceServicesManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID_IMbnDeviceServicesEvents to RIID.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on an object that implements <b>IMbnDeviceServicesEvents</b> to PUNK.</li>
 * </ol>
 * 
 * 
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/january/msdn-magazine-january-2001">COM Connection Points article</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbndeviceservicesevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceServicesEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnDeviceServicesEvents
     * @type {Guid}
     */
    static IID => Guid("{0a900c19-6824-4e97-b76e-cf239d0ca642}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnQuerySupportedCommandsComplete", "OnOpenCommandSessionComplete", "OnCloseCommandSessionComplete", "OnSetCommandComplete", "OnQueryCommandComplete", "OnEventNotification", "OnOpenDataSessionComplete", "OnCloseDataSessionComplete", "OnWriteDataComplete", "OnReadData", "OnInterfaceStateChange"]

    /**
     * Notification method indicating that a query for the messages supported on a device service has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the query was requested.
     * @param {Pointer<SAFEARRAY>} commandIDList An array that contains the list of command IDs supported by the device service.  This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the query operation request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerysupportedcommandscomplete
     */
    OnQuerySupportedCommandsComplete(deviceService, commandIDList, status, requestID) {
        result := ComCall(3, this, "ptr", deviceService, "ptr", commandIDList, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service CommandSessionOpen request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>CommandSessionOpen</b> was requested.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the <b>CommandSessionOpen</b> request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onopencommandsessioncomplete
     */
    OnOpenCommandSessionComplete(deviceService, status, requestID) {
        result := ComCall(4, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service CloseCommandSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>CloseCommandSession</b> was requested.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the close request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosecommandsessioncomplete
     */
    OnCloseCommandSessionComplete(deviceService, status, requestID) {
        result := ComCall(5, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service SET request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the operation was requested.
     * @param {Integer} responseID An identifier for the response.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data returned by the device. If the response is fragmented across multiple indications, this only contains the information for one fragment. This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the set operation request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onsetcommandcomplete
     */
    OnSetCommandComplete(deviceService, responseID, deviceServiceData, status, requestID) {
        result := ComCall(6, this, "ptr", deviceService, "uint", responseID, "ptr", deviceServiceData, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service QUERY request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the operation was requested.
     * @param {Integer} responseID A identifier for the response.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data returned by the device. If the response is fragmented across multiple indications, this only contains the information for one fragment. This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the query operation request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerycommandcomplete
     */
    OnQueryCommandComplete(deviceService, responseID, deviceServiceData, status, requestID) {
        result := ComCall(7, this, "ptr", deviceService, "uint", responseID, "ptr", deviceServiceData, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method signaling a device service state change event from the Mobile Broadband device.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object for which the event notification was received.
     * @param {Integer} eventID An identifier for the event.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data returned by underlying device.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-oneventnotification
     */
    OnEventNotification(deviceService, eventID, deviceServiceData) {
        result := ComCall(8, this, "ptr", deviceService, "uint", eventID, "ptr", deviceServiceData, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service OpenDataSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>OpenDataSession</b>  was requested.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the <b>OpenDataSession</b> request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onopendatasessioncomplete
     */
    OnOpenDataSessionComplete(deviceService, status, requestID) {
        result := ComCall(9, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service session CloseDataSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> session object on which the <b>CloseDataSession</b> was requested.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the <b>CloseDataSession</b> request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosedatasessioncomplete
     */
    OnCloseDataSessionComplete(deviceService, status, requestID) {
        result := ComCall(10, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service session Write request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> session object on which the <b>Write</b> was requested.
     * @param {HRESULT} status A status code that indicates the outcome of the operation.
     * @param {Integer} requestID The request ID that was assigned by the Mobile Broadband service to the <b>Write</b> request.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onwritedatacomplete
     */
    OnWriteDataComplete(deviceService, status, requestID) {
        result := ComCall(11, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification for data being read from a device service data session.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> session object on which the data was read.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data read from the underlying device service session.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-onreaddata
     */
    OnReadData(deviceService, deviceServiceData) {
        result := ComCall(12, this, "ptr", deviceService, "ptr", deviceServiceData, "HRESULT")
        return result
    }

    /**
     * Notification method that signals a change in the state of device services on the system.
     * @param {BSTR} interfaceID The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid">InterfaceID</a> of the device for which the device services state change notification is sent.
     * @param {Integer} stateChange A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_device_services_interface_state">MBN_DEVICE_SERVICES_INTERFACE_STATE</a> enumeration that specifies whether the device service capable device is available or unavailable.
     * @returns {HRESULT} The method must return the following value.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesevents-oninterfacestatechange
     */
    OnInterfaceStateChange(interfaceID, stateChange) {
        interfaceID := interfaceID is String ? BSTR.Alloc(interfaceID).Value : interfaceID

        result := ComCall(13, this, "ptr", interfaceID, "int", stateChange, "HRESULT")
        return result
    }
}

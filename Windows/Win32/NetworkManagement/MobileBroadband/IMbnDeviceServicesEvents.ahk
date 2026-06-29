#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnDeviceService.ahk" { IMbnDeviceService }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_DEVICE_SERVICES_INTERFACE_STATE.ahk" { MBN_DEVICE_SERVICES_INTERFACE_STATE }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Signals an application about notification events related to Mobile Broadband device services on the system.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbndeviceservicesevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnDeviceServicesEvents extends IUnknown {
    /**
     * The interface identifier for IMbnDeviceServicesEvents
     * @type {Guid}
     */
    static IID := Guid("{0a900c19-6824-4e97-b76e-cf239d0ca642}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnDeviceServicesEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnQuerySupportedCommandsComplete : IntPtr
        OnOpenCommandSessionComplete     : IntPtr
        OnCloseCommandSessionComplete    : IntPtr
        OnSetCommandComplete             : IntPtr
        OnQueryCommandComplete           : IntPtr
        OnEventNotification              : IntPtr
        OnOpenDataSessionComplete        : IntPtr
        OnCloseDataSessionComplete       : IntPtr
        OnWriteDataComplete              : IntPtr
        OnReadData                       : IntPtr
        OnInterfaceStateChange           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnDeviceServicesEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method indicating that a query for the messages supported on a device service has completed.
     * @remarks
     * The Mobile Broadband service will free the memory for <i>commandIDList</i> after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the query was requested.
     * @param {Pointer<SAFEARRAY>} commandIDList An array that contains the list of command IDs supported by the device service.  This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerysupportedcommandscomplete
     */
    OnQuerySupportedCommandsComplete(deviceService, commandIDList, _status, requestID) {
        result := ComCall(3, this, "ptr", deviceService, SAFEARRAY.Ptr, commandIDList, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service CommandSessionOpen request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>CommandSessionOpen</b> was requested.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopencommandsessioncomplete
     */
    OnOpenCommandSessionComplete(deviceService, _status, requestID) {
        result := ComCall(4, this, "ptr", deviceService, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service CloseCommandSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>CloseCommandSession</b> was requested.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosecommandsessioncomplete
     */
    OnCloseCommandSessionComplete(deviceService, _status, requestID) {
        result := ComCall(5, this, "ptr", deviceService, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service SET request has completed.
     * @remarks
     * The <i>deviceServiceData</i> byte array contains the byte-by-byte copy of data returned by the device. The Mobile Broadband service will free the memory after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the operation was requested.
     * @param {Integer} responseID An identifier for the response.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data returned by the device. If the response is fragmented across multiple indications, this only contains the information for one fragment. This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onsetcommandcomplete
     */
    OnSetCommandComplete(deviceService, responseID, deviceServiceData, _status, requestID) {
        result := ComCall(6, this, "ptr", deviceService, "uint", responseID, SAFEARRAY.Ptr, deviceServiceData, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service QUERY request has completed.
     * @remarks
     * The <i>deviceServiceData</i> byte array contains the byte-by-byte copy of data returned by the device. The Mobile Broadband service will free the memory after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the operation was requested.
     * @param {Integer} responseID A identifier for the response.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array containing the data returned by the device. If the response is fragmented across multiple indications, this only contains the information for one fragment. This field is valid only if the status is <b>S_OK</b>.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerycommandcomplete
     */
    OnQueryCommandComplete(deviceService, responseID, deviceServiceData, _status, requestID) {
        result := ComCall(7, this, "ptr", deviceService, "uint", responseID, SAFEARRAY.Ptr, deviceServiceData, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method signaling a device service state change event from the Mobile Broadband device.
     * @remarks
     * The <i>deviceServiceData</i> byte array contains the byte-by-byte copy of data returned by the device. The Mobile Broadband service will free the memory after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-oneventnotification
     */
    OnEventNotification(deviceService, eventID, deviceServiceData) {
        result := ComCall(8, this, "ptr", deviceService, "uint", eventID, SAFEARRAY.Ptr, deviceServiceData, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service OpenDataSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object on which the <b>OpenDataSession</b>  was requested.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopendatasessioncomplete
     */
    OnOpenDataSessionComplete(deviceService, _status, requestID) {
        result := ComCall(9, this, "ptr", deviceService, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service session CloseDataSession request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> session object on which the <b>CloseDataSession</b> was requested.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosedatasessioncomplete
     */
    OnCloseDataSessionComplete(deviceService, _status, requestID) {
        result := ComCall(10, this, "ptr", deviceService, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a device service session Write request has completed.
     * @param {IMbnDeviceService} deviceService The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> session object on which the <b>Write</b> was requested.
     * @param {HRESULT} _status A status code that indicates the outcome of the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onwritedatacomplete
     */
    OnWriteDataComplete(deviceService, _status, requestID) {
        result := ComCall(11, this, "ptr", deviceService, "int", _status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * Notification for data being read from a device service data session.
     * @remarks
     * This byte array contains the byte-by-byte copy of data read from the device service session. The Mobile Broadband service will free the memory for this field after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onreaddata
     */
    OnReadData(deviceService, deviceServiceData) {
        result := ComCall(12, this, "ptr", deviceService, SAFEARRAY.Ptr, deviceServiceData, "HRESULT")
        return result
    }

    /**
     * Notification method that signals a change in the state of device services on the system.
     * @param {BSTR} interfaceID The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid">InterfaceID</a> of the device for which the device services state change notification is sent.
     * @param {MBN_DEVICE_SERVICES_INTERFACE_STATE} stateChange A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_device_services_interface_state">MBN_DEVICE_SERVICES_INTERFACE_STATE</a> enumeration that specifies whether the device service capable device is available or unavailable.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-oninterfacestatechange
     */
    OnInterfaceStateChange(interfaceID, stateChange) {
        interfaceID := interfaceID is String ? BSTR.Alloc(interfaceID).Value : interfaceID

        result := ComCall(13, this, BSTR, interfaceID, MBN_DEVICE_SERVICES_INTERFACE_STATE, stateChange, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnDeviceServicesEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnQuerySupportedCommandsComplete := CallbackCreate(GetMethod(implObj, "OnQuerySupportedCommandsComplete"), flags, 5)
        this.vtbl.OnOpenCommandSessionComplete := CallbackCreate(GetMethod(implObj, "OnOpenCommandSessionComplete"), flags, 4)
        this.vtbl.OnCloseCommandSessionComplete := CallbackCreate(GetMethod(implObj, "OnCloseCommandSessionComplete"), flags, 4)
        this.vtbl.OnSetCommandComplete := CallbackCreate(GetMethod(implObj, "OnSetCommandComplete"), flags, 6)
        this.vtbl.OnQueryCommandComplete := CallbackCreate(GetMethod(implObj, "OnQueryCommandComplete"), flags, 6)
        this.vtbl.OnEventNotification := CallbackCreate(GetMethod(implObj, "OnEventNotification"), flags, 4)
        this.vtbl.OnOpenDataSessionComplete := CallbackCreate(GetMethod(implObj, "OnOpenDataSessionComplete"), flags, 4)
        this.vtbl.OnCloseDataSessionComplete := CallbackCreate(GetMethod(implObj, "OnCloseDataSessionComplete"), flags, 4)
        this.vtbl.OnWriteDataComplete := CallbackCreate(GetMethod(implObj, "OnWriteDataComplete"), flags, 4)
        this.vtbl.OnReadData := CallbackCreate(GetMethod(implObj, "OnReadData"), flags, 3)
        this.vtbl.OnInterfaceStateChange := CallbackCreate(GetMethod(implObj, "OnInterfaceStateChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnQuerySupportedCommandsComplete)
        CallbackFree(this.vtbl.OnOpenCommandSessionComplete)
        CallbackFree(this.vtbl.OnCloseCommandSessionComplete)
        CallbackFree(this.vtbl.OnSetCommandComplete)
        CallbackFree(this.vtbl.OnQueryCommandComplete)
        CallbackFree(this.vtbl.OnEventNotification)
        CallbackFree(this.vtbl.OnOpenDataSessionComplete)
        CallbackFree(this.vtbl.OnCloseDataSessionComplete)
        CallbackFree(this.vtbl.OnWriteDataComplete)
        CallbackFree(this.vtbl.OnReadData)
        CallbackFree(this.vtbl.OnInterfaceStateChange)
    }
}

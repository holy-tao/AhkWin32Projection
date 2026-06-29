#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILocationReport.ahk" { ILocationReport }
#Import ".\LOCATION_REPORT_STATUS.ahk" { LOCATION_REPORT_STATUS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ILocationEvents.ahk" { ILocationEvents }
#Import "..\Sensors\LOCATION_DESIRED_ACCURACY.ahk" { LOCATION_DESIRED_ACCURACY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods used to manage location reports, event registration, and sensor permissions.
 * @remarks
 * When <b>CoCreateInstance</b> is called to create an <b>ILocation</b> object, it may result in a notification being displayed in the taskbar, and a Location Activity event being logged in Event Viewer, if it is the application's first use of location.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-ilocation
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILocation extends IUnknown {
    /**
     * The interface identifier for ILocation
     * @type {Guid}
     */
    static IID := Guid("{ab2ece69-56d9-4f28-b525-de1b0ee44237}")

    /**
     * The class identifier for Location
     * @type {Guid}
     */
    static CLSID := Guid("{e5b8e079-ee6d-4e33-a438-c87f2e959254}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterForReport   : IntPtr
        UnregisterForReport : IntPtr
        GetReport           : IntPtr
        GetReportStatus     : IntPtr
        GetReportInterval   : IntPtr
        SetReportInterval   : IntPtr
        GetDesiredAccuracy  : IntPtr
        SetDesiredAccuracy  : IntPtr
        RequestPermissions  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests location report events.
     * @remarks
     * The interval you request by using the <i>dwRequestedReportInterval</i> parameter represents the shortest amount of time between events. This means that you request to receive event notifications no more frequently than specified, but the elapsed time may be significantly longer. Use the <i>dwRequestedReportInterval</i> parameter to help ensure that event notifications do not use more processor resources than necessary.
     * 
     * The location provider is not required to provide reports at the interval that you request. Call <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreportinterval">GetReportInterval</a> to discover the true report interval setting.
     * 
     * Applications that need to get location data only once, to fill out a form or place the user's location on a map, should register for events and wait for the first report event as described in <a href="https://docs.microsoft.com/previous-versions/visualstudio">Waiting For a Location Report</a>.
     * @param {ILocationEvents} pEvents Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationevents">ILocationEvents</a> callback interface through which the requested event notifications will be received.
     * @param {Pointer<Guid>} reportType <b>GUID</b> that specifies the interface ID of the report type for which to receive event notifications.
     * @param {Integer} dwRequestedReportInterval <b>DWORD</b> that specifies the requested elapsed time, in milliseconds, between event notifications for the specified report type. If <i>dwRequestedReportInterval</i> is zero, no minimum interval is specified and your application requests to receive events at the location sensor's default interval. See Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>reportType </i> is other than IID_ILatLongReport or IID_ICivicAddressReport. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_REGISTERED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>reportType </i> is already registered. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-registerforreport
     */
    RegisterForReport(pEvents, reportType, dwRequestedReportInterval) {
        result := ComCall(3, this, "ptr", pEvents, Guid.Ptr, reportType, "uint", dwRequestedReportInterval, "HRESULT")
        return result
    }

    /**
     * Stops event notifications for the specified report type.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the interface ID of the report type for which to stop events.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not registered to receive events for the specified report type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>reportType </i> is other than IID_ILatLongReport or IID_ICivicAddressReport. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-unregisterforreport
     */
    UnregisterForReport(reportType) {
        result := ComCall(4, this, Guid.Ptr, reportType, "HRESULT")
        return result
    }

    /**
     * Retrieves a location report.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> is the base interface for specific location report types.   Call <b>QueryInterface</b> to retrieve a pointer to the correct report type.
     * 
     * When <b>GetReport</b> is called, it may result in a notification being displayed in the taskbar, and a Location Activity event being logged in Event Viewer, if it is the application's first use of location.
     * 
     * <div class="alert"><b>Note</b>  When an application first starts, or when a new location sensor is enabled, <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreportstatus">GetReportStatus</a> may report a status of <b>REPORT_RUNNING</b>  shortly before the new location report is available. Therefore, an initial call to <b>GetReport</b> can return an error (<b>ERROR_NO_DATA</b>) or a value that is not from the expected location sensor, even if <b>GetReportStatus</b> indicates a status of <b>REPORT_RUNNING</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreportstatus">GetReportStatus</a> for a description of a workaround for this issue.</div>
     * <div> </div>
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the type of report to retrieve.
     * @returns {ILocationReport} Address of a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> that receives the specified location report.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(5, this, Guid.Ptr, reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }

    /**
     * Retrieves the status for the specified report type.
     * @remarks
     * This method retrieves report status for new reports. The most recent reports remain available through <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">ILocation::GetReport</a>, regardless of the status reported by this method.
     * 
     * <h3><a id="Known_Issues"></a><a id="known_issues"></a><a id="KNOWN_ISSUES"></a>Known Issues</h3>
     * When an application first starts, or when a new location sensor is enabled, <b>GetReportStatus</b> may report a status of <b>REPORT_RUNNING</b>  shortly before the location report is available.
     * 
     * Therefore, an initial call to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">GetReport</a> will return an error (<b>ERROR_NO_DATA</b>) or a value that is not from the expected location sensor, even if <b>GetReportStatus</b> indicates a status of <b>REPORT_RUNNING</b>. This can happen in the following cases:<ol>
     * <li>The application polls for status by using <b>GetReportStatus</b> until a report status of <b>REPORT_RUNNING</b> is returned, and then calls <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">GetReport</a>.  </li>
     * <li><b>GetReportStatus</b> is called when the application starts. This may occur after creation of the location object, or after calling <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-requestpermissions">RequestPermissions</a>.</li>
     * </ol>
     * 
     * 
     * An application can mitigate the issue by implementing the following workaround. The workaround involves subscribing to location report events.
     * 
     * <h3><a id="Workaround__Subscribing_to_Events"></a><a id="workaround__subscribing_to_events"></a><a id="WORKAROUND__SUBSCRIBING_TO_EVENTS"></a>Workaround: Subscribing to Events</h3>
     *  The application can subscribe to report events and wait for the report from the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged">OnLocationChanged</a> event or the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocationevents-onstatuschanged">OnStatusChanged</a> event. The application should wait for a specified finite amount of time.
     * 
     * The following example shows an application that waits for a location report of type <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilatlongreport">ILatLongReport</a>. If a report is successfully retrieved within the specified amount of time, it prints out a message indicating that data was received.
     * 
     * The following example code demonstrates how an application may call a function named <b>WaitForLocationReport</b> that registers for events and waits for the first location report. <b>WaitForLocationReport</b> waits for an event that is set by a callback object. The function <b>WaitForLocationReport</b> and the callback object is defined in the examples that follow this one.
     * 
     * <div class="code"></div>
     * 
     * ```cpp
     * // main.cpp
     * // An application that demonstrates how to wait for a location report.
     * // This sample waits for latitude/longitude reports but can be modified
     * // to wait for civic address reports by replacing IID_ILatLongReport 
     * // with IID_ICivicAddressReport in the following code.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the interval.
     * @returns {LOCATION_REPORT_STATUS} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/ne-locationapi-location_report_status">LOCATION_REPORT_STATUS</a> that receives the current status for the specified report.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreportstatus
     */
    GetReportStatus(reportType) {
        result := ComCall(6, this, Guid.Ptr, reportType, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the requested amount of time, in milliseconds, between report events.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-registerforreport">RegisterForReport</a> before calling this method.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the interval.
     * @returns {Integer} The address of a <b>DWORD</b> that receives the report interval value, in milliseconds. If the report is not registered, this will be set to <b>NULL</b>. If this value is set to zero, no minimum interval is specified and your application receives events at the location sensor's default interval.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreportinterval
     */
    GetReportInterval(reportType) {
        result := ComCall(7, this, Guid.Ptr, reportType, "uint*", &pMilliseconds := 0, "HRESULT")
        return pMilliseconds
    }

    /**
     * Specifies the requested minimum amount of time, in milliseconds, between report events.
     * @remarks
     * The interval you request by using this method represents the shortest amount of time between events. This means that you request to receive event notifications no more frequently than specified, but the elapsed time may be significantly longer. Use this method to help ensure that event notifications do not use more processor resources than necessary.
     * 
     * It is not guaranteed that your request for a particular report interval will be set by the location provider. Call <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreportinterval">GetReportInterval </a> to discover the true report interval setting.
     * 
     * A report interval of zero means that no minimum interval is specified, and the application may receive events at the frequency that the location sensor sends events.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to set the interval.
     * @param {Integer} millisecondsRequested <b>DWORD</b> that contains the report interval value, in milliseconds. If this value is zero, no minimum interval is specified and your application receives events at the location sensor's default interval.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not registered to receive events for the specified report type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>reportType</i> was other than <b>IID_ILatLongReport</b> or <b>IID_ICivicAddressReport</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-setreportinterval
     */
    SetReportInterval(reportType, millisecondsRequested) {
        result := ComCall(8, this, Guid.Ptr, reportType, "uint", millisecondsRequested, "HRESULT")
        return result
    }

    /**
     * Retrieves the current requested accuracy setting.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the requested accuracy.
     * @returns {LOCATION_DESIRED_ACCURACY} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getdesiredaccuracy
     */
    GetDesiredAccuracy(reportType) {
        result := ComCall(9, this, Guid.Ptr, reportType, "int*", &pDesiredAccuracy := 0, "HRESULT")
        return pDesiredAccuracy
    }

    /**
     * Specifies the accuracy to be used.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to set the accuracy to be used.
     * @param {LOCATION_DESIRED_ACCURACY} desiredAccuracy 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>reportType</i> was other than <b>IID_ILatLongReport</b> or <b>IID_ICivicAddressReport</b>.
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
     * The value of <i>desiredAccuracy</i> is not supported in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd756639(v=vs.85)">LOCATION_DESIRED_ACCURACY</a> enumerated type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-setdesiredaccuracy
     */
    SetDesiredAccuracy(reportType, desiredAccuracy) {
        result := ComCall(10, this, Guid.Ptr, reportType, LOCATION_DESIRED_ACCURACY, desiredAccuracy, "HRESULT")
        return result
    }

    /**
     * Opens a system dialog box to request user permission to enable location devices.
     * @remarks
     * If the user chooses not to enable location services, Windows will not show the  permissions dialog box again.
     * 
     * <div class="alert"><b>Note</b>  Repeated asynchronous calls to <b>RequestPermissions</b> will display multiple instances of the <b>Enable location services</b> dialog box and can potentially flood the screen with dialog boxes, resulting in a poor user experience. If you think that other location sensors might be installed after your first call to <b>RequestPermissions</b>, requiring another call to <b>RequestPermissions</b>, you should either call <b>RequestPermissions</b> synchronously or wait until all location sensors are installed to make an asynchronous call. </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Making a synchronous call from the user interface (UI) thread of a Windows application can block the UI thread and make the application less responsive. To prevent this, do not make a synchronous call to <b>RequestPermissions</b> from the UI thread.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If an  application running in protected mode, such as a Browser Helper Object (BHO) for Internet Explorer, calls <b>RequestPermissions</b>, and the user chooses not to enable location using the dialog box, the location provider will not be enabled, but Windows will display the dialog box again if <b>RequestPermissions</b> is called again by the same user.   </div>
     * <div> </div>
     * @param {HWND} hParent <b>HWND</b> for the parent window. This parameter is optional. In Windows 8 the dialog is always modal if <i>hParent</i> is provided, and not modal if <i>hParent</i> is NULL.
     * @param {Pointer<Guid>} pReportTypes Pointer to an <b>IID</b> array. This array must contain interface IDs for all report types for which you are requesting permission. The interface IDs of the valid report types are IID_ILatLongReport and  IID_ICivicAddressReport. The count of IDs must match the value specified through the <i>count</i> parameter.
     * @param {Integer} count The count of interface IDs contained in <i>pReportTypes</i>.
     * @param {BOOL} fModal This parameter is not used.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * The following table describes return codes when the call is synchronous.
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
     * The user enabled location services. The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The location platform is disabled. An administrator turned the location platform off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_CANCELLED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user did not enable access to location services or canceled the dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following table describes return codes when the call is asynchronous.
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
     * The user enabled access to location services. The method succeeded.
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
     * An argument is  not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED) </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The location platform is disabled. An administrator turned the location platform off. The dialog box was not shown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-requestpermissions
     */
    RequestPermissions(hParent, pReportTypes, count, fModal) {
        result := ComCall(11, this, HWND, hParent, Guid.Ptr, pReportTypes, "uint", count, BOOL, fModal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILocation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterForReport := CallbackCreate(GetMethod(implObj, "RegisterForReport"), flags, 4)
        this.vtbl.UnregisterForReport := CallbackCreate(GetMethod(implObj, "UnregisterForReport"), flags, 2)
        this.vtbl.GetReport := CallbackCreate(GetMethod(implObj, "GetReport"), flags, 3)
        this.vtbl.GetReportStatus := CallbackCreate(GetMethod(implObj, "GetReportStatus"), flags, 3)
        this.vtbl.GetReportInterval := CallbackCreate(GetMethod(implObj, "GetReportInterval"), flags, 3)
        this.vtbl.SetReportInterval := CallbackCreate(GetMethod(implObj, "SetReportInterval"), flags, 3)
        this.vtbl.GetDesiredAccuracy := CallbackCreate(GetMethod(implObj, "GetDesiredAccuracy"), flags, 3)
        this.vtbl.SetDesiredAccuracy := CallbackCreate(GetMethod(implObj, "SetDesiredAccuracy"), flags, 3)
        this.vtbl.RequestPermissions := CallbackCreate(GetMethod(implObj, "RequestPermissions"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterForReport)
        CallbackFree(this.vtbl.UnregisterForReport)
        CallbackFree(this.vtbl.GetReport)
        CallbackFree(this.vtbl.GetReportStatus)
        CallbackFree(this.vtbl.GetReportInterval)
        CallbackFree(this.vtbl.SetReportInterval)
        CallbackFree(this.vtbl.GetDesiredAccuracy)
        CallbackFree(this.vtbl.SetDesiredAccuracy)
        CallbackFree(this.vtbl.RequestPermissions)
    }
}

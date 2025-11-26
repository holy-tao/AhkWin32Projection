#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILocationReport.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods used to manage location reports, event registration, and sensor permissions.
 * @remarks
 * 
 * When <b>CoCreateInstance</b> is callled to create an <b>ILocation</b> object, it may result in a notification being displayed in the taskbar, and a Location Activity event being logged in Event Viewer, if it is the application's first use of location.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-ilocation
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocation
     * @type {Guid}
     */
    static IID => Guid("{ab2ece69-56d9-4f28-b525-de1b0ee44237}")

    /**
     * The class identifier for Location
     * @type {Guid}
     */
    static CLSID => Guid("{e5b8e079-ee6d-4e33-a438-c87f2e959254}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterForReport", "UnregisterForReport", "GetReport", "GetReportStatus", "GetReportInterval", "SetReportInterval", "GetDesiredAccuracy", "SetDesiredAccuracy", "RequestPermissions"]

    /**
     * Requests location report events.
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
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-registerforreport
     */
    RegisterForReport(pEvents, reportType, dwRequestedReportInterval) {
        result := ComCall(3, this, "ptr", pEvents, "ptr", reportType, "uint", dwRequestedReportInterval, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-unregisterforreport
     */
    UnregisterForReport(reportType) {
        result := ComCall(4, this, "ptr", reportType, "HRESULT")
        return result
    }

    /**
     * Retrieves a location report.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the type of report to retrieve.
     * @returns {ILocationReport} Address of a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> that receives the specified location report.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(5, this, "ptr", reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }

    /**
     * Retrieves the status for the specified report type.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the interval.
     * @returns {Integer} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/ne-locationapi-location_report_status">LOCATION_REPORT_STATUS</a> that receives the current status for the specified report.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-getreportstatus
     */
    GetReportStatus(reportType) {
        result := ComCall(6, this, "ptr", reportType, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Retrieves the requested amount of time, in milliseconds, between report events.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the interval.
     * @returns {Integer} The address of a <b>DWORD</b> that receives the report interval value, in milliseconds. If the report is not registered, this will be set to <b>NULL</b>. If this value is set to zero, no minimum interval is specified and your application receives events at the location sensor's default interval.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-getreportinterval
     */
    GetReportInterval(reportType) {
        result := ComCall(7, this, "ptr", reportType, "uint*", &pMilliseconds := 0, "HRESULT")
        return pMilliseconds
    }

    /**
     * Specifies the requested minimum amount of time, in milliseconds, between report events.
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
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-setreportinterval
     */
    SetReportInterval(reportType, millisecondsRequested) {
        result := ComCall(8, this, "ptr", reportType, "uint", millisecondsRequested, "HRESULT")
        return result
    }

    /**
     * Retrieves the current requested accuracy setting.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to get the requested accuracy.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-getdesiredaccuracy
     */
    GetDesiredAccuracy(reportType) {
        result := ComCall(9, this, "ptr", reportType, "int*", &pDesiredAccuracy := 0, "HRESULT")
        return pDesiredAccuracy
    }

    /**
     * Specifies the accuracy to be used.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the report type for which to set the accuracy to be used.
     * @param {Integer} desiredAccuracy 
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
     * The value of <i>desiredAccuracy</i> is not supported in the <a href="/previous-versions/windows/desktop/legacy/dd756639(v=vs.85)">LOCATION_DESIRED_ACCURACY</a> enumerated type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-setdesiredaccuracy
     */
    SetDesiredAccuracy(reportType, desiredAccuracy) {
        result := ComCall(10, this, "ptr", reportType, "int", desiredAccuracy, "HRESULT")
        return result
    }

    /**
     * Opens a system dialog box to request user permission to enable location devices.
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
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocation-requestpermissions
     */
    RequestPermissions(hParent, pReportTypes, count, fModal) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(11, this, "ptr", hParent, "ptr", pReportTypes, "uint", count, "int", fModal, "HRESULT")
        return result
    }
}

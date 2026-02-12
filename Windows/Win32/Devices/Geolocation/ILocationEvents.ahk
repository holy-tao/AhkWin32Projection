#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * ILocationEvents provides callback methods that you must implement if you want to receive event notifications.
 * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nn-locationapi-ilocationevents
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocationEvents
     * @type {Guid}
     */
    static IID => Guid("{cae02bbf-798b-4508-a207-35a7906dc73d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLocationChanged", "OnStatusChanged"]

    /**
     * Called when a new location report is available.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> is the base interface of specific location report types. The actual interface that the caller receives for <i>pLocationReport</i> will match the type specified by <i>reportType</i>.
     * 
     * If the application calls <b>OnLocationChanged</b> as a result of its first use of location, the call might cause a notification to appear in the taskbar, and cause a Location Activity event to be logged in Event Viewer.   
     * 
     * <div class="alert"><b>Note</b>  An application does not receive the expected location change event from <b>OnLocationChanged</b> if both of the following conditions are true. First, the application runs as a service, in the context of the LOCALSERVICE, SYSTEM, or NETWORKSERVICE user account. Second, the location change event results from changing the default location, either manually when the user selects <b>Default Location</b> in Control Panel, or programmatically when an application calls <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-idefaultlocation">IDefaultLocation::SetReport</a>.</div>
     * <div> </div>
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that contains the interface ID of the report type contained in <i>pLocationReport</i>.
     * @param {ILocationReport} pLocationReport Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> instance that contains the new location report.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nf-locationapi-ilocationevents-onlocationchanged
     */
    OnLocationChanged(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when a report status changes.
     * @remarks
     * This event provides report status for new reports. The most recent reports remain available through <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">ILocation::GetReport</a>, regardless of the status reported by this event.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the interface ID of the report type for which the status has changed.
     * @param {Integer} newStatus A constant from the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/ne-locationapi-location_report_status">LOCATION_REPORT_STATUS</a> enumeration that contains the new status.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nf-locationapi-ilocationevents-onstatuschanged
     */
    OnStatusChanged(reportType, newStatus) {
        result := ComCall(4, this, "ptr", reportType, "int", newStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

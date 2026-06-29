#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\LOCATION_REPORT_STATUS.ahk" { LOCATION_REPORT_STATUS }
#Import ".\ILocationReport.ahk" { ILocationReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * ILocationEvents provides callback methods that you must implement if you want to receive event notifications.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-ilocationevents
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILocationEvents extends IUnknown {
    /**
     * The interface identifier for ILocationEvents
     * @type {Guid}
     */
    static IID := Guid("{cae02bbf-798b-4508-a207-35a7906dc73d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLocationChanged : IntPtr
        OnStatusChanged   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged
     */
    OnLocationChanged(reportType, pLocationReport) {
        result := ComCall(3, this, Guid.Ptr, reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * Called when a report status changes.
     * @remarks
     * This event provides report status for new reports. The most recent reports remain available through <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">ILocation::GetReport</a>, regardless of the status reported by this event.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the interface ID of the report type for which the status has changed.
     * @param {LOCATION_REPORT_STATUS} newStatus A constant from the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/ne-locationapi-location_report_status">LOCATION_REPORT_STATUS</a> enumeration that contains the new status.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationevents-onstatuschanged
     */
    OnStatusChanged(reportType, newStatus) {
        result := ComCall(4, this, Guid.Ptr, reportType, LOCATION_REPORT_STATUS, newStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILocationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLocationChanged := CallbackCreate(GetMethod(implObj, "OnLocationChanged"), flags, 3)
        this.vtbl.OnStatusChanged := CallbackCreate(GetMethod(implObj, "OnStatusChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLocationChanged)
        CallbackFree(this.vtbl.OnStatusChanged)
    }
}

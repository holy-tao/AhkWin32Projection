#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocationReport.ahk" { ILocationReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IDefaultLocation provides methods used to specify or retrieve the default location.
 * @remarks
 * <div class="alert"><b>Note</b>  An application does not receive the expected location change event from <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged">OnLocationChanged</a> if both of the following conditions are true. First, the application runs as a service, in the context of the LOCALSERVICE, SYSTEM, or NETWORKSERVICE user account. Second, the location change event results from changing the default location, either manually when the user selects <b>Default Location</b> in Control Panel, or programmatically when an application calls <b>IDefaultLocation::SetReport</b>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-idefaultlocation
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct IDefaultLocation extends IUnknown {
    /**
     * The interface identifier for IDefaultLocation
     * @type {Guid}
     */
    static IID := Guid("{a65af77e-969a-4a2e-8aca-33bb7cbb1235}")

    /**
     * The class identifier for DefaultLocation
     * @type {Guid}
     */
    static CLSID := Guid("{8b7fbfe0-5cd7-494a-af8c-283a65707506}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDefaultLocation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetReport : IntPtr
        GetReport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDefaultLocation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the default location.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> is the base interface of specific location report types. The actual interface you use for <i>pLocationReport</i> must match the type you specify through <i>reportType</i>.
     * 
     * Note that the type specified by <i>reportType</i> must be the <b>IID</b> of either <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-icivicaddressreport">ICivicAddressReport</a> or <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilatlongreport">ILatLongReport</a>.
     * 
     * The latitude and longitude provided in a latitude/longitude report must correspond to a location on the globe. Otherwise this method returns an <b>HRESULT</b> error value.
     * 
     * <div class="alert"><b>Note</b>  An application does not receive the expected location change event from <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged">OnLocationChanged</a> if both of the following conditions are true. First, the application runs as a service, in the context of the LOCALSERVICE, SYSTEM, or NETWORKSERVICE user account. Second, the location change event results from changing the default location, either manually when the user selects <b>Default Location</b> in Control Panel, or programmatically when an application calls <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-idefaultlocation">IDefaultLocation::SetReport</a>.</div>
     * <div> </div>
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that represents the interface ID of the type of report that is passed using <i>pLocationReport</i>.
     * @param {ILocationReport} pLocationReport Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> instance that contains the location report from the default location provider.
     * @returns {HRESULT} Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The location report was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The location report contains invalid data.  This may occur when a civic address report does not contain a valid IS0 3166 two-letter country or region code, or when a latitude/longitude report does not contain a latitude between -90 and 90 or does not contain a longitude between -180 and 180. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_ACCESSDENIED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have permission to set the default location.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-idefaultlocation-setreport
     */
    SetReport(reportType, pLocationReport) {
        result := ComCall(3, this, Guid.Ptr, reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * Retrieves the specified report type from the default location provider.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> is the base interface for specific location report types. The actual interface you use for <i>ppLocationReport</i> must match the type you specified through <i>reportType</i>.
     * 
     * A call to <b>IDefaultLocation::GetReport</b> may result in a notification being displayed in the taskbar, and a Location Activity event being logged in Event Viewer, if it is the application's first use of location.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> representing the interface ID for the type of report being retrieved.
     * @returns {ILocationReport} The address of a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> that receives the specified location report from the default location provider.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-idefaultlocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(4, this, Guid.Ptr, reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }

    Query(iid) {
        if (IDefaultLocation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetReport := CallbackCreate(GetMethod(implObj, "SetReport"), flags, 3)
        this.vtbl.GetReport := CallbackCreate(GetMethod(implObj, "GetReport"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetReport)
        CallbackFree(this.vtbl.GetReport)
    }
}

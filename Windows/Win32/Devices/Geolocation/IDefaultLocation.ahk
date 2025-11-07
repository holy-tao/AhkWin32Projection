#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILocationReport.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IDefaultLocation provides methods used to specify or retrieve the default location.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  An application does not receive the expected location change event from <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged">OnLocationChanged</a> if both of the following conditions are true. First, the application runs as a service, in the context of the LOCALSERVICE, SYSTEM, or NETWORKSERVICE user account. Second, the location change event results from changing the default location, either manually when the user selects <b>Default Location</b> in Control Panel, or programmatically when an application calls <b>IDefaultLocation::SetReport</b>.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-idefaultlocation
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class IDefaultLocation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDefaultLocation
     * @type {Guid}
     */
    static IID => Guid("{a65af77e-969a-4a2e-8aca-33bb7cbb1235}")

    /**
     * The class identifier for DefaultLocation
     * @type {Guid}
     */
    static CLSID => Guid("{8b7fbfe0-5cd7-494a-af8c-283a65707506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetReport", "GetReport"]

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {ILocationReport} pLocationReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-idefaultlocation-setreport
     */
    SetReport(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {ILocationReport} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-idefaultlocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(4, this, "ptr", reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }
}

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
     * Sets the default location.
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
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-idefaultlocation-setreport
     */
    SetReport(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * Retrieves the specified report type from the default location provider.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> representing the interface ID for the type of report being retrieved.
     * @returns {ILocationReport} The address of a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> that receives the specified location report from the default location provider.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-idefaultlocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(4, this, "ptr", reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }
}

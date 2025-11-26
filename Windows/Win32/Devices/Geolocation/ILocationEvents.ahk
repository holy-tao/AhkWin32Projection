#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * ILocationEvents provides callback methods that you must implement if you want to receive event notifications.
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-ilocationevents
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
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that contains the interface ID of the report type contained in <i>pLocationReport</i>.
     * @param {ILocationReport} pLocationReport Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nn-locationapi-ilocationreport">ILocationReport</a> instance that contains the new location report.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocationevents-onlocationchanged
     */
    OnLocationChanged(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * Called when a report status changes.
     * @param {Pointer<Guid>} reportType <b>REFIID</b> that specifies the interface ID of the report type for which the status has changed.
     * @param {Integer} newStatus A constant from the <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/ne-locationapi-location_report_status">LOCATION_REPORT_STATUS</a> enumeration that contains the new status.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilocationevents-onstatuschanged
     */
    OnStatusChanged(reportType, newStatus) {
        result := ComCall(4, this, "ptr", reportType, "int", newStatus, "HRESULT")
        return result
    }
}

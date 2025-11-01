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
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {ILocationReport} pLocationReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationevents-onlocationchanged
     */
    OnLocationChanged(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {Integer} newStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationevents-onstatuschanged
     */
    OnStatusChanged(reportType, newStatus) {
        result := ComCall(4, this, "ptr", reportType, "int", newStatus, "HRESULT")
        return result
    }
}

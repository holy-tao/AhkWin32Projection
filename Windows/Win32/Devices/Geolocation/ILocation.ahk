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
     * 
     * @param {ILocationEvents} pEvents 
     * @param {Pointer<Guid>} reportType 
     * @param {Integer} dwRequestedReportInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-registerforreport
     */
    RegisterForReport(pEvents, reportType, dwRequestedReportInterval) {
        result := ComCall(3, this, "ptr", pEvents, "ptr", reportType, "uint", dwRequestedReportInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-unregisterforreport
     */
    UnregisterForReport(reportType) {
        result := ComCall(4, this, "ptr", reportType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {ILocationReport} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreport
     */
    GetReport(reportType) {
        result := ComCall(5, this, "ptr", reportType, "ptr*", &ppLocationReport := 0, "HRESULT")
        return ILocationReport(ppLocationReport)
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreportstatus
     */
    GetReportStatus(reportType) {
        result := ComCall(6, this, "ptr", reportType, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getreportinterval
     */
    GetReportInterval(reportType) {
        result := ComCall(7, this, "ptr", reportType, "uint*", &pMilliseconds := 0, "HRESULT")
        return pMilliseconds
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {Integer} millisecondsRequested 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-setreportinterval
     */
    SetReportInterval(reportType, millisecondsRequested) {
        result := ComCall(8, this, "ptr", reportType, "uint", millisecondsRequested, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-getdesiredaccuracy
     */
    GetDesiredAccuracy(reportType) {
        result := ComCall(9, this, "ptr", reportType, "int*", &pDesiredAccuracy := 0, "HRESULT")
        return pDesiredAccuracy
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {Integer} desiredAccuracy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-setdesiredaccuracy
     */
    SetDesiredAccuracy(reportType, desiredAccuracy) {
        result := ComCall(10, this, "ptr", reportType, "int", desiredAccuracy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hParent 
     * @param {Pointer<Guid>} pReportTypes 
     * @param {Integer} count 
     * @param {BOOL} fModal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocation-requestpermissions
     */
    RequestPermissions(hParent, pReportTypes, count, fModal) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(11, this, "ptr", hParent, "ptr", pReportTypes, "uint", count, "int", fModal, "HRESULT")
        return result
    }
}

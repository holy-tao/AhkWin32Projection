#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationReportFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocationReportFactory
     * @type {Guid}
     */
    static IID => Guid("{2daec322-90b2-47e4-bb08-0da841935a6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ListenForReports", "StopListeningForReports", "get_Status", "get_ReportInterval", "put_ReportInterval", "get_DesiredAccuracy", "put_DesiredAccuracy", "RequestPermissions"]

    /**
     * 
     * @param {Integer} requestedReportInterval 
     * @returns {HRESULT} 
     */
    ListenForReports(requestedReportInterval) {
        result := ComCall(7, this, "uint", requestedReportInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopListeningForReports() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_Status(pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMilliseconds 
     * @returns {HRESULT} 
     */
    get_ReportInterval(pMilliseconds) {
        pMillisecondsMarshal := pMilliseconds is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pMillisecondsMarshal, pMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} millisecondsRequested 
     * @returns {HRESULT} 
     */
    put_ReportInterval(millisecondsRequested) {
        result := ComCall(11, this, "uint", millisecondsRequested, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDesiredAccuracy 
     * @returns {HRESULT} 
     */
    get_DesiredAccuracy(pDesiredAccuracy) {
        pDesiredAccuracyMarshal := pDesiredAccuracy is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pDesiredAccuracyMarshal, pDesiredAccuracy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} desiredAccuracy 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracy(desiredAccuracy) {
        result := ComCall(13, this, "uint", desiredAccuracy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hWnd 
     * @returns {HRESULT} 
     */
    RequestPermissions(hWnd) {
        hWndMarshal := hWnd is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, hWndMarshal, hWnd, "HRESULT")
        return result
    }
}

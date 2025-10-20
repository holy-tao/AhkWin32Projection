#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationReportFactory extends IDispatch{
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
     * 
     * @param {Integer} requestedReportInterval 
     * @returns {HRESULT} 
     */
    ListenForReports(requestedReportInterval) {
        result := ComCall(7, this, "uint", requestedReportInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopListeningForReports() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    get_Status(pVal) {
        result := ComCall(9, this, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMilliseconds 
     * @returns {HRESULT} 
     */
    get_ReportInterval(pMilliseconds) {
        result := ComCall(10, this, "uint*", pMilliseconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} millisecondsRequested 
     * @returns {HRESULT} 
     */
    put_ReportInterval(millisecondsRequested) {
        result := ComCall(11, this, "uint", millisecondsRequested, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pDesiredAccuracy 
     * @returns {HRESULT} 
     */
    get_DesiredAccuracy(pDesiredAccuracy) {
        result := ComCall(12, this, "uint*", pDesiredAccuracy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} desiredAccuracy 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracy(desiredAccuracy) {
        result := ComCall(13, this, "uint", desiredAccuracy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} hWnd 
     * @returns {HRESULT} 
     */
    RequestPermissions(hWnd) {
        result := ComCall(14, this, "uint*", hWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

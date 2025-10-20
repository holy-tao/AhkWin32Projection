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
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {Pointer<ILocationReport>} pLocationReport 
     * @returns {HRESULT} 
     */
    OnLocationChanged(reportType, pLocationReport) {
        result := ComCall(3, this, "ptr", reportType, "ptr", pLocationReport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} reportType 
     * @param {Integer} newStatus 
     * @returns {HRESULT} 
     */
    OnStatusChanged(reportType, newStatus) {
        result := ComCall(4, this, "ptr", reportType, "int", newStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

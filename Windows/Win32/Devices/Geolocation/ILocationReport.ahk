#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The parent interface for location reports.
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-ilocationreport
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationReport extends IUnknown{
    /**
     * The interface identifier for ILocationReport
     * @type {Guid}
     */
    static IID => Guid("{c8b7f7ee-75d0-4db9-b62d-7a0f369ca456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pSensorID 
     * @returns {HRESULT} 
     */
    GetSensorID(pSensorID) {
        result := ComCall(3, this, "ptr", pSensorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pCreationTime 
     * @returns {HRESULT} 
     */
    GetTimestamp(pCreationTime) {
        result := ComCall(4, this, "ptr", pCreationTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetValue(pKey, pValue) {
        result := ComCall(5, this, "ptr", pKey, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

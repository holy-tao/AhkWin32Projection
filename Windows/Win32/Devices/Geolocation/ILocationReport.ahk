#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The parent interface for location reports.
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-ilocationreport
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationReport extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSensorID", "GetTimestamp", "GetValue"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-getsensorid
     */
    GetSensorID() {
        pSensorID := Guid()
        result := ComCall(3, this, "ptr", pSensorID, "HRESULT")
        return pSensorID
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-gettimestamp
     */
    GetTimestamp() {
        pCreationTime := SYSTEMTIME()
        result := ComCall(4, this, "ptr", pCreationTime, "HRESULT")
        return pCreationTime
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-getvalue
     */
    GetValue(pKey) {
        pValue := PROPVARIANT()
        result := ComCall(5, this, "ptr", pKey, "ptr", pValue, "HRESULT")
        return pValue
    }
}

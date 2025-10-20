#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILocationReport.ahk

/**
 * ILatLongReport represents a location report that contains information in the form of latitude and longitude.
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-ilatlongreport
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILatLongReport extends ILocationReport{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILatLongReport
     * @type {Guid}
     */
    static IID => Guid("{7fed806d-0ef8-4f07-80ac-36a0beae3134}")

    /**
     * The class identifier for LatLongReport
     * @type {Guid}
     */
    static CLSID => Guid("{ed81c073-1f84-4ca8-a161-183c776bc651}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLatitude", "GetLongitude", "GetErrorRadius", "GetAltitude", "GetAltitudeError"]

    /**
     * 
     * @param {Pointer<Float>} pLatitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getlatitude
     */
    GetLatitude(pLatitude) {
        result := ComCall(6, this, "double*", pLatitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pLongitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getlongitude
     */
    GetLongitude(pLongitude) {
        result := ComCall(7, this, "double*", pLongitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pErrorRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-geterrorradius
     */
    GetErrorRadius(pErrorRadius) {
        result := ComCall(8, this, "double*", pErrorRadius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pAltitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getaltitude
     */
    GetAltitude(pAltitude) {
        result := ComCall(9, this, "double*", pAltitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pAltitudeError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getaltitudeerror
     */
    GetAltitudeError(pAltitudeError) {
        result := ComCall(10, this, "double*", pAltitudeError, "HRESULT")
        return result
    }
}

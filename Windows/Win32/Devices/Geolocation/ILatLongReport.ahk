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
     * Retrieves the latitude, in degrees.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the latitude.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilatlongreport-getlatitude
     */
    GetLatitude() {
        result := ComCall(6, this, "double*", &pLatitude := 0, "HRESULT")
        return pLatitude
    }

    /**
     * Retrieves the longitude, in degrees.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the longitude.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilatlongreport-getlongitude
     */
    GetLongitude() {
        result := ComCall(7, this, "double*", &pLongitude := 0, "HRESULT")
        return pLongitude
    }

    /**
     * Retrieves a distance from the reported location, in meters. Combined with the location reported as the origin, this radius describes the circle in which the actual location is probably located.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the error radius.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilatlongreport-geterrorradius
     */
    GetErrorRadius() {
        result := ComCall(8, this, "double*", &pErrorRadius := 0, "HRESULT")
        return pErrorRadius
    }

    /**
     * Retrieves the altitude, in meters. Altitude is relative to the reference ellipsoid.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the altitude, in meters. May be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilatlongreport-getaltitude
     */
    GetAltitude() {
        result := ComCall(9, this, "double*", &pAltitude := 0, "HRESULT")
        return pAltitude
    }

    /**
     * Retrieves the altitude error, in meters.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the altitude error, in meters. May be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//locationapi/nf-locationapi-ilatlongreport-getaltitudeerror
     */
    GetAltitudeError() {
        result := ComCall(10, this, "double*", &pAltitudeError := 0, "HRESULT")
        return pAltitudeError
    }
}

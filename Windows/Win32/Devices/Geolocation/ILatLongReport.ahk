#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocationReport.ahk" { ILocationReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * ILatLongReport represents a location report that contains information in the form of latitude and longitude.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-ilatlongreport
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILatLongReport extends ILocationReport {
    /**
     * The interface identifier for ILatLongReport
     * @type {Guid}
     */
    static IID := Guid("{7fed806d-0ef8-4f07-80ac-36a0beae3134}")

    /**
     * The class identifier for LatLongReport
     * @type {Guid}
     */
    static CLSID := Guid("{ed81c073-1f84-4ca8-a161-183c776bc651}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILatLongReport interfaces
    */
    struct Vtbl extends ILocationReport.Vtbl {
        GetLatitude      : IntPtr
        GetLongitude     : IntPtr
        GetErrorRadius   : IntPtr
        GetAltitude      : IntPtr
        GetAltitudeError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILatLongReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the latitude, in degrees.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the latitude.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getlatitude
     */
    GetLatitude() {
        result := ComCall(6, this, "double*", &pLatitude := 0, "HRESULT")
        return pLatitude
    }

    /**
     * Retrieves the longitude, in degrees.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the longitude.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getlongitude
     */
    GetLongitude() {
        result := ComCall(7, this, "double*", &pLongitude := 0, "HRESULT")
        return pLongitude
    }

    /**
     * Retrieves a distance from the reported location, in meters. Combined with the location reported as the origin, this radius describes the circle in which the actual location is probably located.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the error radius.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-geterrorradius
     */
    GetErrorRadius() {
        result := ComCall(8, this, "double*", &pErrorRadius := 0, "HRESULT")
        return pErrorRadius
    }

    /**
     * Retrieves the altitude, in meters. Altitude is relative to the reference ellipsoid.
     * @remarks
     * The <b>GetAltitude</b> method retrieves the altitude relative to the reference ellipsoid that is defined by the latest revision of the World Geodetic System (WGS 84), rather than the altitude relative to sea level.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the altitude, in meters. May be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getaltitude
     */
    GetAltitude() {
        result := ComCall(9, this, "double*", &pAltitude := 0, "HRESULT")
        return pAltitude
    }

    /**
     * Retrieves the altitude error, in meters.
     * @returns {Float} Address of a <b>DOUBLE</b> that receives the altitude error, in meters. May be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilatlongreport-getaltitudeerror
     */
    GetAltitudeError() {
        result := ComCall(10, this, "double*", &pAltitudeError := 0, "HRESULT")
        return pAltitudeError
    }

    Query(iid) {
        if (ILatLongReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLatitude := CallbackCreate(GetMethod(implObj, "GetLatitude"), flags, 2)
        this.vtbl.GetLongitude := CallbackCreate(GetMethod(implObj, "GetLongitude"), flags, 2)
        this.vtbl.GetErrorRadius := CallbackCreate(GetMethod(implObj, "GetErrorRadius"), flags, 2)
        this.vtbl.GetAltitude := CallbackCreate(GetMethod(implObj, "GetAltitude"), flags, 2)
        this.vtbl.GetAltitudeError := CallbackCreate(GetMethod(implObj, "GetAltitudeError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLatitude)
        CallbackFree(this.vtbl.GetLongitude)
        CallbackFree(this.vtbl.GetErrorRadius)
        CallbackFree(this.vtbl.GetAltitude)
        CallbackFree(this.vtbl.GetAltitudeError)
    }
}

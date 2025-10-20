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
     * 
     * @param {Pointer<Double>} pLatitude 
     * @returns {HRESULT} 
     */
    GetLatitude(pLatitude) {
        result := ComCall(6, this, "double*", pLatitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pLongitude 
     * @returns {HRESULT} 
     */
    GetLongitude(pLongitude) {
        result := ComCall(7, this, "double*", pLongitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pErrorRadius 
     * @returns {HRESULT} 
     */
    GetErrorRadius(pErrorRadius) {
        result := ComCall(8, this, "double*", pErrorRadius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pAltitude 
     * @returns {HRESULT} 
     */
    GetAltitude(pAltitude) {
        result := ComCall(9, this, "double*", pAltitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pAltitudeError 
     * @returns {HRESULT} 
     */
    GetAltitudeError(pAltitudeError) {
        result := ComCall(10, this, "double*", pAltitudeError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

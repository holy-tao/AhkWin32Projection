#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDigitalLocator.ahk

/**
 * The IDVBSLocator interface is implemented on the DVBSLocator object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSLocator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbslocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBSLocator extends IDigitalLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBSLocator
     * @type {Guid}
     */
    static IID => Guid("{3d7c353c-0d04-45f1-a742-f97cc1188dc8}")

    /**
     * The class identifier for DVBSLocator
     * @type {Guid}
     */
    static CLSID => Guid("{1df7d126-4050-47f0-a7cf-4c4ca9241333}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SignalPolarisation", "put_SignalPolarisation", "get_WestPosition", "put_WestPosition", "get_OrbitalPosition", "put_OrbitalPosition", "get_Azimuth", "put_Azimuth", "get_Elevation", "put_Elevation"]

    /**
     * 
     * @param {Pointer<Integer>} PolarisationVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_signalpolarisation
     */
    get_SignalPolarisation(PolarisationVal) {
        PolarisationValMarshal := PolarisationVal is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, PolarisationValMarshal, PolarisationVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PolarisationVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_signalpolarisation
     */
    put_SignalPolarisation(PolarisationVal) {
        result := ComCall(23, this, "int", PolarisationVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} WestLongitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_westposition
     */
    get_WestPosition(WestLongitude) {
        result := ComCall(24, this, "ptr", WestLongitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} WestLongitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_westposition
     */
    put_WestPosition(WestLongitude) {
        result := ComCall(25, this, "short", WestLongitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} longitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_orbitalposition
     */
    get_OrbitalPosition(longitude) {
        longitudeMarshal := longitude is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, longitudeMarshal, longitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} longitude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_orbitalposition
     */
    put_OrbitalPosition(longitude) {
        result := ComCall(27, this, "int", longitude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Azimuth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_azimuth
     */
    get_Azimuth(Azimuth) {
        AzimuthMarshal := Azimuth is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, AzimuthMarshal, Azimuth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Azimuth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_azimuth
     */
    put_Azimuth(Azimuth) {
        result := ComCall(29, this, "int", Azimuth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Elevation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_elevation
     */
    get_Elevation(Elevation) {
        ElevationMarshal := Elevation is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, ElevationMarshal, Elevation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Elevation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_elevation
     */
    put_Elevation(Elevation) {
        result := ComCall(31, this, "int", Elevation, "HRESULT")
        return result
    }
}

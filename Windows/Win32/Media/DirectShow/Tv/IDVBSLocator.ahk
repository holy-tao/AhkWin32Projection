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
     * 
     * @param {Pointer<Int32>} PolarisationVal 
     * @returns {HRESULT} 
     */
    get_SignalPolarisation(PolarisationVal) {
        result := ComCall(22, this, "int*", PolarisationVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PolarisationVal 
     * @returns {HRESULT} 
     */
    put_SignalPolarisation(PolarisationVal) {
        result := ComCall(23, this, "int", PolarisationVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} WestLongitude 
     * @returns {HRESULT} 
     */
    get_WestPosition(WestLongitude) {
        result := ComCall(24, this, "ptr", WestLongitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} WestLongitude 
     * @returns {HRESULT} 
     */
    put_WestPosition(WestLongitude) {
        result := ComCall(25, this, "short", WestLongitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} longitude 
     * @returns {HRESULT} 
     */
    get_OrbitalPosition(longitude) {
        result := ComCall(26, this, "int*", longitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} longitude 
     * @returns {HRESULT} 
     */
    put_OrbitalPosition(longitude) {
        result := ComCall(27, this, "int", longitude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Azimuth 
     * @returns {HRESULT} 
     */
    get_Azimuth(Azimuth) {
        result := ComCall(28, this, "int*", Azimuth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Azimuth 
     * @returns {HRESULT} 
     */
    put_Azimuth(Azimuth) {
        result := ComCall(29, this, "int", Azimuth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Elevation 
     * @returns {HRESULT} 
     */
    get_Elevation(Elevation) {
        result := ComCall(30, this, "int*", Elevation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Elevation 
     * @returns {HRESULT} 
     */
    put_Elevation(Elevation) {
        result := ComCall(31, this, "int", Elevation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

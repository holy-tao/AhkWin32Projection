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
     * @type {Integer} 
     */
    SignalPolarisation {
        get => this.get_SignalPolarisation()
        set => this.put_SignalPolarisation(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    WestPosition {
        get => this.get_WestPosition()
        set => this.put_WestPosition(value)
    }

    /**
     * @type {Integer} 
     */
    OrbitalPosition {
        get => this.get_OrbitalPosition()
        set => this.put_OrbitalPosition(value)
    }

    /**
     * @type {Integer} 
     */
    Azimuth {
        get => this.get_Azimuth()
        set => this.put_Azimuth(value)
    }

    /**
     * @type {Integer} 
     */
    Elevation {
        get => this.get_Elevation()
        set => this.put_Elevation(value)
    }

    /**
     * The get_SignalPolarisation method retrieves the signal polarisation.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> that receives the polarisation value.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-get_signalpolarisation
     */
    get_SignalPolarisation() {
        result := ComCall(22, this, "int*", &PolarisationVal := 0, "HRESULT")
        return PolarisationVal
    }

    /**
     * The put_SignalPolarisation method sets the signal polarisation.
     * @param {Integer} PolarisationVal Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> that specifies the signal polarisation value.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-put_signalpolarisation
     */
    put_SignalPolarisation(PolarisationVal) {
        result := ComCall(23, this, "int", PolarisationVal, "HRESULT")
        return result
    }

    /**
     * The get_WestPosition method retrieves a value indicating whether the orbital position is given in east or west longitude.
     * @returns {VARIANT_BOOL} Pointer to a variable of type <b>VARIANT_BOOL</b>; a value of true means "west longitude."
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-get_westposition
     */
    get_WestPosition() {
        result := ComCall(24, this, "short*", &WestLongitude := 0, "HRESULT")
        return WestLongitude
    }

    /**
     * The put_WestPosition method sets the longitudinal position as west longitude or east longitude.
     * @param {VARIANT_BOOL} WestLongitude Specifies whether the following longitude values that follow will be west or east longitude. True means "west longitude."
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-put_westposition
     */
    put_WestPosition(WestLongitude) {
        result := ComCall(25, this, "short", WestLongitude, "HRESULT")
        return result
    }

    /**
     * The get_OrbitalPosition method retrieves the setting for the satellite's orbital position.
     * @returns {Integer} Receives the longitude setting in tenths of a degree.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-get_orbitalposition
     */
    get_OrbitalPosition() {
        result := ComCall(26, this, "int*", &longitude := 0, "HRESULT")
        return longitude
    }

    /**
     * The put_OrbitalPosition method sets the setting for the satellite's orbital position.
     * @param {Integer} longitude The satellite's longitude in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-put_orbitalposition
     */
    put_OrbitalPosition(longitude) {
        result := ComCall(27, this, "int", longitude, "HRESULT")
        return result
    }

    /**
     * The get_Azimuth method retrieves the azimuth setting used for positioning the satellite dish.
     * @returns {Integer} Receives the azimuth in tenths of a degree.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-get_azimuth
     */
    get_Azimuth() {
        result := ComCall(28, this, "int*", &Azimuth := 0, "HRESULT")
        return Azimuth
    }

    /**
     * The put_Azimuth method adjusts the azimuth setting used for positioning the satellite dish.
     * @param {Integer} Azimuth The azimuth, in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-put_azimuth
     */
    put_Azimuth(Azimuth) {
        result := ComCall(29, this, "int", Azimuth, "HRESULT")
        return result
    }

    /**
     * The get_Elevation method retrieves the elevation of the satellite in tenths of a degree.
     * @returns {Integer} Receives the elevation setting in tenths of a degree.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-get_elevation
     */
    get_Elevation() {
        result := ComCall(30, this, "int*", &Elevation := 0, "HRESULT")
        return Elevation
    }

    /**
     * The put_Elevation method sets the elevation of the satellite in tenths of a degree.
     * @param {Integer} Elevation The elevation, in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbslocator-put_elevation
     */
    put_Elevation(Elevation) {
        result := ComCall(31, this, "int", Elevation, "HRESULT")
        return result
    }
}

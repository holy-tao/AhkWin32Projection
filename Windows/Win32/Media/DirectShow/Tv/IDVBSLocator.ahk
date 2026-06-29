#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\Polarisation.ahk" { Polarisation }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IDigitalLocator.ahk" { IDigitalLocator }

/**
 * The IDVBSLocator interface is implemented on the DVBSLocator object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBSLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbslocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBSLocator extends IDigitalLocator {
    /**
     * The interface identifier for IDVBSLocator
     * @type {Guid}
     */
    static IID := Guid("{3d7c353c-0d04-45f1-a742-f97cc1188dc8}")

    /**
     * The class identifier for DVBSLocator
     * @type {Guid}
     */
    static CLSID := Guid("{1df7d126-4050-47f0-a7cf-4c4ca9241333}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBSLocator interfaces
    */
    struct Vtbl extends IDigitalLocator.Vtbl {
        get_SignalPolarisation : IntPtr
        put_SignalPolarisation : IntPtr
        get_WestPosition       : IntPtr
        put_WestPosition       : IntPtr
        get_OrbitalPosition    : IntPtr
        put_OrbitalPosition    : IntPtr
        get_Azimuth            : IntPtr
        put_Azimuth            : IntPtr
        get_Elevation          : IntPtr
        put_Elevation          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBSLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Polarisation} 
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
     * @remarks
     * This method and the associated enumeration type use the British spelling for "polarisation" to maintain consistency with standards documentation.
     * @returns {Polarisation} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> that receives the polarisation value.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_signalpolarisation
     */
    get_SignalPolarisation() {
        result := ComCall(22, this, "int*", &PolarisationVal := 0, "HRESULT")
        return PolarisationVal
    }

    /**
     * The put_SignalPolarisation method sets the signal polarisation.
     * @remarks
     * This method and the associated enumeration type use the British spelling for "polarisation" to maintain consistency with standards documentation.
     * @param {Polarisation} PolarisationVal Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/polarisation">Polarisation</a> that specifies the signal polarisation value.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_signalpolarisation
     */
    put_SignalPolarisation(PolarisationVal) {
        result := ComCall(23, this, Polarisation, PolarisationVal, "HRESULT")
        return result
    }

    /**
     * The get_WestPosition method retrieves a value indicating whether the orbital position is given in east or west longitude.
     * @returns {VARIANT_BOOL} Pointer to a variable of type <b>VARIANT_BOOL</b>; a value of true means "west longitude."
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_westposition
     */
    get_WestPosition() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &WestLongitude := 0, "HRESULT")
        return WestLongitude
    }

    /**
     * The put_WestPosition method sets the longitudinal position as west longitude or east longitude.
     * @param {VARIANT_BOOL} WestLongitude Specifies whether the following longitude values that follow will be west or east longitude. True means "west longitude."
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_westposition
     */
    put_WestPosition(WestLongitude) {
        result := ComCall(25, this, VARIANT_BOOL, WestLongitude, "HRESULT")
        return result
    }

    /**
     * The get_OrbitalPosition method retrieves the setting for the satellite's orbital position.
     * @returns {Integer} Receives the longitude setting in tenths of a degree.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_orbitalposition
     */
    get_OrbitalPosition() {
        result := ComCall(26, this, "int*", &longitude := 0, "HRESULT")
        return longitude
    }

    /**
     * The put_OrbitalPosition method sets the setting for the satellite's orbital position.
     * @param {Integer} longitude The satellite's longitude in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_orbitalposition
     */
    put_OrbitalPosition(longitude) {
        result := ComCall(27, this, "int", longitude, "HRESULT")
        return result
    }

    /**
     * The get_Azimuth method retrieves the azimuth setting used for positioning the satellite dish.
     * @returns {Integer} Receives the azimuth in tenths of a degree.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_azimuth
     */
    get_Azimuth() {
        result := ComCall(28, this, "int*", &Azimuth := 0, "HRESULT")
        return Azimuth
    }

    /**
     * The put_Azimuth method adjusts the azimuth setting used for positioning the satellite dish.
     * @param {Integer} Azimuth The azimuth, in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_azimuth
     */
    put_Azimuth(Azimuth) {
        result := ComCall(29, this, "int", Azimuth, "HRESULT")
        return result
    }

    /**
     * The get_Elevation method retrieves the elevation of the satellite in tenths of a degree.
     * @returns {Integer} Receives the elevation setting in tenths of a degree.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-get_elevation
     */
    get_Elevation() {
        result := ComCall(30, this, "int*", &Elevation := 0, "HRESULT")
        return Elevation
    }

    /**
     * The put_Elevation method sets the elevation of the satellite in tenths of a degree.
     * @param {Integer} Elevation The elevation, in tenths of a degree.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbslocator-put_elevation
     */
    put_Elevation(Elevation) {
        result := ComCall(31, this, "int", Elevation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBSLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SignalPolarisation := CallbackCreate(GetMethod(implObj, "get_SignalPolarisation"), flags, 2)
        this.vtbl.put_SignalPolarisation := CallbackCreate(GetMethod(implObj, "put_SignalPolarisation"), flags, 2)
        this.vtbl.get_WestPosition := CallbackCreate(GetMethod(implObj, "get_WestPosition"), flags, 2)
        this.vtbl.put_WestPosition := CallbackCreate(GetMethod(implObj, "put_WestPosition"), flags, 2)
        this.vtbl.get_OrbitalPosition := CallbackCreate(GetMethod(implObj, "get_OrbitalPosition"), flags, 2)
        this.vtbl.put_OrbitalPosition := CallbackCreate(GetMethod(implObj, "put_OrbitalPosition"), flags, 2)
        this.vtbl.get_Azimuth := CallbackCreate(GetMethod(implObj, "get_Azimuth"), flags, 2)
        this.vtbl.put_Azimuth := CallbackCreate(GetMethod(implObj, "put_Azimuth"), flags, 2)
        this.vtbl.get_Elevation := CallbackCreate(GetMethod(implObj, "get_Elevation"), flags, 2)
        this.vtbl.put_Elevation := CallbackCreate(GetMethod(implObj, "put_Elevation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SignalPolarisation)
        CallbackFree(this.vtbl.put_SignalPolarisation)
        CallbackFree(this.vtbl.get_WestPosition)
        CallbackFree(this.vtbl.put_WestPosition)
        CallbackFree(this.vtbl.get_OrbitalPosition)
        CallbackFree(this.vtbl.put_OrbitalPosition)
        CallbackFree(this.vtbl.get_Azimuth)
        CallbackFree(this.vtbl.put_Azimuth)
        CallbackFree(this.vtbl.get_Elevation)
        CallbackFree(this.vtbl.put_Elevation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWebGeocoordinates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebGeocoordinates
     * @type {Guid}
     */
    static IID => Guid("{305107c7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeocoordinates
     * @type {Guid}
     */
    static CLSID => Guid("{305107c8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_latitude", "get_longitude", "get_altitude", "get_accuracy", "get_altitudeAccuracy", "get_heading", "get_speed"]

    /**
     * @type {Float} 
     */
    latitude {
        get => this.get_latitude()
    }

    /**
     * @type {Float} 
     */
    longitude {
        get => this.get_longitude()
    }

    /**
     * @type {VARIANT} 
     */
    altitude {
        get => this.get_altitude()
    }

    /**
     * @type {Float} 
     */
    accuracy {
        get => this.get_accuracy()
    }

    /**
     * @type {VARIANT} 
     */
    altitudeAccuracy {
        get => this.get_altitudeAccuracy()
    }

    /**
     * @type {VARIANT} 
     */
    heading {
        get => this.get_heading()
    }

    /**
     * @type {VARIANT} 
     */
    speed {
        get => this.get_speed()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_latitude() {
        result := ComCall(7, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_longitude() {
        result := ComCall(8, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_altitude() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_accuracy() {
        result := ComCall(10, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_altitudeAccuracy() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_heading() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_speed() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }
}

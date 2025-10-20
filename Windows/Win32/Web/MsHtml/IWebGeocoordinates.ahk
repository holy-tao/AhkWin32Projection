#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_latitude(p) {
        result := ComCall(7, this, "double*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_longitude(p) {
        result := ComCall(8, this, "double*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_altitude(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_accuracy(p) {
        result := ComCall(10, this, "double*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_altitudeAccuracy(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_heading(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_speed(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class IDispLatLongReport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispLatLongReport
     * @type {Guid}
     */
    static IID => Guid("{8ae32723-389b-4a11-9957-5bdd48fc9617}")

    /**
     * The class identifier for DispLatLongReport
     * @type {Guid}
     */
    static CLSID => Guid("{7a7c3277-8f84-4636-95b2-ebb5507ff77e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Latitude", "get_Longitude", "get_ErrorRadius", "get_Altitude", "get_AltitudeError", "get_Timestamp"]

    /**
     * @type {Float} 
     */
    Latitude {
        get => this.get_Latitude()
    }

    /**
     * @type {Float} 
     */
    Longitude {
        get => this.get_Longitude()
    }

    /**
     * @type {Float} 
     */
    ErrorRadius {
        get => this.get_ErrorRadius()
    }

    /**
     * @type {Float} 
     */
    Altitude {
        get => this.get_Altitude()
    }

    /**
     * @type {Float} 
     */
    AltitudeError {
        get => this.get_AltitudeError()
    }

    /**
     * @type {Float} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Latitude() {
        result := ComCall(7, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Longitude() {
        result := ComCall(8, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ErrorRadius() {
        result := ComCall(9, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Altitude() {
        result := ComCall(10, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AltitudeError() {
        result := ComCall(11, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Timestamp() {
        result := ComCall(12, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }
}

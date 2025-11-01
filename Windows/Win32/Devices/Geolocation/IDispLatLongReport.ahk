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
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Latitude(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Longitude(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_ErrorRadius(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Altitude(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_AltitudeError(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Timestamp(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pValMarshal, pVal, "HRESULT")
        return result
    }
}

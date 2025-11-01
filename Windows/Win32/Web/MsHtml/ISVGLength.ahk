#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGLength extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGLength
     * @type {Guid}
     */
    static IID => Guid("{305104cf-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGLength
     * @type {Guid}
     */
    static CLSID => Guid("{3051057e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_unitType", "get_unitType", "put_value", "get_value", "put_valueInSpecifiedUnits", "get_valueInSpecifiedUnits", "put_valueAsString", "get_valueAsString", "newValueSpecifiedUnits", "convertToSpecifiedUnits"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_unitType(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_unitType(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_value(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_valueInSpecifiedUnits(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_valueInSpecifiedUnits(p) {
        pMarshal := p is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_valueAsString(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_valueAsString(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unitType 
     * @param {Float} valueInSpecifiedUnits 
     * @returns {HRESULT} 
     */
    newValueSpecifiedUnits(unitType, valueInSpecifiedUnits) {
        result := ComCall(15, this, "short", unitType, "float", valueInSpecifiedUnits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unitType 
     * @returns {HRESULT} 
     */
    convertToSpecifiedUnits(unitType) {
        result := ComCall(16, this, "short", unitType, "HRESULT")
        return result
    }
}

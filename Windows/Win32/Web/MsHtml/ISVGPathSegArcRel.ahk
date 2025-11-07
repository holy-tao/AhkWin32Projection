#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathSegArcRel extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPathSegArcRel
     * @type {Guid}
     */
    static IID => Guid("{30510507-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegArcRel
     * @type {Guid}
     */
    static CLSID => Guid("{305105bc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_x", "get_x", "put_y", "get_y", "put_r1", "get_r1", "put_r2", "get_r2", "put_angle", "get_angle", "put_largeArcFlag", "get_largeArcFlag", "put_sweepFlag", "get_sweepFlag"]

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r1(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_r1() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r2(v) {
        result := ComCall(13, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_r2() {
        result := ComCall(14, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_angle(v) {
        result := ComCall(15, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_angle() {
        result := ComCall(16, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_largeArcFlag(v) {
        result := ComCall(17, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_largeArcFlag() {
        result := ComCall(18, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_sweepFlag(v) {
        result := ComCall(19, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_sweepFlag() {
        result := ComCall(20, this, "short*", &p := 0, "HRESULT")
        return p
    }
}

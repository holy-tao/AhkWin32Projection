#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathSegArcRel extends IDispatch{
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
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(7, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        result := ComCall(8, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(9, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        result := ComCall(10, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r1(v) {
        result := ComCall(11, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_r1(p) {
        result := ComCall(12, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r2(v) {
        result := ComCall(13, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_r2(p) {
        result := ComCall(14, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_angle(v) {
        result := ComCall(15, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_angle(p) {
        result := ComCall(16, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_largeArcFlag(v) {
        result := ComCall(17, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_largeArcFlag(p) {
        result := ComCall(18, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_sweepFlag(v) {
        result := ComCall(19, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_sweepFlag(p) {
        result := ComCall(20, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

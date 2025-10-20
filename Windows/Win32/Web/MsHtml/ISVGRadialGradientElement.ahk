#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGRadialGradientElement extends IDispatch{
    /**
     * The interface identifier for ISVGRadialGradientElement
     * @type {Guid}
     */
    static IID => Guid("{3051052a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGRadialGradientElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_cx(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_cx(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_cy(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_cy(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_r(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_r(p) {
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_fx(v) {
        result := ComCall(13, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_fx(p) {
        result := ComCall(14, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_fy(v) {
        result := ComCall(15, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_fy(p) {
        result := ComCall(16, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

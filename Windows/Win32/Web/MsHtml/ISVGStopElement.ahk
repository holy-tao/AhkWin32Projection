#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGStopElement extends IDispatch{
    /**
     * The interface identifier for ISVGStopElement
     * @type {Guid}
     */
    static IID => Guid("{3051052b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStopElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISVGAnimatedNumber>} v 
     * @returns {HRESULT} 
     */
    putref_offset(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedNumber>} p 
     * @returns {HRESULT} 
     */
    get_offset(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

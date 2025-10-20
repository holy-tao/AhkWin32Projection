#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGClipPathElement extends IDispatch{
    /**
     * The interface identifier for ISVGClipPathElement
     * @type {Guid}
     */
    static IID => Guid("{3051052d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGClipPathElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105e6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} v 
     * @returns {HRESULT} 
     */
    putref_clipPathUnits(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_clipPathUnits(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

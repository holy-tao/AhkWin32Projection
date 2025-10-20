#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAElement extends IDispatch{
    /**
     * The interface identifier for ISVGAElement
     * @type {Guid}
     */
    static IID => Guid("{3051054b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105db-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISVGAnimatedString>} v 
     * @returns {HRESULT} 
     */
    putref_target(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedString>} p 
     * @returns {HRESULT} 
     */
    get_target(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

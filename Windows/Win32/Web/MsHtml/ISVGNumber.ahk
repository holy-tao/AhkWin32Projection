#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGNumber extends IDispatch{
    /**
     * The interface identifier for ISVGNumber
     * @type {Guid}
     */
    static IID => Guid("{305104cb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGNumber
     * @type {Guid}
     */
    static CLSID => Guid("{30510587-98b5-11cf-bb82-00aa00bdce0b}")

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
    put_value(v) {
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
    get_value(p) {
        result := ComCall(8, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

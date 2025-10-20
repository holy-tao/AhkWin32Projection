#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathSeg extends IDispatch{
    /**
     * The interface identifier for ISVGPathSeg
     * @type {Guid}
     */
    static IID => Guid("{305104fc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSeg
     * @type {Guid}
     */
    static CLSID => Guid("{305105b3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pathSegType(v) {
        result := ComCall(7, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} p 
     * @returns {HRESULT} 
     */
    get_pathSegType(p) {
        result := ComCall(8, this, "short*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_pathSegTypeAsLetter(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGViewElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGViewElement
     * @type {Guid}
     */
    static IID => Guid("{3051054c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGViewElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105dc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_viewTarget", "get_viewTarget"]

    /**
     * 
     * @param {ISVGStringList} v 
     * @returns {HRESULT} 
     */
    putref_viewTarget(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGStringList>} p 
     * @returns {HRESULT} 
     */
    get_viewTarget(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }
}

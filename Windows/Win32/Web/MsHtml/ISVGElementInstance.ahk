#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGElementInstance extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGElementInstance
     * @type {Guid}
     */
    static IID => Guid("{305104ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElementInstance
     * @type {Guid}
     */
    static CLSID => Guid("{30510575-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_correspondingElement", "get_correspondingUseElement", "get_parentNode", "get_childNodes", "get_firstChild", "get_lastChild", "get_previousSibling", "get_nextSibling"]

    /**
     * 
     * @param {Pointer<ISVGElement>} p 
     * @returns {HRESULT} 
     */
    get_correspondingElement(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGUseElement>} p 
     * @returns {HRESULT} 
     */
    get_correspondingUseElement(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstance>} p 
     * @returns {HRESULT} 
     */
    get_parentNode(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstanceList>} p 
     * @returns {HRESULT} 
     */
    get_childNodes(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstance>} p 
     * @returns {HRESULT} 
     */
    get_firstChild(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstance>} p 
     * @returns {HRESULT} 
     */
    get_lastChild(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstance>} p 
     * @returns {HRESULT} 
     */
    get_previousSibling(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElementInstance>} p 
     * @returns {HRESULT} 
     */
    get_nextSibling(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }
}

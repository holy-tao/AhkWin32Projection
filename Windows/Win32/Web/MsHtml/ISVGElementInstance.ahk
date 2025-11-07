#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGElement.ahk
#Include .\ISVGUseElement.ahk
#Include .\ISVGElementInstance.ahk
#Include .\ISVGElementInstanceList.ahk
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
     * @returns {ISVGElement} 
     */
    get_correspondingElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGUseElement} 
     */
    get_correspondingUseElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGUseElement(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_parentNode() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstanceList} 
     */
    get_childNodes() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstanceList(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_firstChild() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_lastChild() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_previousSibling() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_nextSibling() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }
}

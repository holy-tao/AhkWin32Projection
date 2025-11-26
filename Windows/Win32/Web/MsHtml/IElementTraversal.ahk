#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementTraversal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementTraversal
     * @type {Guid}
     */
    static IID => Guid("{30510736-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_firstElementChild", "get_lastElementChild", "get_previousElementSibling", "get_nextElementSibling", "get_childElementCount"]

    /**
     * @type {IHTMLElement} 
     */
    firstElementChild {
        get => this.get_firstElementChild()
    }

    /**
     * @type {IHTMLElement} 
     */
    lastElementChild {
        get => this.get_lastElementChild()
    }

    /**
     * @type {IHTMLElement} 
     */
    previousElementSibling {
        get => this.get_previousElementSibling()
    }

    /**
     * @type {IHTMLElement} 
     */
    nextElementSibling {
        get => this.get_nextElementSibling()
    }

    /**
     * @type {Integer} 
     */
    childElementCount {
        get => this.get_childElementCount()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_firstElementChild() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_lastElementChild() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_previousElementSibling() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_nextElementSibling() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_childElementCount() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }
}

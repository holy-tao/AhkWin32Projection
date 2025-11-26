#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLEventObj.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCDefaultDispatch extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTCDefaultDispatch
     * @type {Guid}
     */
    static IID => Guid("{3050f4fd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCDefaultDispatch
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4fc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_element", "createEventObject", "get_defaults", "get_document"]

    /**
     * @type {IHTMLElement} 
     */
    element {
        get => this.get_element()
    }

    /**
     * @type {IDispatch} 
     */
    defaults {
        get => this.get_defaults()
    }

    /**
     * @type {IDispatch} 
     */
    document {
        get => this.get_document()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_element() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    createEventObject() {
        result := ComCall(8, this, "ptr*", &eventObj := 0, "HRESULT")
        return IHTMLEventObj(eventObj)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_defaults() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_document() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}

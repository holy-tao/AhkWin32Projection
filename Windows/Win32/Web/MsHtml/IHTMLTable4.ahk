#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLTableSection.ahk
#Include .\IHTMLTableCaption.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTable4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTable4
     * @type {Guid}
     */
    static IID => Guid("{305106c2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_tHead", "get_tHead", "putref_tFoot", "get_tFoot", "putref_caption", "get_caption", "insertRow", "deleteRow", "createTBody"]

    /**
     * @type {IHTMLTableSection} 
     */
    tHead {
        get => this.get_tHead()
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tFoot {
        get => this.get_tFoot()
    }

    /**
     * @type {IHTMLTableCaption} 
     */
    caption {
        get => this.get_caption()
    }

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tHead(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tHead() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tFoot(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tFoot() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @param {IHTMLTableCaption} v 
     * @returns {HRESULT} 
     */
    putref_caption(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    get_caption() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableCaption(p)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertRow(index) {
        result := ComCall(13, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(14, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    createTBody() {
        result := ComCall(15, this, "ptr*", &tbody := 0, "HRESULT")
        return IHTMLTableSection(tbody)
    }
}

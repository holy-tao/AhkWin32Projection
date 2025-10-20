#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPopup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPopup
     * @type {Guid}
     */
    static IID => Guid("{3050f666-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPopup
     * @type {Guid}
     */
    static CLSID => Guid("{3050f667-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["show", "hide", "get_document", "get_isOpen"]

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} w 
     * @param {Integer} h 
     * @param {Pointer<VARIANT>} pElement 
     * @returns {HRESULT} 
     */
    show(x, y, w, h, pElement) {
        result := ComCall(7, this, "int", x, "int", y, "int", w, "int", h, "ptr", pElement, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    hide() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDocument>} p 
     * @returns {HRESULT} 
     */
    get_document(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_isOpen(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPopup extends IDispatch{
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
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} w 
     * @param {Integer} h 
     * @param {Pointer<VARIANT>} pElement 
     * @returns {HRESULT} 
     */
    show(x, y, w, h, pElement) {
        result := ComCall(7, this, "int", x, "int", y, "int", w, "int", h, "ptr", pElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    hide() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDocument>} p 
     * @returns {HRESULT} 
     */
    get_document(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_isOpen(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

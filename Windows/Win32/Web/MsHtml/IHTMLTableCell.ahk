#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTableCell extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTableCell
     * @type {Guid}
     */
    static IID => Guid("{3050f23d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableCell
     * @type {Guid}
     */
    static CLSID => Guid("{3050f246-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_rowSpan", "get_rowSpan", "put_colSpan", "get_colSpan", "put_align", "get_align", "put_vAlign", "get_vAlign", "put_bgColor", "get_bgColor", "put_noWrap", "get_noWrap", "put_background", "get_background", "put_borderColor", "get_borderColor", "put_borderColorLight", "get_borderColorLight", "put_borderColorDark", "get_borderColorDark", "put_width", "get_width", "put_height", "get_height", "get_cellIndex"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_rowSpan(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_rowSpan(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_colSpan(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_colSpan(p) {
        result := ComCall(10, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_align(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_vAlign(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_bgColor(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noWrap(v) {
        result := ComCall(17, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_noWrap(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_background(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColor(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColorLight(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColorDark(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_cellIndex(p) {
        result := ComCall(31, this, "int*", p, "HRESULT")
        return result
    }
}

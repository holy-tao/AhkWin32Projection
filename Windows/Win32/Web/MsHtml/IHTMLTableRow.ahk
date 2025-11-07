#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLElementCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTableRow extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTableRow
     * @type {Guid}
     */
    static IID => Guid("{3050f23c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableRow
     * @type {Guid}
     */
    static CLSID => Guid("{3050f26d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_align", "get_align", "put_vAlign", "get_vAlign", "put_bgColor", "get_bgColor", "put_borderColor", "get_borderColor", "put_borderColorLight", "get_borderColorLight", "put_borderColorDark", "get_borderColorDark", "get_rowIndex", "get_sectionRowIndex", "get_cells", "insertCell", "deleteCell"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vAlign() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorLight() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorDark() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_rowIndex() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_sectionRowIndex() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_cells() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertCell(index) {
        result := ComCall(22, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteCell(index) {
        result := ComCall(23, this, "int", index, "HRESULT")
        return result
    }
}

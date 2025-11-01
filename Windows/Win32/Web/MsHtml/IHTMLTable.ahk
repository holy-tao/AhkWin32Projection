#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTable
     * @type {Guid}
     */
    static IID => Guid("{3050f21e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTable
     * @type {Guid}
     */
    static CLSID => Guid("{3050f26b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_cols", "get_cols", "put_border", "get_border", "put_frame", "get_frame", "put_rules", "get_rules", "put_cellSpacing", "get_cellSpacing", "put_cellPadding", "get_cellPadding", "put_background", "get_background", "put_bgColor", "get_bgColor", "put_borderColor", "get_borderColor", "put_borderColorLight", "get_borderColorLight", "put_borderColorDark", "get_borderColorDark", "put_align", "get_align", "refresh", "get_rows", "put_width", "get_width", "put_height", "get_height", "put_dataPageSize", "get_dataPageSize", "nextPage", "previousPage", "get_tHead", "get_tFoot", "get_tBodies", "get_caption", "createTHead", "deleteTHead", "createTFoot", "deleteTFoot", "createCaption", "deleteCaption", "insertRow", "deleteRow", "get_readyState", "put_onreadystatechange", "get_onreadystatechange"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_cols(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_cols(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_border(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frame(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_frame(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rules(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_rules(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_cellSpacing(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_cellSpacing(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_cellPadding(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_cellPadding(p) {
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
    put_bgColor(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_bgColor(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColor(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColorLight(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderColorDark(p) {
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_align(p) {
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    refresh() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_rows(p) {
        result := ComCall(32, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_dataPageSize(v) {
        result := ComCall(37, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_dataPageSize(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    nextPage() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    previousPage() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableSection>} p 
     * @returns {HRESULT} 
     */
    get_tHead(p) {
        result := ComCall(41, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableSection>} p 
     * @returns {HRESULT} 
     */
    get_tFoot(p) {
        result := ComCall(42, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_tBodies(p) {
        result := ComCall(43, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableCaption>} p 
     * @returns {HRESULT} 
     */
    get_caption(p) {
        result := ComCall(44, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} head 
     * @returns {HRESULT} 
     */
    createTHead(head) {
        result := ComCall(45, this, "ptr*", head, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTHead() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} foot 
     * @returns {HRESULT} 
     */
    createTFoot(foot) {
        result := ComCall(47, this, "ptr*", foot, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTFoot() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableCaption>} caption 
     * @returns {HRESULT} 
     */
    createCaption(caption) {
        result := ComCall(49, this, "ptr*", caption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteCaption() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDispatch>} row 
     * @returns {HRESULT} 
     */
    insertRow(index, row) {
        result := ComCall(51, this, "int", index, "ptr*", row, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(52, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_readyState(p) {
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(54, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onreadystatechange(p) {
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return result
    }
}

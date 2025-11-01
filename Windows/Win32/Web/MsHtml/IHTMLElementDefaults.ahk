#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElementDefaults extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElementDefaults
     * @type {Guid}
     */
    static IID => Guid("{3050f6c9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_style", "put_tabStop", "get_tabStop", "put_viewInheritStyle", "get_viewInheritStyle", "put_viewMasterTab", "get_viewMasterTab", "put_scrollSegmentX", "get_scrollSegmentX", "put_scrollSegmentY", "get_scrollSegmentY", "put_isMultiLine", "get_isMultiLine", "put_contentEditable", "get_contentEditable", "put_canHaveHTML", "get_canHaveHTML", "putref_viewLink", "get_viewLink", "put_frozen", "get_frozen"]

    /**
     * 
     * @param {Pointer<IHTMLStyle>} p 
     * @returns {HRESULT} 
     */
    get_style(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_tabStop(v) {
        result := ComCall(8, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_tabStop(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewInheritStyle(v) {
        result := ComCall(10, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_viewInheritStyle(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewMasterTab(v) {
        result := ComCall(12, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_viewMasterTab(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentX(v) {
        result := ComCall(14, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollSegmentX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentY(v) {
        result := ComCall(16, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollSegmentY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_isMultiLine(v) {
        result := ComCall(18, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_isMultiLine(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentEditable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_contentEditable(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_canHaveHTML(v) {
        result := ComCall(22, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_canHaveHTML(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDocument} v 
     * @returns {HRESULT} 
     */
    putref_viewLink(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDocument>} p 
     * @returns {HRESULT} 
     */
    get_viewLink(p) {
        result := ComCall(25, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frozen(v) {
        result := ComCall(26, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_frozen(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
    }
}

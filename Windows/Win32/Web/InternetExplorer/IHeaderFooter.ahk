#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHeaderFooter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeaderFooter
     * @type {Guid}
     */
    static IID => Guid("{3050f6ce-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_htmlHead", "get_htmlFoot", "put_textHead", "get_textHead", "put_textFoot", "get_textFoot", "put_page", "get_page", "put_pageTotal", "get_pageTotal", "put_URL", "get_URL", "put_title", "get_title", "put_dateShort", "get_dateShort", "put_dateLong", "get_dateLong", "put_timeShort", "get_timeShort", "put_timeLong", "get_timeLong"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_htmlHead(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_htmlFoot(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textHead(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textHead(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textFoot(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textFoot(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_page(v) {
        result := ComCall(13, this, "uint", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_page(p) {
        result := ComCall(14, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pageTotal(v) {
        result := ComCall(15, this, "uint", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_pageTotal(p) {
        result := ComCall(16, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_URL(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_title(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dateShort(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dateLong(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_timeShort(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_timeLong(p) {
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLHRElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLHRElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1f4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLHRElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f252-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_align", "get_align", "put_color", "get_color", "put_noShade", "get_noShade", "put_width", "get_width", "put_size", "get_size"]

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
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noShade(v) {
        result := ComCall(11, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noShade() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_size() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }
}

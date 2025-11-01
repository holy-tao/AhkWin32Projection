#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLRenderStyle extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLRenderStyle
     * @type {Guid}
     */
    static IID => Guid("{3050f6ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLRenderStyle
     * @type {Guid}
     */
    static CLSID => Guid("{3050f6aa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_textLineThroughStyle", "get_textLineThroughStyle", "put_textUnderlineStyle", "get_textUnderlineStyle", "put_textEffect", "get_textEffect", "put_textColor", "get_textColor", "put_textBackgroundColor", "get_textBackgroundColor", "put_textDecorationColor", "get_textDecorationColor", "put_renderingPriority", "get_renderingPriority", "put_defaultTextSelection", "get_defaultTextSelection", "put_textDecoration", "get_textDecoration"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textLineThroughStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textLineThroughStyle(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textUnderlineStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textUnderlineStyle(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textEffect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textEffect(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textColor(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textColor(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textBackgroundColor(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textBackgroundColor(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textDecorationColor(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textDecorationColor(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_renderingPriority(v) {
        result := ComCall(19, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_renderingPriority(p) {
        result := ComCall(20, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultTextSelection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_defaultTextSelection(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textDecoration(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }
}

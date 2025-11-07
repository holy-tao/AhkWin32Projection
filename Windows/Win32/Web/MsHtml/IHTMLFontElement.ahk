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
class IHTMLFontElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFontElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1d9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLFontElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f27b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_color", "get_color", "put_face", "get_face", "put_size", "get_size"]

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_face(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_face() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_size() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSMediaList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSMediaList
     * @type {Guid}
     */
    static IID => Guid("{30510731-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSMediaList
     * @type {Guid}
     */
    static CLSID => Guid("{30510732-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_mediaText", "get_mediaText", "get_length", "item", "appendMedium", "deleteMedium"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_mediaText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_mediaText(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pbstrMedium 
     * @returns {HRESULT} 
     */
    item(index, pbstrMedium) {
        result := ComCall(10, this, "int", index, "ptr", pbstrMedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    appendMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(11, this, "ptr", bstrMedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    deleteMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(12, this, "ptr", bstrMedium, "HRESULT")
        return result
    }
}

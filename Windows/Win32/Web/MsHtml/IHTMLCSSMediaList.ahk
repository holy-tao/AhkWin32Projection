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
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_mediaText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_mediaText(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(9, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pbstrMedium 
     * @returns {HRESULT} 
     */
    item(index, pbstrMedium) {
        result := ComCall(10, this, "int", index, "ptr", pbstrMedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    appendMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(11, this, "ptr", bstrMedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    deleteMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(12, this, "ptr", bstrMedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

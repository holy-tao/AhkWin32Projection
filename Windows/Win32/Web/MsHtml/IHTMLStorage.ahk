#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStorage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStorage
     * @type {Guid}
     */
    static IID => Guid("{30510474-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStorage
     * @type {Guid}
     */
    static CLSID => Guid("{30510475-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get_remainingSpace", "key", "getItem", "setItem", "removeItem", "clear"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_remainingSpace(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} __MIDL__IHTMLStorage0000 
     * @returns {HRESULT} 
     */
    key(lIndex, __MIDL__IHTMLStorage0000) {
        result := ComCall(9, this, "int", lIndex, "ptr", __MIDL__IHTMLStorage0000, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @param {Pointer<VARIANT>} __MIDL__IHTMLStorage0001 
     * @returns {HRESULT} 
     */
    getItem(bstrKey, __MIDL__IHTMLStorage0001) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(10, this, "ptr", bstrKey, "ptr", __MIDL__IHTMLStorage0001, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setItem(bstrKey, bstrValue) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(11, this, "ptr", bstrKey, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    removeItem(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(12, this, "ptr", bstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}

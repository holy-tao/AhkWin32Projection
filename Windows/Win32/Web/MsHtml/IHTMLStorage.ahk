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
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_remainingSpace() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {BSTR} 
     */
    key(lIndex) {
        __MIDL__IHTMLStorage0000 := BSTR()
        result := ComCall(9, this, "int", lIndex, "ptr", __MIDL__IHTMLStorage0000, "HRESULT")
        return __MIDL__IHTMLStorage0000
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {VARIANT} 
     */
    getItem(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        __MIDL__IHTMLStorage0001 := VARIANT()
        result := ComCall(10, this, "ptr", bstrKey, "ptr", __MIDL__IHTMLStorage0001, "HRESULT")
        return __MIDL__IHTMLStorage0001
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

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
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_remainingSpace(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} __MIDL__IHTMLStorage0000 
     * @returns {HRESULT} 
     */
    key(lIndex, __MIDL__IHTMLStorage0000) {
        result := ComCall(9, this, "int", lIndex, "ptr", __MIDL__IHTMLStorage0000, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "ptr", bstrKey, "ptr", __MIDL__IHTMLStorage0001, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(11, this, "ptr", bstrKey, "ptr", bstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    removeItem(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(12, this, "ptr", bstrKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

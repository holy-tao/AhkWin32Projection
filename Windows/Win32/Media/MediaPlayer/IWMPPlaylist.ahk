#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylist interface provides methods for manipulating lists of media items.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylist
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylist extends IDispatch{
    /**
     * The interface identifier for IWMPPlaylist
     * @type {Guid}
     */
    static IID => Guid("{d5f0f4f1-130c-11d3-b14e-00c04f79faa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_name(pbstrName) {
        result := ComCall(8, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_attributeCount(plCount) {
        result := ComCall(10, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrAttributeName 
     * @returns {HRESULT} 
     */
    get_attributeName(lIndex, pbstrAttributeName) {
        result := ComCall(11, this, "int", lIndex, "ptr", pbstrAttributeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPMedia>} ppIWMPMedia 
     * @returns {HRESULT} 
     */
    get_item(lIndex, ppIWMPMedia) {
        result := ComCall(12, this, "int", lIndex, "ptr", ppIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrName, pbstrVal) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr", pbstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setItemInfo(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pIWMPPlaylist 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     */
    get_isIdentical(pIWMPPlaylist, pvbool) {
        result := ComCall(15, this, "ptr", pIWMPPlaylist, "ptr", pvbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @returns {HRESULT} 
     */
    insertItem(lIndex, pIWMPMedia) {
        result := ComCall(17, this, "int", lIndex, "ptr", pIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @returns {HRESULT} 
     */
    appendItem(pIWMPMedia) {
        result := ComCall(18, this, "ptr", pIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @returns {HRESULT} 
     */
    removeItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndexOld 
     * @param {Integer} lIndexNew 
     * @returns {HRESULT} 
     */
    moveItem(lIndexOld, lIndexNew) {
        result := ComCall(20, this, "int", lIndexOld, "int", lIndexNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

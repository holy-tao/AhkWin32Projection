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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "get_name", "put_name", "get_attributeCount", "get_attributeName", "get_item", "getItemInfo", "setItemInfo", "get_isIdentical", "clear", "insertItem", "appendItem", "removeItem", "moveItem"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_count
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_name
     */
    get_name(pbstrName) {
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-put_name
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_attributecount
     */
    get_attributeCount(plCount) {
        result := ComCall(10, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrAttributeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_attributename
     */
    get_attributeName(lIndex, pbstrAttributeName) {
        result := ComCall(11, this, "int", lIndex, "ptr", pbstrAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPMedia>} ppIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_item
     */
    get_item(lIndex, ppIWMPMedia) {
        result := ComCall(12, this, "int", lIndex, "ptr*", ppIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-getiteminfo
     */
    getItemInfo(bstrName, pbstrVal) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-setiteminfo
     */
    setItemInfo(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pIWMPPlaylist 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_isidentical
     */
    get_isIdentical(pIWMPPlaylist, pvbool) {
        result := ComCall(15, this, "ptr", pIWMPPlaylist, "ptr", pvbool, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-clear
     */
    clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {IWMPMedia} pIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-insertitem
     */
    insertItem(lIndex, pIWMPMedia) {
        result := ComCall(17, this, "int", lIndex, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-appenditem
     */
    appendItem(pIWMPMedia) {
        result := ComCall(18, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-removeitem
     */
    removeItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndexOld 
     * @param {Integer} lIndexNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-moveitem
     */
    moveItem(lIndexOld, lIndexNew) {
        result := ComCall(20, this, "int", lIndexOld, "int", lIndexNew, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylistcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylistCollection extends IDispatch{
    /**
     * The interface identifier for IWMPPlaylistCollection
     * @type {Guid}
     */
    static IID => Guid("{10a13217-23a7-439b-b1c0-d847c79b7774}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylist>} ppItem 
     * @returns {HRESULT} 
     */
    newPlaylist(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylistArray>} ppPlaylistArray 
     * @returns {HRESULT} 
     */
    getAll(ppPlaylistArray) {
        result := ComCall(8, this, "ptr", ppPlaylistArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylistArray>} ppPlaylistArray 
     * @returns {HRESULT} 
     */
    getByName(bstrName, ppPlaylistArray) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr", ppPlaylistArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pItem 
     * @returns {HRESULT} 
     */
    remove(pItem) {
        result := ComCall(10, this, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(11, this, "ptr", pItem, "short", varfIsDeleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pItem 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted 
     * @returns {HRESULT} 
     */
    isDeleted(pItem, pvarfIsDeleted) {
        result := ComCall(12, this, "ptr", pItem, "ptr", pvarfIsDeleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pItem 
     * @param {Pointer<IWMPPlaylist>} ppImportedItem 
     * @returns {HRESULT} 
     */
    importPlaylist(pItem, ppImportedItem) {
        result := ComCall(13, this, "ptr", pItem, "ptr", ppImportedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

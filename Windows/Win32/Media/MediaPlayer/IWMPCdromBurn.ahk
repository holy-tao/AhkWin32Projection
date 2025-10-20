#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPCdromBurn interface provides methods to manage creating audio CDs.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromburn
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromBurn extends IUnknown{
    /**
     * The interface identifier for IWMPCdromBurn
     * @type {Guid}
     */
    static IID => Guid("{bd94dbeb-417f-4928-aa06-087d56ed9b59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     */
    isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(3, this, "ptr", bstrItem, "ptr", pIsAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrItem, pbstrVal) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(4, this, "ptr", bstrItem, "ptr", pbstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     */
    get_label(pbstrLabel) {
        result := ComCall(5, this, "ptr", pbstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(6, this, "ptr", bstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpbf 
     * @returns {HRESULT} 
     */
    get_burnFormat(pwmpbf) {
        result := ComCall(7, this, "int*", pwmpbf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wmpbf 
     * @returns {HRESULT} 
     */
    put_burnFormat(wmpbf) {
        result := ComCall(8, this, "int", wmpbf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppPlaylist 
     * @returns {HRESULT} 
     */
    get_burnPlaylist(ppPlaylist) {
        result := ComCall(9, this, "ptr", ppPlaylist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pPlaylist 
     * @returns {HRESULT} 
     */
    put_burnPlaylist(pPlaylist) {
        result := ComCall(10, this, "ptr", pPlaylist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    refreshStatus() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpbs 
     * @returns {HRESULT} 
     */
    get_burnState(pwmpbs) {
        result := ComCall(12, this, "int*", pwmpbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProgress 
     * @returns {HRESULT} 
     */
    get_burnProgress(plProgress) {
        result := ComCall(13, this, "int*", plProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startBurn() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopBurn() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    erase() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPCdromBurn interface provides methods to manage creating audio CDs.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromburn
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromBurn extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["isAvailable", "getItemInfo", "get_label", "put_label", "get_burnFormat", "put_burnFormat", "get_burnPlaylist", "put_burnPlaylist", "refreshStatus", "get_burnState", "get_burnProgress", "startBurn", "stopBurn", "erase"]

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-isavailable
     */
    isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-getiteminfo
     */
    getItemInfo(bstrItem, pbstrVal) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(4, this, "ptr", bstrItem, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_label
     */
    get_label(pbstrLabel) {
        result := ComCall(5, this, "ptr", pbstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_label
     */
    put_label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(6, this, "ptr", bstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpbf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnformat
     */
    get_burnFormat(pwmpbf) {
        pwmpbfMarshal := pwmpbf is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpbfMarshal, pwmpbf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wmpbf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_burnformat
     */
    put_burnFormat(wmpbf) {
        result := ComCall(8, this, "int", wmpbf, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnplaylist
     */
    get_burnPlaylist() {
        result := ComCall(9, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * 
     * @param {IWMPPlaylist} pPlaylist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_burnplaylist
     */
    put_burnPlaylist(pPlaylist) {
        result := ComCall(10, this, "ptr", pPlaylist, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-refreshstatus
     */
    refreshStatus() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpbs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnstate
     */
    get_burnState(pwmpbs) {
        pwmpbsMarshal := pwmpbs is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pwmpbsMarshal, pwmpbs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnprogress
     */
    get_burnProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-startburn
     */
    startBurn() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-stopburn
     */
    stopBurn() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-erase
     */
    erase() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}

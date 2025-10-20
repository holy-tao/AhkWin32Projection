#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadCollection
     * @type {Guid}
     */
    static IID => Guid("{0a319c7f-85f9-436c-b88e-82fd88000e1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_id", "get_count", "item", "startDownload", "removeItem", "Clear"]

    /**
     * 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     */
    get_id(plId) {
        result := ComCall(7, this, "int*", plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(8, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lItem 
     * @param {Pointer<IWMPDownloadItem2>} ppDownload 
     * @returns {HRESULT} 
     */
    item(lItem, ppDownload) {
        result := ComCall(9, this, "int", lItem, "ptr*", ppDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSourceURL 
     * @param {BSTR} bstrType 
     * @param {Pointer<IWMPDownloadItem2>} ppDownload 
     * @returns {HRESULT} 
     */
    startDownload(bstrSourceURL, bstrType, ppDownload) {
        bstrSourceURL := bstrSourceURL is String ? BSTR.Alloc(bstrSourceURL).Value : bstrSourceURL
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(10, this, "ptr", bstrSourceURL, "ptr", bstrType, "ptr*", ppDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lItem 
     * @returns {HRESULT} 
     */
    removeItem(lItem) {
        result := ComCall(11, this, "int", lItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}

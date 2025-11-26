#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPDownloadItem2.ahk
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
     */
    id {
        get => this.get_id()
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     */
    get_id(plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lItem 
     * @returns {IWMPDownloadItem2} 
     */
    item(lItem) {
        result := ComCall(9, this, "int", lItem, "ptr*", &ppDownload := 0, "HRESULT")
        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {BSTR} bstrSourceURL 
     * @param {BSTR} bstrType 
     * @returns {IWMPDownloadItem2} 
     */
    startDownload(bstrSourceURL, bstrType) {
        bstrSourceURL := bstrSourceURL is String ? BSTR.Alloc(bstrSourceURL).Value : bstrSourceURL
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(10, this, "ptr", bstrSourceURL, "ptr", bstrType, "ptr*", &ppDownload := 0, "HRESULT")
        return IWMPDownloadItem2(ppDownload)
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

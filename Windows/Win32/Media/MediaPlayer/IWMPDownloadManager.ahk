#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPDownloadCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadManager
     * @type {Guid}
     */
    static IID => Guid("{e15e9ad1-8f20-4cc4-9ec7-1a328ca86a0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getDownloadCollection", "createDownloadCollection"]

    /**
     * 
     * @param {Integer} lCollectionId 
     * @returns {IWMPDownloadCollection} 
     */
    getDownloadCollection(lCollectionId) {
        result := ComCall(7, this, "int", lCollectionId, "ptr*", &ppCollection := 0, "HRESULT")
        return IWMPDownloadCollection(ppCollection)
    }

    /**
     * 
     * @returns {IWMPDownloadCollection} 
     */
    createDownloadCollection() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IWMPDownloadCollection(ppCollection)
    }
}

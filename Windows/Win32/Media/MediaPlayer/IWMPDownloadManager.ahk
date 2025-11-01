#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IWMPDownloadCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    getDownloadCollection(lCollectionId, ppCollection) {
        result := ComCall(7, this, "int", lCollectionId, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPDownloadCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    createDownloadCollection(ppCollection) {
        result := ComCall(8, this, "ptr*", ppCollection, "HRESULT")
        return result
    }
}

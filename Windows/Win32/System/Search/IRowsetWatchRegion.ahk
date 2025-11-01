#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetWatchAll.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWatchRegion extends IRowsetWatchAll{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetWatchRegion
     * @type {Guid}
     */
    static IID => Guid("{0c733a45-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatchRegion", "ChangeWatchMode", "DeleteWatchRegion", "GetWatchRegionInfo", "Refresh", "ShrinkWatchRegion"]

    /**
     * 
     * @param {Integer} dwWatchMode 
     * @param {Pointer<Pointer>} phRegion 
     * @returns {HRESULT} 
     */
    CreateWatchRegion(dwWatchMode, phRegion) {
        phRegionMarshal := phRegion is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", dwWatchMode, phRegionMarshal, phRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Integer} dwWatchMode 
     * @returns {HRESULT} 
     */
    ChangeWatchMode(hRegion, dwWatchMode) {
        result := ComCall(7, this, "ptr", hRegion, "uint", dwWatchMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @returns {HRESULT} 
     */
    DeleteWatchRegion(hRegion) {
        result := ComCall(8, this, "ptr", hRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer<Integer>} pdwWatchMode 
     * @param {Pointer<Pointer>} phChapter 
     * @param {Pointer<Pointer>} pcbBookmark 
     * @param {Pointer<Pointer<Integer>>} ppBookmark 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetWatchRegionInfo(hRegion, pdwWatchMode, phChapter, pcbBookmark, ppBookmark, pcRows) {
        pdwWatchModeMarshal := pdwWatchMode is VarRef ? "uint*" : "ptr"
        phChapterMarshal := phChapter is VarRef ? "ptr*" : "ptr"
        pcbBookmarkMarshal := pcbBookmark is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hRegion, pdwWatchModeMarshal, pdwWatchMode, phChapterMarshal, phChapter, pcbBookmarkMarshal, pcbBookmark, "ptr*", ppBookmark, pcRowsMarshal, pcRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcChangesObtained 
     * @param {Pointer<Pointer<DBROWWATCHCHANGE>>} prgChanges 
     * @returns {HRESULT} 
     */
    Refresh(pcChangesObtained, prgChanges) {
        pcChangesObtainedMarshal := pcChangesObtained is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pcChangesObtainedMarshal, pcChangesObtained, "ptr*", prgChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    ShrinkWatchRegion(hRegion, hChapter, cbBookmark, pBookmark, cRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "ptr", hRegion, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", cRows, "HRESULT")
        return result
    }
}

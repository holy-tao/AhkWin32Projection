#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetIndex.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetCurrentIndex extends IRowsetIndex{
    /**
     * The interface identifier for IRowsetCurrentIndex
     * @type {Guid}
     */
    static IID => Guid("{0c733abd-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<DBID>} ppIndexID 
     * @returns {HRESULT} 
     */
    GetIndex(ppIndexID) {
        result := ComCall(6, this, "ptr", ppIndexID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pIndexID 
     * @returns {HRESULT} 
     */
    SetIndex(pIndexID) {
        result := ComCall(7, this, "ptr", pIndexID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

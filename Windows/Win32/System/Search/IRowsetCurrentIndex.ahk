#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetIndex.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetCurrentIndex extends IRowsetIndex{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndex", "SetIndex"]

    /**
     * 
     * @returns {Pointer<DBID>} 
     */
    GetIndex() {
        result := ComCall(6, this, "ptr*", &ppIndexID := 0, "HRESULT")
        return ppIndexID
    }

    /**
     * 
     * @param {Pointer<DBID>} pIndexID 
     * @returns {HRESULT} 
     */
    SetIndex(pIndexID) {
        result := ComCall(7, this, "ptr", pIndexID, "HRESULT")
        return result
    }
}

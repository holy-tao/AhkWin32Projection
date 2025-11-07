#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IIndexDefinition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexDefinition
     * @type {Guid}
     */
    static IID => Guid("{0c733a68-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIndex", "DropIndex"]

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer} cIndexColumnDescs 
     * @param {Pointer<DBINDEXCOLUMNDESC>} rgIndexColumnDescs 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {Pointer<DBID>} 
     */
    CreateIndex(pTableID, pIndexID, cIndexColumnDescs, rgIndexColumnDescs, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, "ptr", pTableID, "ptr", pIndexID, "ptr", cIndexColumnDescs, "ptr", rgIndexColumnDescs, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppIndexID := 0, "HRESULT")
        return ppIndexID
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @returns {HRESULT} 
     */
    DropIndex(pTableID, pIndexID) {
        result := ComCall(4, this, "ptr", pTableID, "ptr", pIndexID, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IAlterIndex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlterIndex
     * @type {Guid}
     */
    static IID => Guid("{0c733aa6-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AlterIndex"]

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pIndexId 
     * @param {Pointer<DBID>} pNewIndexId 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    AlterIndex(pTableId, pIndexId, pNewIndexId, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, "ptr", pTableId, "ptr", pIndexId, "ptr", pNewIndexId, "uint", cPropertySets, "ptr", rgPropertySets, "HRESULT")
        return result
    }
}

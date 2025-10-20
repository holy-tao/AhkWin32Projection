#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableDefinition extends IUnknown{
    /**
     * The interface identifier for ITableDefinition
     * @type {Guid}
     */
    static IID => Guid("{0c733a86-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer} cColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} rgColumnDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<DBID>} ppTableID 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    CreateTable(pUnkOuter, pTableID, cColumnDescs, rgColumnDescs, riid, cPropertySets, rgPropertySets, ppTableID, ppRowset) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", cColumnDescs, "ptr", rgColumnDescs, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr", ppTableID, "ptr", ppRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @returns {HRESULT} 
     */
    DropTable(pTableID) {
        result := ComCall(4, this, "ptr", pTableID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBCOLUMNDESC>} pColumnDesc 
     * @param {Pointer<DBID>} ppColumnID 
     * @returns {HRESULT} 
     */
    AddColumn(pTableID, pColumnDesc, ppColumnID) {
        result := ComCall(5, this, "ptr", pTableID, "ptr", pColumnDesc, "ptr", ppColumnID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pColumnID 
     * @returns {HRESULT} 
     */
    DropColumn(pTableID, pColumnID) {
        result := ComCall(6, this, "ptr", pTableID, "ptr", pColumnID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

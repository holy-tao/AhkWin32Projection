#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITableCreation.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableDefinitionWithConstraints extends ITableCreation{
    /**
     * The interface identifier for ITableDefinitionWithConstraints
     * @type {Guid}
     */
    static IID => Guid("{0c733aab-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBCONSTRAINTDESC>} pConstraintDesc 
     * @returns {HRESULT} 
     */
    AddConstraint(pTableID, pConstraintDesc) {
        result := ComCall(8, this, "ptr", pTableID, "ptr", pConstraintDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer} cColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} rgColumnDescs 
     * @param {Integer} cConstraintDescs 
     * @param {Pointer<DBCONSTRAINTDESC>} rgConstraintDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<DBID>} ppTableID 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    CreateTableWithConstraints(pUnkOuter, pTableID, cColumnDescs, rgColumnDescs, cConstraintDescs, rgConstraintDescs, riid, cPropertySets, rgPropertySets, ppTableID, ppRowset) {
        result := ComCall(9, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", cColumnDescs, "ptr", rgColumnDescs, "uint", cConstraintDescs, "ptr", rgConstraintDescs, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr", ppTableID, "ptr", ppRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pConstraintID 
     * @returns {HRESULT} 
     */
    DropConstraint(pTableID, pConstraintID) {
        result := ComCall(10, this, "ptr", pTableID, "ptr", pConstraintID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

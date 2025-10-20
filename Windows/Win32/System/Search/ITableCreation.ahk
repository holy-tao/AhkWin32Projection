#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITableDefinition.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableCreation extends ITableDefinition{
    /**
     * The interface identifier for ITableCreation
     * @type {Guid}
     */
    static IID => Guid("{0c733abc-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<UIntPtr>} pcColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} prgColumnDescs 
     * @param {Pointer<UInt32>} pcPropertySets 
     * @param {Pointer<DBPROPSET>} prgPropertySets 
     * @param {Pointer<UInt32>} pcConstraintDescs 
     * @param {Pointer<DBCONSTRAINTDESC>} prgConstraintDescs 
     * @param {Pointer<UInt16>} ppwszStringBuffer 
     * @returns {HRESULT} 
     */
    GetTableDefinition(pTableID, pcColumnDescs, prgColumnDescs, pcPropertySets, prgPropertySets, pcConstraintDescs, prgConstraintDescs, ppwszStringBuffer) {
        result := ComCall(7, this, "ptr", pTableID, "ptr*", pcColumnDescs, "ptr", prgColumnDescs, "uint*", pcPropertySets, "ptr", prgPropertySets, "uint*", pcConstraintDescs, "ptr", prgConstraintDescs, "ushort*", ppwszStringBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

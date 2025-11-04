#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITableDefinition.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableCreation extends ITableDefinition{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTableDefinition"]

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<Pointer>} pcColumnDescs 
     * @param {Pointer<Pointer<DBCOLUMNDESC>>} prgColumnDescs 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @param {Pointer<Integer>} pcConstraintDescs 
     * @param {Pointer<Pointer<DBCONSTRAINTDESC>>} prgConstraintDescs 
     * @param {Pointer<Pointer<Integer>>} ppwszStringBuffer 
     * @returns {HRESULT} 
     */
    GetTableDefinition(pTableID, pcColumnDescs, prgColumnDescs, pcPropertySets, prgPropertySets, pcConstraintDescs, prgConstraintDescs, ppwszStringBuffer) {
        pcColumnDescsMarshal := pcColumnDescs is VarRef ? "ptr*" : "ptr"
        prgColumnDescsMarshal := prgColumnDescs is VarRef ? "ptr*" : "ptr"
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"
        prgPropertySetsMarshal := prgPropertySets is VarRef ? "ptr*" : "ptr"
        pcConstraintDescsMarshal := pcConstraintDescs is VarRef ? "uint*" : "ptr"
        prgConstraintDescsMarshal := prgConstraintDescs is VarRef ? "ptr*" : "ptr"
        ppwszStringBufferMarshal := ppwszStringBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pTableID, pcColumnDescsMarshal, pcColumnDescs, prgColumnDescsMarshal, prgColumnDescs, pcPropertySetsMarshal, pcPropertySets, prgPropertySetsMarshal, prgPropertySets, pcConstraintDescsMarshal, pcConstraintDescs, prgConstraintDescsMarshal, prgConstraintDescs, ppwszStringBufferMarshal, ppwszStringBuffer, "HRESULT")
        return result
    }
}

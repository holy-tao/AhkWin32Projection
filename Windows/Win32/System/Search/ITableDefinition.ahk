#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableDefinition extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTable", "DropTable", "AddColumn", "DropColumn"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer} cColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} rgColumnDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<Pointer<DBID>>} ppTableID 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    CreateTable(pUnkOuter, pTableID, cColumnDescs, rgColumnDescs, riid, cPropertySets, rgPropertySets, ppTableID, ppRowset) {
        ppTableIDMarshal := ppTableID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", cColumnDescs, "ptr", rgColumnDescs, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, ppTableIDMarshal, ppTableID, "ptr*", ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @returns {HRESULT} 
     */
    DropTable(pTableID) {
        result := ComCall(4, this, "ptr", pTableID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBCOLUMNDESC>} pColumnDesc 
     * @param {Pointer<Pointer<DBID>>} ppColumnID 
     * @returns {HRESULT} 
     */
    AddColumn(pTableID, pColumnDesc, ppColumnID) {
        ppColumnIDMarshal := ppColumnID is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pTableID, "ptr", pColumnDesc, ppColumnIDMarshal, ppColumnID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pColumnID 
     * @returns {HRESULT} 
     */
    DropColumn(pTableID, pColumnID) {
        result := ComCall(6, this, "ptr", pTableID, "ptr", pColumnID, "HRESULT")
        return result
    }
}

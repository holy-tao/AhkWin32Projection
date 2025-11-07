#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMMapEntry.ahk
#Include .\IGPMResult.ahk
#Include .\IGPMMapEntryCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMMigrationTable interface provides an interface to a migration table.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmmigrationtable
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMMigrationTable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMMigrationTable
     * @type {Guid}
     */
    static IID => Guid("{48f823b1-efaf-470b-b6ed-40d14ee1a4ec}")

    /**
     * The class identifier for GPMMigrationTable
     * @type {Guid}
     */
    static CLSID => Guid("{55af4043-2a06-4f72-abef-631b44079c76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "Add", "AddEntry", "GetEntry", "DeleteEntry", "UpdateDestination", "Validate", "GetEntries"]

    /**
     * 
     * @param {BSTR} bstrMigrationTablePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-save
     */
    Save(bstrMigrationTablePath) {
        bstrMigrationTablePath := bstrMigrationTablePath is String ? BSTR.Alloc(bstrMigrationTablePath).Value : bstrMigrationTablePath

        result := ComCall(7, this, "ptr", bstrMigrationTablePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-add
     */
    Add(lFlags, var) {
        result := ComCall(8, this, "int", lFlags, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @param {Integer} gpmEntryType 
     * @param {Pointer<VARIANT>} pvarDestination 
     * @returns {IGPMMapEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-addentry
     */
    AddEntry(bstrSource, gpmEntryType, pvarDestination) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(9, this, "ptr", bstrSource, "int", gpmEntryType, "ptr", pvarDestination, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @returns {IGPMMapEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-getentry
     */
    GetEntry(bstrSource) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(10, this, "ptr", bstrSource, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-deleteentry
     */
    DeleteEntry(bstrSource) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(11, this, "ptr", bstrSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @param {Pointer<VARIANT>} pvarDestination 
     * @returns {IGPMMapEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-updatedestination
     */
    UpdateDestination(bstrSource, pvarDestination) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(12, this, "ptr", bstrSource, "ptr", pvarDestination, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-validate
     */
    Validate() {
        result := ComCall(13, this, "ptr*", &ppResult := 0, "HRESULT")
        return IGPMResult(ppResult)
    }

    /**
     * 
     * @returns {IGPMMapEntryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-getentries
     */
    GetEntries() {
        result := ComCall(14, this, "ptr*", &ppEntries := 0, "HRESULT")
        return IGPMMapEntryCollection(ppEntries)
    }
}

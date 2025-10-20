#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMMigrationTable interface provides an interface to a migration table.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmmigrationtable
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMMigrationTable extends IDispatch{
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
     * 
     * @param {BSTR} bstrMigrationTablePath 
     * @returns {HRESULT} 
     */
    Save(bstrMigrationTablePath) {
        bstrMigrationTablePath := bstrMigrationTablePath is String ? BSTR.Alloc(bstrMigrationTablePath).Value : bstrMigrationTablePath

        result := ComCall(7, this, "ptr", bstrMigrationTablePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    Add(lFlags, var) {
        result := ComCall(8, this, "int", lFlags, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @param {Integer} gpmEntryType 
     * @param {Pointer<VARIANT>} pvarDestination 
     * @param {Pointer<IGPMMapEntry>} ppEntry 
     * @returns {HRESULT} 
     */
    AddEntry(bstrSource, gpmEntryType, pvarDestination, ppEntry) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(9, this, "ptr", bstrSource, "int", gpmEntryType, "ptr", pvarDestination, "ptr", ppEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @param {Pointer<IGPMMapEntry>} ppEntry 
     * @returns {HRESULT} 
     */
    GetEntry(bstrSource, ppEntry) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(10, this, "ptr", bstrSource, "ptr", ppEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @returns {HRESULT} 
     */
    DeleteEntry(bstrSource) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(11, this, "ptr", bstrSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSource 
     * @param {Pointer<VARIANT>} pvarDestination 
     * @param {Pointer<IGPMMapEntry>} ppEntry 
     * @returns {HRESULT} 
     */
    UpdateDestination(bstrSource, pvarDestination, ppEntry) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(12, this, "ptr", bstrSource, "ptr", pvarDestination, "ptr", ppEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMResult>} ppResult 
     * @returns {HRESULT} 
     */
    Validate(ppResult) {
        result := ComCall(13, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMMapEntryCollection>} ppEntries 
     * @returns {HRESULT} 
     */
    GetEntries(ppEntries) {
        result := ComCall(14, this, "ptr", ppEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMMapEntryCollection.ahk" { IGPMMapEntryCollection }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IGPMMapEntry.ahk" { IGPMMapEntry }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import ".\GPMEntryType.ahk" { GPMEntryType }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMMigrationTable interface provides an interface to a migration table.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmmigrationtable
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMMigrationTable extends IDispatch {
    /**
     * The interface identifier for IGPMMigrationTable
     * @type {Guid}
     */
    static IID := Guid("{48f823b1-efaf-470b-b6ed-40d14ee1a4ec}")

    /**
     * The class identifier for GPMMigrationTable
     * @type {Guid}
     */
    static CLSID := Guid("{55af4043-2a06-4f72-abef-631b44079c76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMMigrationTable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Save              : IntPtr
        Add               : IntPtr
        AddEntry          : IntPtr
        GetEntry          : IntPtr
        DeleteEntry       : IntPtr
        UpdateDestination : IntPtr
        Validate          : IntPtr
        GetEntries        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMMigrationTable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Saves the migration table currently in memory in a specified location.
     * @param {BSTR} bstrMigrationTablePath Path to file location where the migration table currently in memory is to be saved.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-save
     */
    Save(bstrMigrationTablePath) {
        bstrMigrationTablePath := bstrMigrationTablePath is String ? BSTR.Alloc(bstrMigrationTablePath).Value : bstrMigrationTablePath

        result := ComCall(7, this, BSTR, bstrMigrationTablePath, "HRESULT")
        return result
    }

    /**
     * Adds entries from the IGPMGPO and IGPMBackup interfaces. The method updates any entries that are already present in the migration table.
     * @param {Integer} lFlags 
     * @param {VARIANT} var Dispatch pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> interface.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-add
     */
    Add(lFlags, var) {
        result := ComCall(8, this, "int", lFlags, VARIANT, var, "HRESULT")
        return result
    }

    /**
     * Creates an entry in the migration table. The method updates an existing entry.
     * @param {BSTR} bstrSource Source field of the entry. This parameter cannot be null.
     * @param {GPMEntryType} _gpmEntryType 
     * @param {Pointer<VARIANT>} pvarDestination A pointer to a <b>VARIANT</b> structure. You can use the <b>DestinationOptions</b>: <b>opDestinationSameAsSource</b>, <b>opDestinationNone</b>, or <b>opDestinationByRelativeName</b> by passing in a <i>pvarDestination</i> with a <b>vt</b> member of VT_I4. To explicitly pass in the destination, pass in a <i>pvarDestination</i> with a <b>vt</b> member of VT_BSTR, and this sets the <b>DestinationOptions</b> to <b>opDestinationSet</b>. If you pass in null, <b>AddEntry</b> uses the default value for the destination option, <b>opDestinationSameAsSource</b>.
     * @returns {IGPMMapEntry} The new entry.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-addentry
     */
    AddEntry(bstrSource, _gpmEntryType, pvarDestination) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(9, this, BSTR, bstrSource, GPMEntryType, _gpmEntryType, VARIANT.Ptr, pvarDestination, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * The GetEntry method gets the entry in the migration table for a specified source field.
     * @param {BSTR} bstrSource Source field of the entry to retrieve.
     * @returns {IGPMMapEntry} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmmapentry">IGPMMapEntry</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-getentry
     */
    GetEntry(bstrSource) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(10, this, BSTR, bstrSource, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * Deletes an entry from the migration table.
     * @param {BSTR} bstrSource Source field of the entry to delete. Use null-terminated string.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-deleteentry
     */
    DeleteEntry(bstrSource) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(11, this, BSTR, bstrSource, "HRESULT")
        return result
    }

    /**
     * Updates the destination field of an entry in a migration table. You can specify the destination option and the destination.
     * @param {BSTR} bstrSource The source field of the migration table which is to be updated.
     * @param {Pointer<VARIANT>} pvarDestination A pointer to a <b>VARIANT</b> structure.  You can  use the DestinationOptions: opDestinationSameAsSource, opDestinationNone, or opDestinationByRelativeName by passing  in a <i>pvarDestination</i> with a <b>vt</b> member of VT_I4. To explicitly pass in the destination,  pass in a <i>pvarDestination</i> with a <b>vt</b> member of VT_BSTR, and this will set the DestinationOption to opDestinationSet. If you pass in null, UpdateDestination uses the default value for the destination option, opDestinationSameAsSource.
     * @returns {IGPMMapEntry} The updated entry.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-updatedestination
     */
    UpdateDestination(bstrSource, pvarDestination) {
        bstrSource := bstrSource is String ? BSTR.Alloc(bstrSource).Value : bstrSource

        result := ComCall(12, this, BSTR, bstrSource, VARIANT.Ptr, pvarDestination, "ptr*", &ppEntry := 0, "HRESULT")
        return IGPMMapEntry(ppEntry)
    }

    /**
     * Validates the migration table.
     * @returns {IGPMResult} Reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Result</b> property references whether the validation is successful. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmessage">Status</a> property references the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> that contains the validation errors or warnings.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-validate
     */
    Validate() {
        result := ComCall(13, this, "ptr*", &ppResult := 0, "HRESULT")
        return IGPMResult(ppResult)
    }

    /**
     * Returns a IGPMMapEntryCollection interface.
     * @returns {IGPMMapEntryCollection} The list of entries in the migration table.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmigrationtable-getentries
     */
    GetEntries() {
        result := ComCall(14, this, "ptr*", &ppEntries := 0, "HRESULT")
        return IGPMMapEntryCollection(ppEntries)
    }

    Query(iid) {
        if (IGPMMigrationTable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.AddEntry := CallbackCreate(GetMethod(implObj, "AddEntry"), flags, 5)
        this.vtbl.GetEntry := CallbackCreate(GetMethod(implObj, "GetEntry"), flags, 3)
        this.vtbl.DeleteEntry := CallbackCreate(GetMethod(implObj, "DeleteEntry"), flags, 2)
        this.vtbl.UpdateDestination := CallbackCreate(GetMethod(implObj, "UpdateDestination"), flags, 4)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 2)
        this.vtbl.GetEntries := CallbackCreate(GetMethod(implObj, "GetEntries"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.AddEntry)
        CallbackFree(this.vtbl.GetEntry)
        CallbackFree(this.vtbl.DeleteEntry)
        CallbackFree(this.vtbl.UpdateDestination)
        CallbackFree(this.vtbl.Validate)
        CallbackFree(this.vtbl.GetEntries)
    }
}

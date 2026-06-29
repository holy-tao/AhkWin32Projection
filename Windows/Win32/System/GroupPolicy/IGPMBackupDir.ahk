#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGPMBackupCollection.ahk" { IGPMBackupCollection }
#Import ".\IGPMBackup.ahk" { IGPMBackup }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMSearchCriteria.ahk" { IGPMSearchCriteria }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IGPMBackupDir interface supports methods that allow you to query GPMBackup and GPMBackupCollection objects when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmbackupdir
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMBackupDir extends IDispatch {
    /**
     * The interface identifier for IGPMBackupDir
     * @type {Guid}
     */
    static IID := Guid("{b1568bed-0a93-4acc-810f-afe7081019b9}")

    /**
     * The class identifier for GPMBackupDir
     * @type {Guid}
     */
    static CLSID := Guid("{fce4a59d-0f21-4afa-b859-e6d0c62cd10c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMBackupDir interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BackupDirectory : IntPtr
        GetBackup           : IntPtr
        SearchBackups       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMBackupDir.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    BackupDirectory {
        get => this.get_BackupDirectory()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BackupDirectory() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the GPMBackup object that has the specified backup ID (GUID). The backup ID is the ID of the backed-up GPO, not the ID of the GPO.
     * @param {BSTR} bstrID ID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> object to open.
     * @returns {IGPMBackup} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> interface for the specified ID.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdir-getbackup
     */
    GetBackup(bstrID) {
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID

        result := ComCall(8, this, BSTR, bstrID, "ptr*", &ppBackup := 0, "HRESULT")
        return IGPMBackup(ppBackup)
    }

    /**
     * Executes a search for the GPMBackup object according to the specified criteria, and returns a GPMBackupCollection object.
     * @remarks
     * An empty  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">GPMSearchCriteria</a> has had no criteria added to it. Passing in an empty <b>GPMSearchCriteria</b> will return all  
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> objects.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria Pointer to the criteria to apply to the search.
     * @returns {IGPMBackupCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupcollection">IGPMBackupCollection</a> interface that represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> objects found by the search.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdir-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria) {
        result := ComCall(9, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMBackupCollection := 0, "HRESULT")
        return IGPMBackupCollection(ppIGPMBackupCollection)
    }

    Query(iid) {
        if (IGPMBackupDir.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BackupDirectory := CallbackCreate(GetMethod(implObj, "get_BackupDirectory"), flags, 2)
        this.vtbl.GetBackup := CallbackCreate(GetMethod(implObj, "GetBackup"), flags, 3)
        this.vtbl.SearchBackups := CallbackCreate(GetMethod(implObj, "SearchBackups"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BackupDirectory)
        CallbackFree(this.vtbl.GetBackup)
        CallbackFree(this.vtbl.SearchBackups)
    }
}

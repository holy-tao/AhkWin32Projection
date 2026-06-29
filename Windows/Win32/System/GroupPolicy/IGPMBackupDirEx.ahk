#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMSearchCriteria.ahk" { IGPMSearchCriteria }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMBackupType.ahk" { GPMBackupType }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMBackupDirEx interface supports methods that allow you to query GPMBackup, GPMBackupCollection, GPMStarterGPOBackup, and GPMStarterGPOBackupCollection objects when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmbackupdirex
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMBackupDirEx extends IDispatch {
    /**
     * The interface identifier for IGPMBackupDirEx
     * @type {Guid}
     */
    static IID := Guid("{f8dc55ed-3ba0-4864-aad4-d365189ee1d5}")

    /**
     * The class identifier for GPMBackupDirEx
     * @type {Guid}
     */
    static CLSID := Guid("{e8c0988a-cf03-4c5b-8be2-2aa9ad32aada}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMBackupDirEx interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BackupDir  : IntPtr
        get_BackupType : IntPtr
        GetBackup      : IntPtr
        SearchBackups  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMBackupDirEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    BackupDir {
        get => this.get_BackupDir()
    }

    /**
     * @type {GPMBackupType} 
     */
    BackupType {
        get => this.get_BackupType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BackupDir() {
        pbstrBackupDir := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrBackupDir, "HRESULT")
        return pbstrBackupDir
    }

    /**
     * 
     * @returns {GPMBackupType} 
     */
    get_BackupType() {
        result := ComCall(8, this, "int*", &pgpmBackupType := 0, "HRESULT")
        return pgpmBackupType
    }

    /**
     * Retrieves the GPMBackup or GPMStarterGPOBackup object with the specified backup ID. The backup ID is a GUID. The backup ID is the ID of the backed-up Group Policy object (GPO), not the ID of the GPO.
     * @param {BSTR} bstrID ID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> or <b>GPMStarterGPOBackup</b> object to open.
     * @returns {VARIANT} Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> or <b>IGPMStarterGPOBackup</b> interface for the ID specified.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-getbackup
     */
    GetBackup(bstrID) {
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID

        pvarBackup := VARIANT()
        result := ComCall(9, this, BSTR, bstrID, VARIANT.Ptr, pvarBackup, "HRESULT")
        return pvarBackup
    }

    /**
     * Executes a search for a GPMBackup object or an IGPMStarterGPOBackup interface according to the specified criteria, and returns a GPMBackupCollection or GPMStarterGPOBackupCollection object.
     * @remarks
     * An empty  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">IGPMSearchCriteria</a> interface or <b>GPMSearchCriteria</b> object has had no criteria added to it. Passing in an empty <b>IGPMSearchCriteria</b> interface or <b>GPMSearchCriteria</b> object will return all  
     * information in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> or <b>IGPMStarterGPOBackup</b> interface.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria Pointer to the criteria to be applied to the search.
     * @returns {VARIANT} Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupcollection">IGPMBackupCollection</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupcollection">IGPMStarterGPOBackupCollection</a> interface that represent the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> or <b>IGPMStarterGPOBackup</b> objects that are found by the search.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria) {
        pvarBackupCollection := VARIANT()
        result := ComCall(10, this, "ptr", pIGPMSearchCriteria, VARIANT.Ptr, pvarBackupCollection, "HRESULT")
        return pvarBackupCollection
    }

    Query(iid) {
        if (IGPMBackupDirEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BackupDir := CallbackCreate(GetMethod(implObj, "get_BackupDir"), flags, 2)
        this.vtbl.get_BackupType := CallbackCreate(GetMethod(implObj, "get_BackupType"), flags, 2)
        this.vtbl.GetBackup := CallbackCreate(GetMethod(implObj, "GetBackup"), flags, 3)
        this.vtbl.SearchBackups := CallbackCreate(GetMethod(implObj, "SearchBackups"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BackupDir)
        CallbackFree(this.vtbl.get_BackupType)
        CallbackFree(this.vtbl.GetBackup)
        CallbackFree(this.vtbl.SearchBackups)
    }
}

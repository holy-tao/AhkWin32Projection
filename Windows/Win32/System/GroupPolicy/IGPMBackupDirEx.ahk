#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackupDirEx interface supports methods that allow you to query GPMBackup, GPMBackupCollection, GPMStarterGPOBackup, and GPMStarterGPOBackupCollection objects when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nn-gpmgmt-igpmbackupdirex
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMBackupDirEx extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMBackupDirEx
     * @type {Guid}
     */
    static IID => Guid("{f8dc55ed-3ba0-4864-aad4-d365189ee1d5}")

    /**
     * The class identifier for GPMBackupDirEx
     * @type {Guid}
     */
    static CLSID => Guid("{e8c0988a-cf03-4c5b-8be2-2aa9ad32aada}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackupDir", "get_BackupType", "GetBackup", "SearchBackups"]

    /**
     * @type {BSTR} 
     */
    BackupDir {
        get => this.get_BackupDir()
    }

    /**
     * @type {Integer} 
     */
    BackupType {
        get => this.get_BackupType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BackupDir() {
        pbstrBackupDir := BSTR()
        result := ComCall(7, this, "ptr", pbstrBackupDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrBackupDir
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackupType() {
        result := ComCall(8, this, "int*", &pgpmBackupType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pgpmBackupType
    }

    /**
     * Retrieves the GPMBackup or GPMStarterGPOBackup object with the specified backup ID. The backup ID is a GUID. The backup ID is the ID of the backed-up Group Policy object (GPO), not the ID of the GPO.
     * @param {BSTR} bstrID ID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> or <b>GPMStarterGPOBackup</b> object to open.
     * @returns {VARIANT} Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> or <b>IGPMStarterGPOBackup</b> interface for the ID specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmbackupdirex-getbackup
     */
    GetBackup(bstrID) {
        if(bstrID is String) {
            pin := BSTR.Alloc(bstrID)
            bstrID := pin.Value
        }

        pvarBackup := VARIANT()
        result := ComCall(9, this, "ptr", bstrID, "ptr", pvarBackup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria) {
        pvarBackupCollection := VARIANT()
        result := ComCall(10, this, "ptr", pIGPMSearchCriteria, "ptr", pvarBackupCollection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarBackupCollection
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackupDirEx interface supports methods that allow you to query GPMBackup, GPMBackupCollection, GPMStarterGPOBackup, and GPMStarterGPOBackupCollection objects when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmbackupdirex
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
     * 
     * @returns {BSTR} 
     */
    get_BackupDir() {
        pbstrBackupDir := BSTR()
        result := ComCall(7, this, "ptr", pbstrBackupDir, "HRESULT")
        return pbstrBackupDir
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackupType() {
        result := ComCall(8, this, "int*", &pgpmBackupType := 0, "HRESULT")
        return pgpmBackupType
    }

    /**
     * 
     * @param {BSTR} bstrID 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-getbackup
     */
    GetBackup(bstrID) {
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID

        pvarBackup := VARIANT()
        result := ComCall(9, this, "ptr", bstrID, "ptr", pvarBackup, "HRESULT")
        return pvarBackup
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria) {
        pvarBackupCollection := VARIANT()
        result := ComCall(10, this, "ptr", pIGPMSearchCriteria, "ptr", pvarBackupCollection, "HRESULT")
        return pvarBackupCollection
    }
}

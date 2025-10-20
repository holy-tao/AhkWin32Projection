#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackupDir interface supports methods that allow you to query GPMBackup and GPMBackupCollection objects when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmbackupdir
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMBackupDir extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMBackupDir
     * @type {Guid}
     */
    static IID => Guid("{b1568bed-0a93-4acc-810f-afe7081019b9}")

    /**
     * The class identifier for GPMBackupDir
     * @type {Guid}
     */
    static CLSID => Guid("{fce4a59d-0f21-4afa-b859-e6d0c62cd10c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackupDirectory", "GetBackup", "SearchBackups"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_BackupDirectory(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrID 
     * @param {Pointer<IGPMBackup>} ppBackup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdir-getbackup
     */
    GetBackup(bstrID, ppBackup) {
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID

        result := ComCall(8, this, "ptr", bstrID, "ptr*", ppBackup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @param {Pointer<IGPMBackupCollection>} ppIGPMBackupCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackupdir-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria, ppIGPMBackupCollection) {
        result := ComCall(9, this, "ptr", pIGPMSearchCriteria, "ptr*", ppIGPMBackupCollection, "HRESULT")
        return result
    }
}

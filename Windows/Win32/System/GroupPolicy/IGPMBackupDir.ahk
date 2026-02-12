#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMBackup.ahk
#Include .\IGPMBackupCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackupDir interface supports methods that allow you to query GPMBackup and GPMBackupCollection objects when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nn-gpmgmt-igpmbackupdir
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
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the GPMBackup object that has the specified backup ID (GUID). The backup ID is the ID of the backed-up GPO, not the ID of the GPO.
     * @param {BSTR} bstrID ID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> object to open.
     * @returns {IGPMBackup} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> interface for the specified ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmbackupdir-getbackup
     */
    GetBackup(bstrID) {
        if(bstrID is String) {
            pin := BSTR.Alloc(bstrID)
            bstrID := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrID, "ptr*", &ppBackup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmbackupdir-searchbackups
     */
    SearchBackups(pIGPMSearchCriteria) {
        result := ComCall(9, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMBackupCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGPMBackupCollection(ppIGPMBackupCollection)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMBackupDirEx.ahk
#Include .\IGPM.ahk

/**
 * The IGPM2 interface extends the GPMBackupDir and InitializeReporting methods of the IGPM interface of the Group Policy Management Console (GPMC).
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpm2
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPM2 extends IGPM{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPM2
     * @type {Guid}
     */
    static IID => Guid("{00238f8a-3d86-41ac-8f5e-06a6638a634a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBackupDirEx", "InitializeReportingEx"]

    /**
     * For a Group Policy object (GPO), the GetBackupDirEx method creates and returns a GPMBackupDirEx object, which you can use to access a GPMBackup or GPMBackupCollection object.
     * @param {BSTR} bstrBackupDir Required. The name of the file system directory containing the Group Policy object (GPO) backups. Note that the directory must already exist.
     * @param {Integer} backupDirType Determines whether the back up is for a Starter Group Policy object or a Group Policy object.
     * @returns {IGPMBackupDirEx} Address of a pointer to the   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupdirex">IGPMBackupDirEx</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm2-getbackupdirex
     */
    GetBackupDirEx(bstrBackupDir, backupDirType) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir

        result := ComCall(19, this, "ptr", bstrBackupDir, "int", backupDirType, "ptr*", &ppIGPMBackupDirEx := 0, "HRESULT")
        return IGPMBackupDirEx(ppIGPMBackupDirEx)
    }

    /**
     * Sets the location to search for .adm files and the reporting option to determine whether to include comments in the report. This method initializes reporting in an asynchronous manner.
     * @param {BSTR} bstrAdmPath Location to search for .adm files.
     * @param {Integer} reportingOptions 
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm2-initializereportingex
     */
    InitializeReportingEx(bstrAdmPath, reportingOptions) {
        bstrAdmPath := bstrAdmPath is String ? BSTR.Alloc(bstrAdmPath).Value : bstrAdmPath

        result := ComCall(20, this, "ptr", bstrAdmPath, "int", reportingOptions, "HRESULT")
        return result
    }
}

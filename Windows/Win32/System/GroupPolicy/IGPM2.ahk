#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} bstrBackupDir 
     * @param {Integer} backupDirType 
     * @param {Pointer<IGPMBackupDirEx>} ppIGPMBackupDirEx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm2-getbackupdirex
     */
    GetBackupDirEx(bstrBackupDir, backupDirType, ppIGPMBackupDirEx) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir

        result := ComCall(19, this, "ptr", bstrBackupDir, "int", backupDirType, "ptr*", ppIGPMBackupDirEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmPath 
     * @param {Integer} reportingOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm2-initializereportingex
     */
    InitializeReportingEx(bstrAdmPath, reportingOptions) {
        bstrAdmPath := bstrAdmPath is String ? BSTR.Alloc(bstrAdmPath).Value : bstrAdmPath

        result := ComCall(20, this, "ptr", bstrAdmPath, "int", reportingOptions, "HRESULT")
        return result
    }
}

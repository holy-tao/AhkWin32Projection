#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPM.ahk" { IGPM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMBackupType.ahk" { GPMBackupType }
#Import ".\IGPMBackupDirEx.ahk" { IGPMBackupDirEx }

/**
 * The IGPM2 interface extends the GPMBackupDir and InitializeReporting methods of the IGPM interface of the Group Policy Management Console (GPMC).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpm2
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPM2 extends IGPM {
    /**
     * The interface identifier for IGPM2
     * @type {Guid}
     */
    static IID := Guid("{00238f8a-3d86-41ac-8f5e-06a6638a634a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPM2 interfaces
    */
    struct Vtbl extends IGPM.Vtbl {
        GetBackupDirEx        : IntPtr
        InitializeReportingEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPM2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For a Group Policy object (GPO), the GetBackupDirEx method creates and returns a GPMBackupDirEx object, which you can use to access a GPMBackup or GPMBackupCollection object.
     * @param {BSTR} bstrBackupDir Required. The name of the file system directory containing the Group Policy object (GPO) backups. Note that the directory must already exist.
     * @param {GPMBackupType} backupDirType Determines whether the back up is for a Starter Group Policy object or a Group Policy object.
     * @returns {IGPMBackupDirEx} Address of a pointer to the   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupdirex">IGPMBackupDirEx</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm2-getbackupdirex
     */
    GetBackupDirEx(bstrBackupDir, backupDirType) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir

        result := ComCall(19, this, BSTR, bstrBackupDir, GPMBackupType, backupDirType, "ptr*", &ppIGPMBackupDirEx := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm2-initializereportingex
     */
    InitializeReportingEx(bstrAdmPath, reportingOptions) {
        bstrAdmPath := bstrAdmPath is String ? BSTR.Alloc(bstrAdmPath).Value : bstrAdmPath

        result := ComCall(20, this, BSTR, bstrAdmPath, "int", reportingOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPM2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBackupDirEx := CallbackCreate(GetMethod(implObj, "GetBackupDirEx"), flags, 4)
        this.vtbl.InitializeReportingEx := CallbackCreate(GetMethod(implObj, "InitializeReportingEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBackupDirEx)
        CallbackFree(this.vtbl.InitializeReportingEx)
    }
}

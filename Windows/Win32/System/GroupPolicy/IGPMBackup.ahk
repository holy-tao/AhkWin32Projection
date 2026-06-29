#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMBackup interface supports methods that allow you to delete GPMBackup objects and to retrieve various properties of GPMBackup objects.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmbackup
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMBackup extends IDispatch {
    /**
     * The interface identifier for IGPMBackup
     * @type {Guid}
     */
    static IID := Guid("{d8a16a35-3b0d-416b-8d02-4df6f95a7119}")

    /**
     * The class identifier for GPMBackup
     * @type {Guid}
     */
    static CLSID := Guid("{ed1a54b8-5efa-482a-93c0-8ad86f0d68c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMBackup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ID               : IntPtr
        get_GPOID            : IntPtr
        get_GPODomain        : IntPtr
        get_GPODisplayName   : IntPtr
        get_Timestamp        : IntPtr
        get_Comment          : IntPtr
        get_BackupDir        : IntPtr
        Delete               : IntPtr
        GenerateReport       : IntPtr
        GenerateReportToFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMBackup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {BSTR} 
     */
    GPOID {
        get => this.get_GPOID()
    }

    /**
     * @type {BSTR} 
     */
    GPODomain {
        get => this.get_GPODomain()
    }

    /**
     * @type {BSTR} 
     */
    GPODisplayName {
        get => this.get_GPODisplayName()
    }

    /**
     * @type {Float} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {BSTR} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * @type {BSTR} 
     */
    BackupDir {
        get => this.get_BackupDir()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPOID() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPODomain() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPODisplayName() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Timestamp() {
        result := ComCall(11, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Comment() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BackupDir() {
        pVal := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Removes the Group Policy object (GPO) backup from the backup directory and from the file system.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-delete
     */
    Delete() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Gets the report for the backup Group Policy object (GPO).
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface. If <i>pvarGPMProgress</i> is <b>NULL</b>, the call to <b>GenerateReport</b> is handled synchronously. If  not <b>NULL</b>, the call to <b>GenerateReport</b> is handled asynchronously, and <i>pvarGPMCancel</i> returns a pointer to    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> .
     * @param {Pointer<VARIANT>} pvarGPMCancel Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface. A value for this parameter is returned only when <i>pvarGPMProgress</i> is specified and is not <b>NULL</b>.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Result</b> property contains  a string of XML or HTML. The <b>Status</b> property contains a reference to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(15, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The GenerateReportToFile method gets the report for the backup Group Policy object (GPO) and then saves the report to a file in a specified path.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path of the file in which the report is being saved. Use a null-terminated string.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereporttofile
     */
    GenerateReportToFile(_gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(16, this, GPMReportType, _gpmReportType, BSTR, bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    Query(iid) {
        if (IGPMBackup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_GPOID := CallbackCreate(GetMethod(implObj, "get_GPOID"), flags, 2)
        this.vtbl.get_GPODomain := CallbackCreate(GetMethod(implObj, "get_GPODomain"), flags, 2)
        this.vtbl.get_GPODisplayName := CallbackCreate(GetMethod(implObj, "get_GPODisplayName"), flags, 2)
        this.vtbl.get_Timestamp := CallbackCreate(GetMethod(implObj, "get_Timestamp"), flags, 2)
        this.vtbl.get_Comment := CallbackCreate(GetMethod(implObj, "get_Comment"), flags, 2)
        this.vtbl.get_BackupDir := CallbackCreate(GetMethod(implObj, "get_BackupDir"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.GenerateReportToFile := CallbackCreate(GetMethod(implObj, "GenerateReportToFile"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_GPOID)
        CallbackFree(this.vtbl.get_GPODomain)
        CallbackFree(this.vtbl.get_GPODisplayName)
        CallbackFree(this.vtbl.get_Timestamp)
        CallbackFree(this.vtbl.get_Comment)
        CallbackFree(this.vtbl.get_BackupDir)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.GenerateReportToFile)
    }
}

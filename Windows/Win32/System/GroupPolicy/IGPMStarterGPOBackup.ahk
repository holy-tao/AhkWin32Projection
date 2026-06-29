#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\GPMStarterGPOType.ahk" { GPMStarterGPOType }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMStarterGPOBackup interface supports methods that allow you to delete GPMStarterGPOBackup objects and to retrieve various properties of GPMStarterGPOBackup objects.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstartergpobackup
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMStarterGPOBackup extends IDispatch {
    /**
     * The interface identifier for IGPMStarterGPOBackup
     * @type {Guid}
     */
    static IID := Guid("{51d98eda-a87e-43dd-b80a-0b66ef1938d6}")

    /**
     * The class identifier for GPMStarterGPOBackup
     * @type {Guid}
     */
    static CLSID := Guid("{389e400a-d8ef-455b-a861-5f9ca34a6a02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMStarterGPOBackup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BackupDir        : IntPtr
        get_Comment          : IntPtr
        get_DisplayName      : IntPtr
        get_Domain           : IntPtr
        get_StarterGPOID     : IntPtr
        get_ID               : IntPtr
        get_Timestamp        : IntPtr
        get_Type             : IntPtr
        Delete               : IntPtr
        GenerateReport       : IntPtr
        GenerateReportToFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMStarterGPOBackup.Vtbl()
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
     * @type {BSTR} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {BSTR} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * @type {BSTR} 
     */
    StarterGPOID {
        get => this.get_StarterGPOID()
    }

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {Float} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {GPMStarterGPOType} 
     */
    Type {
        get => this.get_Type()
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
     * @returns {BSTR} 
     */
    get_Comment() {
        pbstrComment := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrComment, "HRESULT")
        return pbstrComment
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pbstrDisplayName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Domain() {
        pbstrTemplateDomain := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrTemplateDomain, "HRESULT")
        return pbstrTemplateDomain
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StarterGPOID() {
        pbstrTemplateID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrTemplateID, "HRESULT")
        return pbstrTemplateID
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pbstrID := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrID, "HRESULT")
        return pbstrID
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Timestamp() {
        result := ComCall(13, this, "double*", &pTimestamp := 0, "HRESULT")
        return pTimestamp
    }

    /**
     * 
     * @returns {GPMStarterGPOType} 
     */
    get_Type() {
        result := ComCall(14, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Removes the Starter GPO backup from the backup directory, and from the file system.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The GenerateReport method gets the report for the backup GPO.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface. If <i>pvarGPMProgress</i> is null, the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport">GenerateReport</a> is handled synchronously. If  not null, the call to <b>GenerateReport</b> is handled asynchronously and <i>pvarGPMCancel</i> returns a pointer to   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a>.
     * @param {Pointer<VARIANT>} pvarGPMCancel Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface. A value for this parameter is returned only when <i>pvarGPMProgress</i> is specified and is not null.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a>. The Result property contains  a string of XML or HTML. The Status property contains a reference to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereport
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(16, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The GenerateReportToFile gets the report for the backup Starter GPO and saves it to a file at a specified path.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path to the file where the report is being saved. Use null-terminated string.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereporttofile
     */
    GenerateReportToFile(_gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(17, this, GPMReportType, _gpmReportType, BSTR, bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    Query(iid) {
        if (IGPMStarterGPOBackup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BackupDir := CallbackCreate(GetMethod(implObj, "get_BackupDir"), flags, 2)
        this.vtbl.get_Comment := CallbackCreate(GetMethod(implObj, "get_Comment"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_Domain := CallbackCreate(GetMethod(implObj, "get_Domain"), flags, 2)
        this.vtbl.get_StarterGPOID := CallbackCreate(GetMethod(implObj, "get_StarterGPOID"), flags, 2)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_Timestamp := CallbackCreate(GetMethod(implObj, "get_Timestamp"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.GenerateReportToFile := CallbackCreate(GetMethod(implObj, "GenerateReportToFile"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BackupDir)
        CallbackFree(this.vtbl.get_Comment)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_Domain)
        CallbackFree(this.vtbl.get_StarterGPOID)
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_Timestamp)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.GenerateReportToFile)
    }
}

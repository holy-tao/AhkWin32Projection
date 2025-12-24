#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStarterGPOBackup interface supports methods that allow you to delete GPMStarterGPOBackup objects and to retrieve various properties of GPMStarterGPOBackup objects.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmstartergpobackup
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStarterGPOBackup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStarterGPOBackup
     * @type {Guid}
     */
    static IID => Guid("{51d98eda-a87e-43dd-b80a-0b66ef1938d6}")

    /**
     * The class identifier for GPMStarterGPOBackup
     * @type {Guid}
     */
    static CLSID => Guid("{389e400a-d8ef-455b-a861-5f9ca34a6a02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackupDir", "get_Comment", "get_DisplayName", "get_Domain", "get_StarterGPOID", "get_ID", "get_Timestamp", "get_Type", "Delete", "GenerateReport", "GenerateReportToFile"]

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
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

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
     * @returns {BSTR} 
     */
    get_Comment() {
        pbstrComment := BSTR()
        result := ComCall(8, this, "ptr", pbstrComment, "HRESULT")
        return pbstrComment
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pbstrDisplayName := BSTR()
        result := ComCall(9, this, "ptr", pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Domain() {
        pbstrTemplateDomain := BSTR()
        result := ComCall(10, this, "ptr", pbstrTemplateDomain, "HRESULT")
        return pbstrTemplateDomain
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StarterGPOID() {
        pbstrTemplateID := BSTR()
        result := ComCall(11, this, "ptr", pbstrTemplateID, "HRESULT")
        return pbstrTemplateID
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pbstrID := BSTR()
        result := ComCall(12, this, "ptr", pbstrID, "HRESULT")
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
     * @returns {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmstartergpobackup-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The GenerateReport method gets the report for the backup GPO.
     * @param {Integer} gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface. If <i>pvarGPMProgress</i> is null, the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport">GenerateReport</a> is handled synchronously. If  not null, the call to <b>GenerateReport</b> is handled asynchronously and <i>pvarGPMCancel</i> returns a pointer to   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a>.
     * @param {Pointer<VARIANT>} pvarGPMCancel Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface. A value for this parameter is returned only when <i>pvarGPMProgress</i> is specified and is not null.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a>. The Result property contains  a string of XML or HTML. The Status property contains a reference to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(16, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The GenerateReportToFile gets the report for the backup Starter GPO and saves it to a file at a specified path.
     * @param {Integer} gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path to the file where the report is being saved. Use null-terminated string.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(17, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }
}

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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(16, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(17, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }
}

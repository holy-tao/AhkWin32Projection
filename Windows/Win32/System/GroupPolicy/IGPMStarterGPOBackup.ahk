#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} pbstrBackupDir 
     * @returns {HRESULT} 
     */
    get_BackupDir(pbstrBackupDir) {
        result := ComCall(7, this, "ptr", pbstrBackupDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrComment 
     * @returns {HRESULT} 
     */
    get_Comment(pbstrComment) {
        result := ComCall(8, this, "ptr", pbstrComment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pbstrDisplayName) {
        result := ComCall(9, this, "ptr", pbstrDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTemplateDomain 
     * @returns {HRESULT} 
     */
    get_Domain(pbstrTemplateDomain) {
        result := ComCall(10, this, "ptr", pbstrTemplateDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTemplateID 
     * @returns {HRESULT} 
     */
    get_StarterGPOID(pbstrTemplateID) {
        result := ComCall(11, this, "ptr", pbstrTemplateID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrID 
     * @returns {HRESULT} 
     */
    get_ID(pbstrID) {
        result := ComCall(12, this, "ptr", pbstrID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pTimestamp 
     * @returns {HRESULT} 
     */
    get_Timestamp(pTimestamp) {
        result := ComCall(13, this, "double*", pTimestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(14, this, "int*", pType, "HRESULT")
        return result
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
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(16, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackup-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(17, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }
}

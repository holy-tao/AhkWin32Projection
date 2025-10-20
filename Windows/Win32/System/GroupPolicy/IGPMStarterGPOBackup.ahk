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
     * 
     * @param {Pointer<BSTR>} pbstrBackupDir 
     * @returns {HRESULT} 
     */
    get_BackupDir(pbstrBackupDir) {
        result := ComCall(7, this, "ptr", pbstrBackupDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrComment 
     * @returns {HRESULT} 
     */
    get_Comment(pbstrComment) {
        result := ComCall(8, this, "ptr", pbstrComment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pbstrDisplayName) {
        result := ComCall(9, this, "ptr", pbstrDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTemplateDomain 
     * @returns {HRESULT} 
     */
    get_Domain(pbstrTemplateDomain) {
        result := ComCall(10, this, "ptr", pbstrTemplateDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTemplateID 
     * @returns {HRESULT} 
     */
    get_StarterGPOID(pbstrTemplateID) {
        result := ComCall(11, this, "ptr", pbstrTemplateID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrID 
     * @returns {HRESULT} 
     */
    get_ID(pbstrID) {
        result := ComCall(12, this, "ptr", pbstrID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTimestamp 
     * @returns {HRESULT} 
     */
    get_Timestamp(pTimestamp) {
        result := ComCall(13, this, "double*", pTimestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(14, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(16, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(17, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

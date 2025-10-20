#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMBackup interface supports methods that allow you to delete GPMBackup objects and to retrieve various properties of GPMBackup objects.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmbackup
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMBackup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMBackup
     * @type {Guid}
     */
    static IID => Guid("{d8a16a35-3b0d-416b-8d02-4df6f95a7119}")

    /**
     * The class identifier for GPMBackup
     * @type {Guid}
     */
    static CLSID => Guid("{ed1a54b8-5efa-482a-93c0-8ad86f0d68c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ID", "get_GPOID", "get_GPODomain", "get_GPODisplayName", "get_Timestamp", "get_Comment", "get_BackupDir", "Delete", "GenerateReport", "GenerateReportToFile"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ID(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_GPOID(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_GPODomain(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_GPODisplayName(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Timestamp(pVal) {
        result := ComCall(11, this, "double*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Comment(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_BackupDir(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-delete
     */
    Delete() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(15, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(16, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }
}

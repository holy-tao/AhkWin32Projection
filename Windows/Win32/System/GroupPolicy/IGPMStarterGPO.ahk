#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStarterGPO interface supports methods that enable you to manage Starter Group Policy Objects (GPOs) in the directory service.
 * @remarks
 * 
  * The <b>GPMStarterGPO</b> object is analogous to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">GPMGPO2</a> object. The <b>GPMStarterGPO</b> object represents a single instance of a Starter Group Policy object (GPO).
  * 
  * The <b>IGPMStarterGPO</b> interface has three properties that do not have a counterpart in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">IGPMGPO2</a> interface.
  * 
  * <ul>
  * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Author</a> property contains the name of who created the Template.  This attribute is applicable to System Templates.  For custom Templates this attribute will be blank.  This attribute is read-only.</li>
  * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Product</a> 
  *      property contains the name of the product that the Template is designed to manage.  For example a Template might ship to configure MS Office.  This attribute is applicable to System Templates.  For custom Templates this attribute will be blank.  This attribute is read-only.</li>
  * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Type</a> 
  *      property is an enum value,  <a href="https://docs.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmstartergpotype">GPMStarterGPOType</a>, that specifies the type of the attribute.  The Type may be either a system  Starter Group Policy object or a custom Starter Group Policy object.</li>
  * </ul>
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmstartergpo-save">Save</a> method has no corresponding method in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">IGPMGPO2</a> interface.  The <b>Save</b> method will generate a CAB file containing all the contents of a single Starter GPO.  The objective of this method is to allow a user to save a Starter GPO in a form that can be easily redistributed. There is no way to create a CAB file containing multiple Starter GPOs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmstartergpo
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStarterGPO extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStarterGPO
     * @type {Guid}
     */
    static IID => Guid("{dfc3f61b-8880-4490-9337-d29c7ba8c2f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Description", "put_Description", "get_Author", "get_Product", "get_CreationTime", "get_ID", "get_ModifiedTime", "get_Type", "get_ComputerVersion", "get_UserVersion", "get_StarterGPOVersion", "Delete", "Save", "Backup", "CopyTo", "GenerateReport", "GenerateReportToFile", "GetSecurityInfo", "SetSecurityInfo"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DisplayName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DisplayName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Description(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Description(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Author(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Product(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_CreationTime(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ID(pVal) {
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_ModifiedTime(pVal) {
        pValMarshal := pVal is VarRef ? "double*" : "ptr"

        result := ComCall(15, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_Type(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ComputerVersion(pVal) {
        pValMarshal := pVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(17, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UserVersion(pVal) {
        pValMarshal := pVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(18, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_StarterGPOVersion(pVal) {
        result := ComCall(19, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-delete
     */
    Delete() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSaveFile 
     * @param {VARIANT_BOOL} bOverwrite 
     * @param {VARIANT_BOOL} bSaveAsSystem 
     * @param {Pointer<VARIANT>} bstrLanguage 
     * @param {Pointer<VARIANT>} bstrAuthor 
     * @param {Pointer<VARIANT>} bstrProduct 
     * @param {Pointer<VARIANT>} bstrUniqueID 
     * @param {Pointer<VARIANT>} bstrVersion 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-save
     */
    Save(bstrSaveFile, bOverwrite, bSaveAsSystem, bstrLanguage, bstrAuthor, bstrProduct, bstrUniqueID, bstrVersion, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrSaveFile := bstrSaveFile is String ? BSTR.Alloc(bstrSaveFile).Value : bstrSaveFile

        result := ComCall(21, this, "ptr", bstrSaveFile, "short", bOverwrite, "short", bSaveAsSystem, "ptr", bstrLanguage, "ptr", bstrAuthor, "ptr", bstrProduct, "ptr", bstrUniqueID, "ptr", bstrVersion, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupDir 
     * @param {BSTR} bstrComment 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-backup
     */
    Backup(bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir
        bstrComment := bstrComment is String ? BSTR.Alloc(bstrComment).Value : bstrComment

        result := ComCall(22, this, "ptr", bstrBackupDir, "ptr", bstrComment, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNewDisplayName 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-copyto
     */
    CopyTo(pvarNewDisplayName, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(23, this, "ptr", pvarNewDisplayName, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(24, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(25, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by a handle.
     * @param {Pointer<IGPMSecurityInfo>} ppSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-getsecurityinfo
     */
    GetSecurityInfo(ppSecurityInfo) {
        result := ComCall(26, this, "ptr*", ppSecurityInfo, "HRESULT")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @param {IGPMSecurityInfo} pSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(27, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }
}

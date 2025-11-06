#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmObject.ahk

/**
 * Defines a module that is used to classify files or store and retrieve properties from files.
 * @remarks
 * 
  * The name and module type identify a unique module (a classifier module and storage module can use the same 
  *     name).
  * 
  * When de-registering a module programmatically (calling 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-delete">Delete</a> followed by 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">Commit</a>), the developer should ensure that there are no 
  *     active classification rules that use that module. If this is not properly performed, the rules will produce errors 
  *     during classification runs and the UI will reflect a module that is no longer available.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPipelineModuleDefinition extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPipelineModuleDefinition
     * @type {Guid}
     */
    static IID => Guid("{515c1277-2c81-440e-8fcf-367921ed4f59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModuleClsid", "put_ModuleClsid", "get_Name", "put_Name", "get_Company", "put_Company", "get_Version", "put_Version", "get_ModuleType", "get_Enabled", "put_Enabled", "get_NeedsFileContent", "put_NeedsFileContent", "get_Account", "put_Account", "get_SupportedExtensions", "put_SupportedExtensions", "get_Parameters", "put_Parameters"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduleclsid
     */
    get_ModuleClsid() {
        moduleClsid := BSTR()
        result := ComCall(12, this, "ptr", moduleClsid, "HRESULT")
        return moduleClsid
    }

    /**
     * 
     * @param {BSTR} moduleClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_moduleclsid
     */
    put_ModuleClsid(moduleClsid) {
        moduleClsid := moduleClsid is String ? BSTR.Alloc(moduleClsid).Value : moduleClsid

        result := ComCall(13, this, "ptr", moduleClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(14, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(15, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_company
     */
    get_Company() {
        company := BSTR()
        result := ComCall(16, this, "ptr", company, "HRESULT")
        return company
    }

    /**
     * 
     * @param {BSTR} company 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_company
     */
    put_Company(company) {
        company := company is String ? BSTR.Alloc(company).Value : company

        result := ComCall(17, this, "ptr", company, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_version
     */
    get_Version() {
        version := BSTR()
        result := ComCall(18, this, "ptr", version, "HRESULT")
        return version
    }

    /**
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_version
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(19, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduletype
     */
    get_ModuleType() {
        result := ComCall(20, this, "int*", &moduleType := 0, "HRESULT")
        return moduleType
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_enabled
     */
    get_Enabled() {
        result := ComCall(21, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(22, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_needsfilecontent
     */
    get_NeedsFileContent() {
        result := ComCall(23, this, "short*", &needsFileContent := 0, "HRESULT")
        return needsFileContent
    }

    /**
     * 
     * @param {VARIANT_BOOL} needsFileContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_needsfilecontent
     */
    put_NeedsFileContent(needsFileContent) {
        result := ComCall(24, this, "short", needsFileContent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_account
     */
    get_Account() {
        result := ComCall(25, this, "int*", &retrievalAccount := 0, "HRESULT")
        return retrievalAccount
    }

    /**
     * 
     * @param {Integer} retrievalAccount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_account
     */
    put_Account(retrievalAccount) {
        result := ComCall(26, this, "int", retrievalAccount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_supportedextensions
     */
    get_SupportedExtensions() {
        result := ComCall(27, this, "ptr*", &supportedExtensions := 0, "HRESULT")
        return supportedExtensions
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} supportedExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_supportedextensions
     */
    put_SupportedExtensions(supportedExtensions) {
        result := ComCall(28, this, "ptr", supportedExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_parameters
     */
    get_Parameters() {
        result := ComCall(29, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(30, this, "ptr", parameters, "HRESULT")
        return result
    }
}

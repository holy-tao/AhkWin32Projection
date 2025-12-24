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
     * @type {BSTR} 
     */
    ModuleClsid {
        get => this.get_ModuleClsid()
        set => this.put_ModuleClsid(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Company {
        get => this.get_Company()
        set => this.put_Company(value)
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {Integer} 
     */
    ModuleType {
        get => this.get_ModuleType()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NeedsFileContent {
        get => this.get_NeedsFileContent()
        set => this.put_NeedsFileContent(value)
    }

    /**
     * @type {Integer} 
     */
    Account {
        get => this.get_Account()
        set => this.put_Account(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedExtensions {
        get => this.get_SupportedExtensions()
        set => this.put_SupportedExtensions(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * A string representation specifying the COM class identifier for the class that implements the module defined by this module definition.
     * @remarks
     * 
     * Note that the COM class  identifier specified must refer to a class that implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation">IFsrmPipelineModuleImplementation</a>, which is inherited though <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduleimplementation">IFsrmClassifierModuleImplementation</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation">IFsrmStorageModuleImplementation</a>, depending on the type of module.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduleclsid
     */
    get_ModuleClsid() {
        moduleClsid := BSTR()
        result := ComCall(12, this, "ptr", moduleClsid, "HRESULT")
        return moduleClsid
    }

    /**
     * A string representation specifying the COM class identifier for the class that implements the module defined by this module definition.
     * @remarks
     * 
     * Note that the COM class  identifier specified must refer to a class that implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation">IFsrmPipelineModuleImplementation</a>, which is inherited though <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduleimplementation">IFsrmClassifierModuleImplementation</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation">IFsrmStorageModuleImplementation</a>, depending on the type of module.
     * 
     * 
     * @param {BSTR} moduleClsid 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_moduleclsid
     */
    put_ModuleClsid(moduleClsid) {
        moduleClsid := moduleClsid is String ? BSTR.Alloc(moduleClsid).Value : moduleClsid

        result := ComCall(13, this, "ptr", moduleClsid, "HRESULT")
        return result
    }

    /**
     * The name of the module definition.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(14, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * The name of the module definition.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(15, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * The name of the company that created the classification or storage module.
     * @remarks
     * 
     * This property is optional.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_company
     */
    get_Company() {
        company := BSTR()
        result := ComCall(16, this, "ptr", company, "HRESULT")
        return company
    }

    /**
     * The name of the company that created the classification or storage module.
     * @remarks
     * 
     * This property is optional.
     * 
     * 
     * @param {BSTR} company 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_company
     */
    put_Company(company) {
        company := company is String ? BSTR.Alloc(company).Value : company

        result := ComCall(17, this, "ptr", company, "HRESULT")
        return result
    }

    /**
     * The version of the module definition.
     * @remarks
     * 
     * This property is optional. There is no restriction to the version's format.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_version
     */
    get_Version() {
        version := BSTR()
        result := ComCall(18, this, "ptr", version, "HRESULT")
        return version
    }

    /**
     * The version of the module definition.
     * @remarks
     * 
     * This property is optional. There is no restriction to the version's format.
     * 
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_version
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(19, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * The type of module.
     * @remarks
     * 
     * The type is specified when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createmoduledefinition">IFsrmClassificationModule::CreateModuleDefinition</a> method to create the module definition object.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduletype
     */
    get_ModuleType() {
        result := ComCall(20, this, "int*", &moduleType := 0, "HRESULT")
        return moduleType
    }

    /**
     * Determines whether the module is enabled.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_enabled
     */
    get_Enabled() {
        result := ComCall(21, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Determines whether the module is enabled.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(22, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Determines whether the module needs to read the contents of the file.
     * @remarks
     * 
     * If the 
     *     <b>NeedsFileContent</b> property 
     *     value is <b>VARIANT_TRUE</b>, FSRM will provide a stream for a file's contents to the module. 
     *     This may be necessary if a classification module needs to analyze the contents of the file to determine the 
     *     property values or if a storage module handles property values embedded in the file's contents
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_needsfilecontent
     */
    get_NeedsFileContent() {
        result := ComCall(23, this, "short*", &needsFileContent := 0, "HRESULT")
        return needsFileContent
    }

    /**
     * Determines whether the module needs to read the contents of the file.
     * @remarks
     * 
     * If the 
     *     <b>NeedsFileContent</b> property 
     *     value is <b>VARIANT_TRUE</b>, FSRM will provide a stream for a file's contents to the module. 
     *     This may be necessary if a classification module needs to analyze the contents of the file to determine the 
     *     property values or if a storage module handles property values embedded in the file's contents
     * 
     * 
     * @param {VARIANT_BOOL} needsFileContent 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_needsfilecontent
     */
    put_NeedsFileContent(needsFileContent) {
        result := ComCall(24, this, "short", needsFileContent, "HRESULT")
        return result
    }

    /**
     * The account to use when running the module.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_account
     */
    get_Account() {
        result := ComCall(25, this, "int*", &retrievalAccount := 0, "HRESULT")
        return retrievalAccount
    }

    /**
     * The account to use when running the module.
     * @param {Integer} retrievalAccount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_account
     */
    put_Account(retrievalAccount) {
        result := ComCall(26, this, "int", retrievalAccount, "HRESULT")
        return result
    }

    /**
     * The list of file extensions supported by this module.
     * @remarks
     * 
     * This property is optional. Set this property only if you support a limited number of file types. FSRM uses the 
     *     list of extensions to determine the files that it sends to the module. If the list is empty, FSRM will send the 
     *     module all files.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_supportedextensions
     */
    get_SupportedExtensions() {
        result := ComCall(27, this, "ptr*", &supportedExtensions := 0, "HRESULT")
        return supportedExtensions
    }

    /**
     * The list of file extensions supported by this module.
     * @remarks
     * 
     * This property is optional. Set this property only if you support a limited number of file types. FSRM uses the 
     *     list of extensions to determine the files that it sends to the module. If the list is empty, FSRM will send the 
     *     module all files.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} supportedExtensions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_supportedextensions
     */
    put_SupportedExtensions(supportedExtensions) {
        result := ComCall(28, this, "ptr", supportedExtensions, "HRESULT")
        return result
    }

    /**
     * The optional parameters to pass to the module.
     * @remarks
     * 
     * There is no limit to length of the parameter name or value, nor is there a limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * The parameters are included in the module definition that FSRM passes to the module's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> implementation.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_parameters
     */
    get_Parameters() {
        result := ComCall(29, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The optional parameters to pass to the module.
     * @remarks
     * 
     * There is no limit to length of the parameter name or value, nor is there a limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * The parameters are included in the module definition that FSRM passes to the module's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> implementation.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(30, this, "ptr", parameters, "HRESULT")
        return result
    }
}

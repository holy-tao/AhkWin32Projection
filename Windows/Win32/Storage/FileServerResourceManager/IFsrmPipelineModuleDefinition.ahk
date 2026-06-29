#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import ".\FsrmAccountType.ahk" { FsrmAccountType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmPipelineModuleType.ahk" { FsrmPipelineModuleType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Defines a module that is used to classify files or store and retrieve properties from files.
 * @remarks
 * The name and module type identify a unique module (a classifier module and storage module can use the same 
 *     name).
 * 
 * When de-registering a module programmatically (calling 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-delete">Delete</a> followed by 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">Commit</a>), the developer should ensure that there are no 
 *     active classification rules that use that module. If this is not properly performed, the rules will produce errors 
 *     during classification runs and the UI will reflect a module that is no longer available.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPipelineModuleDefinition extends IFsrmObject {
    /**
     * The interface identifier for IFsrmPipelineModuleDefinition
     * @type {Guid}
     */
    static IID := Guid("{515c1277-2c81-440e-8fcf-367921ed4f59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPipelineModuleDefinition interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_ModuleClsid         : IntPtr
        put_ModuleClsid         : IntPtr
        get_Name                : IntPtr
        put_Name                : IntPtr
        get_Company             : IntPtr
        put_Company             : IntPtr
        get_Version             : IntPtr
        put_Version             : IntPtr
        get_ModuleType          : IntPtr
        get_Enabled             : IntPtr
        put_Enabled             : IntPtr
        get_NeedsFileContent    : IntPtr
        put_NeedsFileContent    : IntPtr
        get_Account             : IntPtr
        put_Account             : IntPtr
        get_SupportedExtensions : IntPtr
        put_SupportedExtensions : IntPtr
        get_Parameters          : IntPtr
        put_Parameters          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPipelineModuleDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {FsrmPipelineModuleType} 
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
     * @type {FsrmAccountType} 
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
     * A string representation specifying the COM class identifier for the class that implements the module defined by this module definition. (Get)
     * @remarks
     * Note that the COM class  identifier specified must refer to a class that implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation">IFsrmPipelineModuleImplementation</a>, which is inherited though <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduleimplementation">IFsrmClassifierModuleImplementation</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation">IFsrmStorageModuleImplementation</a>, depending on the type of module.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduleclsid
     */
    get_ModuleClsid() {
        moduleClsid := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, moduleClsid, "HRESULT")
        return moduleClsid
    }

    /**
     * A string representation specifying the COM class identifier for the class that implements the module defined by this module definition. (Put)
     * @remarks
     * Note that the COM class  identifier specified must refer to a class that implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduleimplementation">IFsrmPipelineModuleImplementation</a>, which is inherited though <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduleimplementation">IFsrmClassifierModuleImplementation</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmstoragemoduleimplementation">IFsrmStorageModuleImplementation</a>, depending on the type of module.
     * @param {BSTR} moduleClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_moduleclsid
     */
    put_ModuleClsid(moduleClsid) {
        moduleClsid := moduleClsid is String ? BSTR.Alloc(moduleClsid).Value : moduleClsid

        result := ComCall(13, this, BSTR, moduleClsid, "HRESULT")
        return result
    }

    /**
     * The name of the module definition. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The name of the module definition. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(15, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * The name of the company that created the classification or storage module. (Get)
     * @remarks
     * This property is optional.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_company
     */
    get_Company() {
        company := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, company, "HRESULT")
        return company
    }

    /**
     * The name of the company that created the classification or storage module. (Put)
     * @remarks
     * This property is optional.
     * @param {BSTR} company 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_company
     */
    put_Company(company) {
        company := company is String ? BSTR.Alloc(company).Value : company

        result := ComCall(17, this, BSTR, company, "HRESULT")
        return result
    }

    /**
     * The version of the module definition. (Get)
     * @remarks
     * This property is optional. There is no restriction to the version's format.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_version
     */
    get_Version() {
        _version := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, _version, "HRESULT")
        return _version
    }

    /**
     * The version of the module definition. (Put)
     * @remarks
     * This property is optional. There is no restriction to the version's format.
     * @param {BSTR} _version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_version
     */
    put_Version(_version) {
        _version := _version is String ? BSTR.Alloc(_version).Value : _version

        result := ComCall(19, this, BSTR, _version, "HRESULT")
        return result
    }

    /**
     * The type of module.
     * @remarks
     * The type is specified when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createmoduledefinition">IFsrmClassificationModule::CreateModuleDefinition</a> method to create the module definition object.
     * @returns {FsrmPipelineModuleType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduletype
     */
    get_ModuleType() {
        result := ComCall(20, this, "int*", &moduleType := 0, "HRESULT")
        return moduleType
    }

    /**
     * Determines whether the module is enabled. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_enabled
     */
    get_Enabled() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Determines whether the module is enabled. (Put)
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(22, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Determines whether the module needs to read the contents of the file. (Get)
     * @remarks
     * If the 
     *     <b>NeedsFileContent</b> property 
     *     value is <b>VARIANT_TRUE</b>, FSRM will provide a stream for a file's contents to the module. 
     *     This may be necessary if a classification module needs to analyze the contents of the file to determine the 
     *     property values or if a storage module handles property values embedded in the file's contents
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_needsfilecontent
     */
    get_NeedsFileContent() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &needsFileContent := 0, "HRESULT")
        return needsFileContent
    }

    /**
     * Determines whether the module needs to read the contents of the file. (Put)
     * @remarks
     * If the 
     *     <b>NeedsFileContent</b> property 
     *     value is <b>VARIANT_TRUE</b>, FSRM will provide a stream for a file's contents to the module. 
     *     This may be necessary if a classification module needs to analyze the contents of the file to determine the 
     *     property values or if a storage module handles property values embedded in the file's contents
     * @param {VARIANT_BOOL} needsFileContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_needsfilecontent
     */
    put_NeedsFileContent(needsFileContent) {
        result := ComCall(24, this, VARIANT_BOOL, needsFileContent, "HRESULT")
        return result
    }

    /**
     * The account to use when running the module. (Get)
     * @returns {FsrmAccountType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_account
     */
    get_Account() {
        result := ComCall(25, this, "int*", &retrievalAccount := 0, "HRESULT")
        return retrievalAccount
    }

    /**
     * The account to use when running the module. (Put)
     * @param {FsrmAccountType} retrievalAccount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_account
     */
    put_Account(retrievalAccount) {
        result := ComCall(26, this, FsrmAccountType, retrievalAccount, "HRESULT")
        return result
    }

    /**
     * The list of file extensions supported by this module. (Get)
     * @remarks
     * This property is optional. Set this property only if you support a limited number of file types. FSRM uses the 
     *     list of extensions to determine the files that it sends to the module. If the list is empty, FSRM will send the 
     *     module all files.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_supportedextensions
     */
    get_SupportedExtensions() {
        result := ComCall(27, this, "ptr*", &supportedExtensions := 0, "HRESULT")
        return supportedExtensions
    }

    /**
     * The list of file extensions supported by this module. (Put)
     * @remarks
     * This property is optional. Set this property only if you support a limited number of file types. FSRM uses the 
     *     list of extensions to determine the files that it sends to the module. If the list is empty, FSRM will send the 
     *     module all files.
     * @param {Pointer<SAFEARRAY>} supportedExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_supportedextensions
     */
    put_SupportedExtensions(supportedExtensions) {
        result := ComCall(28, this, SAFEARRAY.Ptr, supportedExtensions, "HRESULT")
        return result
    }

    /**
     * The optional parameters to pass to the module. (Get)
     * @remarks
     * There is no limit to length of the parameter name or value, nor is there a limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * The parameters are included in the module definition that FSRM passes to the module's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> implementation.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_parameters
     */
    get_Parameters() {
        result := ComCall(29, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The optional parameters to pass to the module. (Put)
     * @remarks
     * There is no limit to length of the parameter name or value, nor is there a limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * The parameters are included in the module definition that FSRM passes to the module's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> implementation.
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(30, this, SAFEARRAY.Ptr, parameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmPipelineModuleDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ModuleClsid := CallbackCreate(GetMethod(implObj, "get_ModuleClsid"), flags, 2)
        this.vtbl.put_ModuleClsid := CallbackCreate(GetMethod(implObj, "put_ModuleClsid"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Company := CallbackCreate(GetMethod(implObj, "get_Company"), flags, 2)
        this.vtbl.put_Company := CallbackCreate(GetMethod(implObj, "put_Company"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.put_Version := CallbackCreate(GetMethod(implObj, "put_Version"), flags, 2)
        this.vtbl.get_ModuleType := CallbackCreate(GetMethod(implObj, "get_ModuleType"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_NeedsFileContent := CallbackCreate(GetMethod(implObj, "get_NeedsFileContent"), flags, 2)
        this.vtbl.put_NeedsFileContent := CallbackCreate(GetMethod(implObj, "put_NeedsFileContent"), flags, 2)
        this.vtbl.get_Account := CallbackCreate(GetMethod(implObj, "get_Account"), flags, 2)
        this.vtbl.put_Account := CallbackCreate(GetMethod(implObj, "put_Account"), flags, 2)
        this.vtbl.get_SupportedExtensions := CallbackCreate(GetMethod(implObj, "get_SupportedExtensions"), flags, 2)
        this.vtbl.put_SupportedExtensions := CallbackCreate(GetMethod(implObj, "put_SupportedExtensions"), flags, 2)
        this.vtbl.get_Parameters := CallbackCreate(GetMethod(implObj, "get_Parameters"), flags, 2)
        this.vtbl.put_Parameters := CallbackCreate(GetMethod(implObj, "put_Parameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ModuleClsid)
        CallbackFree(this.vtbl.put_ModuleClsid)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Company)
        CallbackFree(this.vtbl.put_Company)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.put_Version)
        CallbackFree(this.vtbl.get_ModuleType)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_NeedsFileContent)
        CallbackFree(this.vtbl.put_NeedsFileContent)
        CallbackFree(this.vtbl.get_Account)
        CallbackFree(this.vtbl.put_Account)
        CallbackFree(this.vtbl.get_SupportedExtensions)
        CallbackFree(this.vtbl.put_SupportedExtensions)
        CallbackFree(this.vtbl.get_Parameters)
        CallbackFree(this.vtbl.put_Parameters)
    }
}

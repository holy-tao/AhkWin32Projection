#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmRuleType.ahk" { FsrmRuleType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Defines a rule.
 * @remarks
 * The name and rule type properties define a unique rule.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmrule
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmRule extends IFsrmObject {
    /**
     * The interface identifier for IFsrmRule
     * @type {Guid}
     */
    static IID := Guid("{cb0df960-16f5-4495-9079-3f9360d831df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmRule interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_Name                 : IntPtr
        put_Name                 : IntPtr
        get_RuleType             : IntPtr
        get_ModuleDefinitionName : IntPtr
        put_ModuleDefinitionName : IntPtr
        get_NamespaceRoots       : IntPtr
        put_NamespaceRoots       : IntPtr
        get_RuleFlags            : IntPtr
        put_RuleFlags            : IntPtr
        get_Parameters           : IntPtr
        put_Parameters           : IntPtr
        get_LastModified         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {FsrmRuleType} 
     */
    RuleType {
        get => this.get_RuleType()
    }

    /**
     * @type {BSTR} 
     */
    ModuleDefinitionName {
        get => this.get_ModuleDefinitionName()
        set => this.put_ModuleDefinitionName(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    NamespaceRoots {
        get => this.get_NamespaceRoots()
        set => this.put_NamespaceRoots(value)
    }

    /**
     * @type {Integer} 
     */
    RuleFlags {
        get => this.get_RuleFlags()
        set => this.put_RuleFlags(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * @type {VARIANT} 
     */
    LastModified {
        get => this.get_LastModified()
    }

    /**
     * The name of the rule. (Get)
     * @remarks
     * The name must be unique for its type (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype">IFsrmRule.RuleType</a> property).
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The name of the rule. (Put)
     * @remarks
     * The name must be unique for its type (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype">IFsrmRule.RuleType</a> property).
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * The type of the rule.
     * @remarks
     * The rule's type is specified when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createrule">IFsrmClassificationManager::CreateRule</a> method to create the rule.
     * 
     * The name and rule type properties define a unique rule.
     * @returns {FsrmRuleType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype
     */
    get_RuleType() {
        result := ComCall(14, this, "int*", &ruleType := 0, "HRESULT")
        return ruleType
    }

    /**
     * The name of the module definition that you want to run this rule. (Get)
     * @remarks
     * FSRM provides a built-in classifier module named, Folder Classifier. The Folder Classifier classifies files based on their location (in which folder they are located). This classifier looks at the current path of the file and matches it with the path specified in the namespace roots of the classification rule. If the path is within the scope of the rule's namespace roots, then FSRM applies the rule to the file.
     * 
     * To get a list of modules that have been registered with FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions">IFsrmClassificationManager::EnumModuleDefinitions</a> method. To access a module's name, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name">IFsrmPipelineModuleDefinition.Name</a> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_moduledefinitionname
     */
    get_ModuleDefinitionName() {
        moduleDefinitionName := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, moduleDefinitionName, "HRESULT")
        return moduleDefinitionName
    }

    /**
     * The name of the module definition that you want to run this rule. (Put)
     * @remarks
     * FSRM provides a built-in classifier module named, Folder Classifier. The Folder Classifier classifies files based on their location (in which folder they are located). This classifier looks at the current path of the file and matches it with the path specified in the namespace roots of the classification rule. If the path is within the scope of the rule's namespace roots, then FSRM applies the rule to the file.
     * 
     * To get a list of modules that have been registered with FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions">IFsrmClassificationManager::EnumModuleDefinitions</a> method. To access a module's name, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name">IFsrmPipelineModuleDefinition.Name</a> property.
     * @param {BSTR} moduleDefinitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_moduledefinitionname
     */
    put_ModuleDefinitionName(moduleDefinitionName) {
        moduleDefinitionName := moduleDefinitionName is String ? BSTR.Alloc(moduleDefinitionName).Value : moduleDefinitionName

        result := ComCall(16, this, BSTR, moduleDefinitionName, "HRESULT")
        return result
    }

    /**
     * An array of directory paths that the rule is applied to when classification is run. (Get)
     * @remarks
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(17, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * An array of directory paths that the rule is applied to when classification is run. (Put)
     * @remarks
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(18, this, SAFEARRAY.Ptr, namespaceRoots, "HRESULT")
        return result
    }

    /**
     * The flags that define the state of the rule. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruleflags
     */
    get_RuleFlags() {
        result := ComCall(19, this, "int*", &ruleFlags := 0, "HRESULT")
        return ruleFlags
    }

    /**
     * The flags that define the state of the rule. (Put)
     * @param {Integer} ruleFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_ruleflags
     */
    put_RuleFlags(ruleFlags) {
        result := ComCall(20, this, "int", ruleFlags, "HRESULT")
        return result
    }

    /**
     * The parameters that are passed to the classifier. (Get)
     * @remarks
     * Specify parameters only if the classifier expects the rule to pass parameters.
     * 
     * The parameters are not passed directly to the classifier. Instead the rule is passed to the classifier which contains the parameters (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> method).
     * 
     * FSRM does not limit the length of the parameter name or value, nor does it limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_parameters
     */
    get_Parameters() {
        result := ComCall(21, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The parameters that are passed to the classifier. (Put)
     * @remarks
     * Specify parameters only if the classifier expects the rule to pass parameters.
     * 
     * The parameters are not passed directly to the classifier. Instead the rule is passed to the classifier which contains the parameters (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> method).
     * 
     * FSRM does not limit the length of the parameter name or value, nor does it limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(22, this, SAFEARRAY.Ptr, parameters, "HRESULT")
        return result
    }

    /**
     * The date for the last time the rule was modified.
     * @remarks
     * The last-modified time is set each time you commit the rule.
     * 
     * The last-modified time is used by FSRM to determine whether the rule needs to be run. If any rule returns a time that is more recent than the time a file was last modified, FSRM will re-evaluate any applicable rules for that file.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_lastmodified
     */
    get_LastModified() {
        lastModified := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, lastModified, "HRESULT")
        return lastModified
    }

    Query(iid) {
        if (IFsrmRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_RuleType := CallbackCreate(GetMethod(implObj, "get_RuleType"), flags, 2)
        this.vtbl.get_ModuleDefinitionName := CallbackCreate(GetMethod(implObj, "get_ModuleDefinitionName"), flags, 2)
        this.vtbl.put_ModuleDefinitionName := CallbackCreate(GetMethod(implObj, "put_ModuleDefinitionName"), flags, 2)
        this.vtbl.get_NamespaceRoots := CallbackCreate(GetMethod(implObj, "get_NamespaceRoots"), flags, 2)
        this.vtbl.put_NamespaceRoots := CallbackCreate(GetMethod(implObj, "put_NamespaceRoots"), flags, 2)
        this.vtbl.get_RuleFlags := CallbackCreate(GetMethod(implObj, "get_RuleFlags"), flags, 2)
        this.vtbl.put_RuleFlags := CallbackCreate(GetMethod(implObj, "put_RuleFlags"), flags, 2)
        this.vtbl.get_Parameters := CallbackCreate(GetMethod(implObj, "get_Parameters"), flags, 2)
        this.vtbl.put_Parameters := CallbackCreate(GetMethod(implObj, "put_Parameters"), flags, 2)
        this.vtbl.get_LastModified := CallbackCreate(GetMethod(implObj, "get_LastModified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_RuleType)
        CallbackFree(this.vtbl.get_ModuleDefinitionName)
        CallbackFree(this.vtbl.put_ModuleDefinitionName)
        CallbackFree(this.vtbl.get_NamespaceRoots)
        CallbackFree(this.vtbl.put_NamespaceRoots)
        CallbackFree(this.vtbl.get_RuleFlags)
        CallbackFree(this.vtbl.put_RuleFlags)
        CallbackFree(this.vtbl.get_Parameters)
        CallbackFree(this.vtbl.put_Parameters)
        CallbackFree(this.vtbl.get_LastModified)
    }
}

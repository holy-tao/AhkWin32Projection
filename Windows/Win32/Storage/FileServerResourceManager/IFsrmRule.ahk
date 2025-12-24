#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IFsrmObject.ahk

/**
 * Defines a rule.
 * @remarks
 * 
 * The name and rule type properties define a unique rule.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmrule
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmRule extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmRule
     * @type {Guid}
     */
    static IID => Guid("{cb0df960-16f5-4495-9079-3f9360d831df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_RuleType", "get_ModuleDefinitionName", "put_ModuleDefinitionName", "get_NamespaceRoots", "put_NamespaceRoots", "get_RuleFlags", "put_RuleFlags", "get_Parameters", "put_Parameters", "get_LastModified"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
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
     * The name of the rule.
     * @remarks
     * 
     * The name must be unique for its type (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype">IFsrmRule.RuleType</a> property).
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * The name of the rule.
     * @remarks
     * 
     * The name must be unique for its type (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype">IFsrmRule.RuleType</a> property).
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * The type of the rule.
     * @remarks
     * 
     * The rule's type is specified when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createrule">IFsrmClassificationManager::CreateRule</a> method to create the rule.
     * 
     * The name and rule type properties define a unique rule.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype
     */
    get_RuleType() {
        result := ComCall(14, this, "int*", &ruleType := 0, "HRESULT")
        return ruleType
    }

    /**
     * The name of the module definition that you want to run this rule.
     * @remarks
     * 
     * FSRM provides a built-in classifier module named, Folder Classifier. The Folder Classifier classifies files based on their location (in which folder they are located). This classifier looks at the current path of the file and matches it with the path specified in the namespace roots of the classification rule. If the path is within the scope of the rule's namespace roots, then FSRM applies the rule to the file.
     * 
     * To get a list of modules that have been registered with FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions">IFsrmClassificationManager::EnumModuleDefinitions</a> method. To access a module's name, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name">IFsrmPipelineModuleDefinition.Name</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_moduledefinitionname
     */
    get_ModuleDefinitionName() {
        moduleDefinitionName := BSTR()
        result := ComCall(15, this, "ptr", moduleDefinitionName, "HRESULT")
        return moduleDefinitionName
    }

    /**
     * The name of the module definition that you want to run this rule.
     * @remarks
     * 
     * FSRM provides a built-in classifier module named, Folder Classifier. The Folder Classifier classifies files based on their location (in which folder they are located). This classifier looks at the current path of the file and matches it with the path specified in the namespace roots of the classification rule. If the path is within the scope of the rule's namespace roots, then FSRM applies the rule to the file.
     * 
     * To get a list of modules that have been registered with FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions">IFsrmClassificationManager::EnumModuleDefinitions</a> method. To access a module's name, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_name">IFsrmPipelineModuleDefinition.Name</a> property.
     * 
     * 
     * @param {BSTR} moduleDefinitionName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_moduledefinitionname
     */
    put_ModuleDefinitionName(moduleDefinitionName) {
        moduleDefinitionName := moduleDefinitionName is String ? BSTR.Alloc(moduleDefinitionName).Value : moduleDefinitionName

        result := ComCall(16, this, "ptr", moduleDefinitionName, "HRESULT")
        return result
    }

    /**
     * An array of directory paths that the rule is applied to when classification is run.
     * @remarks
     * 
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(17, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * An array of directory paths that the rule is applied to when classification is run.
     * @remarks
     * 
     * All subdirectories under the specified path are also scanned (recursively).
     * 
     * Note that FSRM supports only NTFS file systems—you cannot specify paths on ReFS, FAT, 
     *     FAT32, UDF, or other non-NTFS file system.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(18, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * The flags that define the state of the rule.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruleflags
     */
    get_RuleFlags() {
        result := ComCall(19, this, "int*", &ruleFlags := 0, "HRESULT")
        return ruleFlags
    }

    /**
     * The flags that define the state of the rule.
     * @param {Integer} ruleFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_ruleflags
     */
    put_RuleFlags(ruleFlags) {
        result := ComCall(20, this, "int", ruleFlags, "HRESULT")
        return result
    }

    /**
     * The parameters that are passed to the classifier.
     * @remarks
     * 
     * Specify parameters only if the classifier expects the rule to pass parameters.
     * 
     * The parameters are not passed directly to the classifier. Instead the rule is passed to the classifier which contains the parameters (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> method).
     * 
     * FSRM does not limit the length of the parameter name or value, nor does it limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_parameters
     */
    get_Parameters() {
        result := ComCall(21, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * The parameters that are passed to the classifier.
     * @remarks
     * 
     * Specify parameters only if the classifier expects the rule to pass parameters.
     * 
     * The parameters are not passed directly to the classifier. Instead the rule is passed to the classifier which contains the parameters (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduleimplementation-onload">IFsrmPipelineModuleImplementation::OnLoad</a> method).
     * 
     * FSRM does not limit the length of the parameter name or value, nor does it limit the number of parameters that you can specify. Specifying a parameter without a value is valid (for example, "parameter=").
     * 
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(22, this, "ptr", parameters, "HRESULT")
        return result
    }

    /**
     * The date for the last time the rule was modified.
     * @remarks
     * 
     * The last-modified time is set each time you commit the rule.
     * 
     * The last-modified time is used by FSRM to determine whether the rule needs to be run. If any rule returns a time that is more recent than the time a file was last modified, FSRM will re-evaluate any applicable rules for that file.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_lastmodified
     */
    get_LastModified() {
        lastModified := VARIANT()
        result := ComCall(23, this, "ptr", lastModified, "HRESULT")
        return lastModified
    }
}

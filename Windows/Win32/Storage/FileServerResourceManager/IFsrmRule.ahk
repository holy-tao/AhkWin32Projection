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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype
     */
    get_RuleType() {
        result := ComCall(14, this, "int*", &ruleType := 0, "HRESULT")
        return ruleType
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_moduledefinitionname
     */
    get_ModuleDefinitionName() {
        moduleDefinitionName := BSTR()
        result := ComCall(15, this, "ptr", moduleDefinitionName, "HRESULT")
        return moduleDefinitionName
    }

    /**
     * 
     * @param {BSTR} moduleDefinitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_moduledefinitionname
     */
    put_ModuleDefinitionName(moduleDefinitionName) {
        moduleDefinitionName := moduleDefinitionName is String ? BSTR.Alloc(moduleDefinitionName).Value : moduleDefinitionName

        result := ComCall(16, this, "ptr", moduleDefinitionName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_namespaceroots
     */
    get_NamespaceRoots() {
        result := ComCall(17, this, "ptr*", &namespaceRoots := 0, "HRESULT")
        return namespaceRoots
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_namespaceroots
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(18, this, "ptr", namespaceRoots, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruleflags
     */
    get_RuleFlags() {
        result := ComCall(19, this, "int*", &ruleFlags := 0, "HRESULT")
        return ruleFlags
    }

    /**
     * 
     * @param {Integer} ruleFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_ruleflags
     */
    put_RuleFlags(ruleFlags) {
        result := ComCall(20, this, "int", ruleFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_parameters
     */
    get_Parameters() {
        result := ComCall(21, this, "ptr*", &parameters := 0, "HRESULT")
        return parameters
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-put_parameters
     */
    put_Parameters(parameters) {
        result := ComCall(22, this, "ptr", parameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_lastmodified
     */
    get_LastModified() {
        lastModified := VARIANT()
        result := ComCall(23, this, "ptr", lastModified, "HRESULT")
        return lastModified
    }
}

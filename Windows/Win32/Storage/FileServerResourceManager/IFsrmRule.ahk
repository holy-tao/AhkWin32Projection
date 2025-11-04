#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_name
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ruleType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype
     */
    get_RuleType(ruleType) {
        ruleTypeMarshal := ruleType is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, ruleTypeMarshal, ruleType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} moduleDefinitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_moduledefinitionname
     */
    get_ModuleDefinitionName(moduleDefinitionName) {
        result := ComCall(15, this, "ptr", moduleDefinitionName, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} namespaceRoots 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_namespaceroots
     */
    get_NamespaceRoots(namespaceRoots) {
        namespaceRootsMarshal := namespaceRoots is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, namespaceRootsMarshal, namespaceRoots, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ruleFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruleflags
     */
    get_RuleFlags(ruleFlags) {
        ruleFlagsMarshal := ruleFlags is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, ruleFlagsMarshal, ruleFlags, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SAFEARRAY>>} parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_parameters
     */
    get_Parameters(parameters) {
        parametersMarshal := parameters is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, parametersMarshal, parameters, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} lastModified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_lastmodified
     */
    get_LastModified(lastModified) {
        result := ComCall(23, this, "ptr", lastModified, "HRESULT")
        return result
    }
}

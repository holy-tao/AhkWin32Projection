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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ruleType 
     * @returns {HRESULT} 
     */
    get_RuleType(ruleType) {
        result := ComCall(14, this, "int*", ruleType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} moduleDefinitionName 
     * @returns {HRESULT} 
     */
    get_ModuleDefinitionName(moduleDefinitionName) {
        result := ComCall(15, this, "ptr", moduleDefinitionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} moduleDefinitionName 
     * @returns {HRESULT} 
     */
    put_ModuleDefinitionName(moduleDefinitionName) {
        moduleDefinitionName := moduleDefinitionName is String ? BSTR.Alloc(moduleDefinitionName).Value : moduleDefinitionName

        result := ComCall(16, this, "ptr", moduleDefinitionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    get_NamespaceRoots(namespaceRoots) {
        result := ComCall(17, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} namespaceRoots 
     * @returns {HRESULT} 
     */
    put_NamespaceRoots(namespaceRoots) {
        result := ComCall(18, this, "ptr", namespaceRoots, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ruleFlags 
     * @returns {HRESULT} 
     */
    get_RuleFlags(ruleFlags) {
        result := ComCall(19, this, "int*", ruleFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ruleFlags 
     * @returns {HRESULT} 
     */
    put_RuleFlags(ruleFlags) {
        result := ComCall(20, this, "int", ruleFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    get_Parameters(parameters) {
        result := ComCall(21, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} parameters 
     * @returns {HRESULT} 
     */
    put_Parameters(parameters) {
        result := ComCall(22, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} lastModified 
     * @returns {HRESULT} 
     */
    get_LastModified(lastModified) {
        result := ComCall(23, this, "ptr", lastModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

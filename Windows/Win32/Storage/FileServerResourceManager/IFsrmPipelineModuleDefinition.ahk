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
     * 
     * @param {Pointer<BSTR>} moduleClsid 
     * @returns {HRESULT} 
     */
    get_ModuleClsid(moduleClsid) {
        result := ComCall(12, this, "ptr", moduleClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} moduleClsid 
     * @returns {HRESULT} 
     */
    put_ModuleClsid(moduleClsid) {
        moduleClsid := moduleClsid is String ? BSTR.Alloc(moduleClsid).Value : moduleClsid

        result := ComCall(13, this, "ptr", moduleClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(14, this, "ptr", name, "int")
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

        result := ComCall(15, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} company 
     * @returns {HRESULT} 
     */
    get_Company(company) {
        result := ComCall(16, this, "ptr", company, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} company 
     * @returns {HRESULT} 
     */
    put_Company(company) {
        company := company is String ? BSTR.Alloc(company).Value : company

        result := ComCall(17, this, "ptr", company, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} version 
     * @returns {HRESULT} 
     */
    get_Version(version) {
        result := ComCall(18, this, "ptr", version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(19, this, "ptr", version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} moduleType 
     * @returns {HRESULT} 
     */
    get_ModuleType(moduleType) {
        result := ComCall(20, this, "int*", moduleType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(enabled) {
        result := ComCall(21, this, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(22, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} needsFileContent 
     * @returns {HRESULT} 
     */
    get_NeedsFileContent(needsFileContent) {
        result := ComCall(23, this, "ptr", needsFileContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} needsFileContent 
     * @returns {HRESULT} 
     */
    put_NeedsFileContent(needsFileContent) {
        result := ComCall(24, this, "short", needsFileContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retrievalAccount 
     * @returns {HRESULT} 
     */
    get_Account(retrievalAccount) {
        result := ComCall(25, this, "int*", retrievalAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} retrievalAccount 
     * @returns {HRESULT} 
     */
    put_Account(retrievalAccount) {
        result := ComCall(26, this, "int", retrievalAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} supportedExtensions 
     * @returns {HRESULT} 
     */
    get_SupportedExtensions(supportedExtensions) {
        result := ComCall(27, this, "ptr", supportedExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} supportedExtensions 
     * @returns {HRESULT} 
     */
    put_SupportedExtensions(supportedExtensions) {
        result := ComCall(28, this, "ptr", supportedExtensions, "int")
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
        result := ComCall(29, this, "ptr", parameters, "int")
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
        result := ComCall(30, this, "ptr", parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

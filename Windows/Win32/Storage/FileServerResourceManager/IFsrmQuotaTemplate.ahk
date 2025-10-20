#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuotaBase.ahk

/**
 * Used to configure templates from which new quota objects can be derived.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotatemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaTemplate extends IFsrmQuotaBase{
    /**
     * The interface identifier for IFsrmQuotaTemplate
     * @type {Guid}
     */
    static IID => Guid("{a2efab31-295e-46bb-b976-e86d58b52e8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(22, this, "ptr", name, "int")
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

        result := ComCall(23, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} quotaTemplateName 
     * @returns {HRESULT} 
     */
    CopyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(24, this, "ptr", quotaTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} commitOptions 
     * @param {Integer} applyOptions 
     * @param {Pointer<IFsrmDerivedObjectsResult>} derivedObjectsResult 
     * @returns {HRESULT} 
     */
    CommitAndUpdateDerived(commitOptions, applyOptions, derivedObjectsResult) {
        result := ComCall(25, this, "int", commitOptions, "int", applyOptions, "ptr", derivedObjectsResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "CopyTemplate", "CommitAndUpdateDerived"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-get_name
     */
    get_Name(name) {
        result := ComCall(22, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} quotaTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-copytemplate
     */
    CopyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(24, this, "ptr", quotaTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commitOptions 
     * @param {Integer} applyOptions 
     * @param {Pointer<IFsrmDerivedObjectsResult>} derivedObjectsResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions, derivedObjectsResult) {
        result := ComCall(25, this, "int", commitOptions, "int", applyOptions, "ptr*", derivedObjectsResult, "HRESULT")
        return result
    }
}

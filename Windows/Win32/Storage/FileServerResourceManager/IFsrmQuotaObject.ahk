#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuotaBase.ahk

/**
 * Base class for the quota and automatic quota interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotaobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaObject extends IFsrmQuotaBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaObject
     * @type {Guid}
     */
    static IID => Guid("{42dc3511-61d5-48ae-b6dc-59fc00c0a8d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "get_UserSid", "get_UserAccount", "get_SourceTemplateName", "get_MatchesSourceTemplate", "ApplyTemplate"]

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_path
     */
    get_Path(path) {
        result := ComCall(22, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userSid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_usersid
     */
    get_UserSid(userSid) {
        result := ComCall(23, this, "ptr", userSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userAccount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_useraccount
     */
    get_UserAccount(userAccount) {
        result := ComCall(24, this, "ptr", userAccount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} quotaTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_sourcetemplatename
     */
    get_SourceTemplateName(quotaTemplateName) {
        result := ComCall(25, this, "ptr", quotaTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} matches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate(matches) {
        result := ComCall(26, this, "ptr", matches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} quotaTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-applytemplate
     */
    ApplyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(27, this, "ptr", quotaTemplateName, "HRESULT")
        return result
    }
}

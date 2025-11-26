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
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {BSTR} 
     */
    UserSid {
        get => this.get_UserSid()
    }

    /**
     * @type {BSTR} 
     */
    UserAccount {
        get => this.get_UserAccount()
    }

    /**
     * @type {BSTR} 
     */
    SourceTemplateName {
        get => this.get_SourceTemplateName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MatchesSourceTemplate {
        get => this.get_MatchesSourceTemplate()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_path
     */
    get_Path() {
        path := BSTR()
        result := ComCall(22, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_usersid
     */
    get_UserSid() {
        userSid := BSTR()
        result := ComCall(23, this, "ptr", userSid, "HRESULT")
        return userSid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_useraccount
     */
    get_UserAccount() {
        userAccount := BSTR()
        result := ComCall(24, this, "ptr", userAccount, "HRESULT")
        return userAccount
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_sourcetemplatename
     */
    get_SourceTemplateName() {
        quotaTemplateName := BSTR()
        result := ComCall(25, this, "ptr", quotaTemplateName, "HRESULT")
        return quotaTemplateName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate() {
        result := ComCall(26, this, "short*", &matches := 0, "HRESULT")
        return matches
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

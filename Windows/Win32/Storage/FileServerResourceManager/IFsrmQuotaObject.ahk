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
     * Retrieves the path to which the quota applies.
     * @remarks
     * 
     * The path is specified when you create the quota object.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_path
     */
    get_Path() {
        path := BSTR()
        result := ComCall(22, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves the string form of the user's security identifier (SID) that is associated with the object.
     * @remarks
     * 
     * This method always returns the well-known SID of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WinNULLSid</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_usersid
     */
    get_UserSid() {
        userSid := BSTR()
        result := ComCall(23, this, "ptr", userSid, "HRESULT")
        return userSid
    }

    /**
     * Retrieves the string form of the user account that is associated with the object.
     * @remarks
     * 
     * This method always returns the string form of the account that corresponds to the well-known SID of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WinNULLSid</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_useraccount
     */
    get_UserAccount() {
        userAccount := BSTR()
        result := ComCall(24, this, "ptr", userAccount, "HRESULT")
        return userAccount
    }

    /**
     * Retrieves the name of the template from which this quota was derived.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_sourcetemplatename
     */
    get_SourceTemplateName() {
        quotaTemplateName := BSTR()
        result := ComCall(25, this, "ptr", quotaTemplateName, "HRESULT")
        return quotaTemplateName
    }

    /**
     * Retrieves a value that determines whether the property values of this quota object match those of the template from which it was derived.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate() {
        result := ComCall(26, this, "short*", &matches := 0, "HRESULT")
        return matches
    }

    /**
     * Applies the property values of the specified quota template to this quota object.
     * @param {BSTR} quotaTemplateName The name of the quota template.  The string is limited to 4,000 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotaobject-applytemplate
     */
    ApplyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(27, this, "ptr", quotaTemplateName, "HRESULT")
        return result
    }
}

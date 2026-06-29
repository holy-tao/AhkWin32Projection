#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmQuotaBase.ahk" { IFsrmQuotaBase }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Base class for the quota and automatic quota interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotaobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuotaObject extends IFsrmQuotaBase {
    /**
     * The interface identifier for IFsrmQuotaObject
     * @type {Guid}
     */
    static IID := Guid("{42dc3511-61d5-48ae-b6dc-59fc00c0a8d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuotaObject interfaces
    */
    struct Vtbl extends IFsrmQuotaBase.Vtbl {
        get_Path                  : IntPtr
        get_UserSid               : IntPtr
        get_UserAccount           : IntPtr
        get_SourceTemplateName    : IntPtr
        get_MatchesSourceTemplate : IntPtr
        ApplyTemplate             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuotaObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The path is specified when you create the quota object.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_path
     */
    get_Path() {
        _path := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Retrieves the string form of the user's security identifier (SID) that is associated with the object.
     * @remarks
     * This method always returns the well-known SID of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WinNULLSid</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_usersid
     */
    get_UserSid() {
        userSid := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, userSid, "HRESULT")
        return userSid
    }

    /**
     * Retrieves the string form of the user account that is associated with the object.
     * @remarks
     * This method always returns the string form of the account that corresponds to the well-known SID of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WinNULLSid</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_useraccount
     */
    get_UserAccount() {
        userAccount := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, userAccount, "HRESULT")
        return userAccount
    }

    /**
     * Retrieves the name of the template from which this quota was derived.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_sourcetemplatename
     */
    get_SourceTemplateName() {
        quotaTemplateName := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, quotaTemplateName, "HRESULT")
        return quotaTemplateName
    }

    /**
     * Retrieves a value that determines whether the property values of this quota object match those of the template from which it was derived.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &matches := 0, "HRESULT")
        return matches
    }

    /**
     * Applies the property values of the specified quota template to this quota object.
     * @param {BSTR} quotaTemplateName The name of the quota template.  The string is limited to 4,000 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-applytemplate
     */
    ApplyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(27, this, BSTR, quotaTemplateName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmQuotaObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_UserSid := CallbackCreate(GetMethod(implObj, "get_UserSid"), flags, 2)
        this.vtbl.get_UserAccount := CallbackCreate(GetMethod(implObj, "get_UserAccount"), flags, 2)
        this.vtbl.get_SourceTemplateName := CallbackCreate(GetMethod(implObj, "get_SourceTemplateName"), flags, 2)
        this.vtbl.get_MatchesSourceTemplate := CallbackCreate(GetMethod(implObj, "get_MatchesSourceTemplate"), flags, 2)
        this.vtbl.ApplyTemplate := CallbackCreate(GetMethod(implObj, "ApplyTemplate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_UserSid)
        CallbackFree(this.vtbl.get_UserAccount)
        CallbackFree(this.vtbl.get_SourceTemplateName)
        CallbackFree(this.vtbl.get_MatchesSourceTemplate)
        CallbackFree(this.vtbl.ApplyTemplate)
    }
}

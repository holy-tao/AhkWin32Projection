#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IFsrmFileScreenBase.ahk" { IFsrmFileScreenBase }

/**
 * Used to configure a file screen that blocks groups of files from being saved to the specified directory.
 * @remarks
 * A file screen limits the types of files that the system or any user can store in a directory. When a 
 *     restricted file is detected, the FSRM server performs the specified actions (see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-createaction">IFsrmFileScreenBase::CreateAction</a>).
 * 
 * The file screen applies to future files—the screen is not applied retroactively. To list 
 *     the files in the directory that violate the screen, create a report job that lists files by type.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreen
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileScreen extends IFsrmFileScreenBase {
    /**
     * The interface identifier for IFsrmFileScreen
     * @type {Guid}
     */
    static IID := Guid("{5f6325d3-ce88-4733-84c1-2d6aefc5ea07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileScreen interfaces
    */
    struct Vtbl extends IFsrmFileScreenBase.Vtbl {
        get_Path                  : IntPtr
        get_SourceTemplateName    : IntPtr
        get_MatchesSourceTemplate : IntPtr
        get_UserSid               : IntPtr
        get_UserAccount           : IntPtr
        ApplyTemplate             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileScreen.Vtbl()
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
     * Retrieves the directory path associated with the file screen object.
     * @remarks
     * Note that the file screen remains associated with the directory if the directory is renamed. If the directory 
     *     is deleted, so is the file screen.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_path
     */
    get_Path() {
        _path := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Retrieves the name of the template from which this file screen object was derived.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_sourcetemplatename
     */
    get_SourceTemplateName() {
        fileScreenTemplateName := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, fileScreenTemplateName, "HRESULT")
        return fileScreenTemplateName
    }

    /**
     * Retrieves a value that determines whether the property values of this file screen object match those values of the template from which the object was derived.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &matches := 0, "HRESULT")
        return matches
    }

    /**
     * The SID of the user whose files will be screened.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_usersid
     */
    get_UserSid() {
        userSid := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, userSid, "HRESULT")
        return userSid
    }

    /**
     * The account name of the user whose files will be screened.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_useraccount
     */
    get_UserAccount() {
        userAccount := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, userAccount, "HRESULT")
        return userAccount
    }

    /**
     * Applies the property values of the specified file screen template to this file screen object.
     * @remarks
     * To save the changes, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreen::Commit</a> method.
     * 
     * The specified template must be a committed template; you cannot apply a newly created template that has not 
     *     been committed.
     * @param {BSTR} fileScreenTemplateName The name of the file screen template. The string is limited to 4,000 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-applytemplate
     */
    ApplyTemplate(fileScreenTemplateName) {
        fileScreenTemplateName := fileScreenTemplateName is String ? BSTR.Alloc(fileScreenTemplateName).Value : fileScreenTemplateName

        result := ComCall(23, this, BSTR, fileScreenTemplateName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileScreen.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_SourceTemplateName := CallbackCreate(GetMethod(implObj, "get_SourceTemplateName"), flags, 2)
        this.vtbl.get_MatchesSourceTemplate := CallbackCreate(GetMethod(implObj, "get_MatchesSourceTemplate"), flags, 2)
        this.vtbl.get_UserSid := CallbackCreate(GetMethod(implObj, "get_UserSid"), flags, 2)
        this.vtbl.get_UserAccount := CallbackCreate(GetMethod(implObj, "get_UserAccount"), flags, 2)
        this.vtbl.ApplyTemplate := CallbackCreate(GetMethod(implObj, "ApplyTemplate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_SourceTemplateName)
        CallbackFree(this.vtbl.get_MatchesSourceTemplate)
        CallbackFree(this.vtbl.get_UserSid)
        CallbackFree(this.vtbl.get_UserAccount)
        CallbackFree(this.vtbl.ApplyTemplate)
    }
}

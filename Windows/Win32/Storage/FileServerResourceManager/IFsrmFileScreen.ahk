#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmFileScreenBase.ahk

/**
 * Used to configure a file screen that blocks groups of files from being saved to the specified directory.
 * @remarks
 * 
 * A file screen limits the types of files that the system or any user can store in a directory. When a 
 *     restricted file is detected, the FSRM server performs the specified actions (see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-createaction">IFsrmFileScreenBase::CreateAction</a>).
 * 
 * The file screen applies to future files—the screen is not applied retroactively. To list 
 *     the files in the directory that violate the screen, create a report job that lists files by type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreen
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreen extends IFsrmFileScreenBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreen
     * @type {Guid}
     */
    static IID => Guid("{5f6325d3-ce88-4733-84c1-2d6aefc5ea07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "get_SourceTemplateName", "get_MatchesSourceTemplate", "get_UserSid", "get_UserAccount", "ApplyTemplate"]

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
     * 
     * Note that the file screen remains associated with the directory if the directory is renamed. If the directory 
     *     is deleted, so is the file screen.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_path
     */
    get_Path() {
        path := BSTR()
        result := ComCall(18, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves the name of the template from which this file screen object was derived.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_sourcetemplatename
     */
    get_SourceTemplateName() {
        fileScreenTemplateName := BSTR()
        result := ComCall(19, this, "ptr", fileScreenTemplateName, "HRESULT")
        return fileScreenTemplateName
    }

    /**
     * Retrieves a value that determines whether the property values of this file screen object match those values of the template from which the object was derived.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate() {
        result := ComCall(20, this, "short*", &matches := 0, "HRESULT")
        return matches
    }

    /**
     * The SID of the user whose files will be screened.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_usersid
     */
    get_UserSid() {
        userSid := BSTR()
        result := ComCall(21, this, "ptr", userSid, "HRESULT")
        return userSid
    }

    /**
     * The account name of the user whose files will be screened.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_useraccount
     */
    get_UserAccount() {
        userAccount := BSTR()
        result := ComCall(22, this, "ptr", userAccount, "HRESULT")
        return userAccount
    }

    /**
     * Applies the property values of the specified file screen template to this file screen object.
     * @param {BSTR} fileScreenTemplateName The name of the file screen template. The string is limited to 4,000 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-applytemplate
     */
    ApplyTemplate(fileScreenTemplateName) {
        fileScreenTemplateName := fileScreenTemplateName is String ? BSTR.Alloc(fileScreenTemplateName).Value : fileScreenTemplateName

        result := ComCall(23, this, "ptr", fileScreenTemplateName, "HRESULT")
        return result
    }
}

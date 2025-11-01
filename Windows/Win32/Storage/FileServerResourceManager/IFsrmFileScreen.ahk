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
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_path
     */
    get_Path(path) {
        result := ComCall(18, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fileScreenTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_sourcetemplatename
     */
    get_SourceTemplateName(fileScreenTemplateName) {
        result := ComCall(19, this, "ptr", fileScreenTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} matches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_matchessourcetemplate
     */
    get_MatchesSourceTemplate(matches) {
        result := ComCall(20, this, "ptr", matches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userSid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_usersid
     */
    get_UserSid(userSid) {
        result := ComCall(21, this, "ptr", userSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userAccount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-get_useraccount
     */
    get_UserAccount(userAccount) {
        result := ComCall(22, this, "ptr", userAccount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} fileScreenTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreen-applytemplate
     */
    ApplyTemplate(fileScreenTemplateName) {
        fileScreenTemplateName := fileScreenTemplateName is String ? BSTR.Alloc(fileScreenTemplateName).Value : fileScreenTemplateName

        result := ComCall(23, this, "ptr", fileScreenTemplateName, "HRESULT")
        return result
    }
}

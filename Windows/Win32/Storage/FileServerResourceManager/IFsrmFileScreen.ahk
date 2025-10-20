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
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_Path(path) {
        result := ComCall(18, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fileScreenTemplateName 
     * @returns {HRESULT} 
     */
    get_SourceTemplateName(fileScreenTemplateName) {
        result := ComCall(19, this, "ptr", fileScreenTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} matches 
     * @returns {HRESULT} 
     */
    get_MatchesSourceTemplate(matches) {
        result := ComCall(20, this, "ptr", matches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userSid 
     * @returns {HRESULT} 
     */
    get_UserSid(userSid) {
        result := ComCall(21, this, "ptr", userSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userAccount 
     * @returns {HRESULT} 
     */
    get_UserAccount(userAccount) {
        result := ComCall(22, this, "ptr", userAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} fileScreenTemplateName 
     * @returns {HRESULT} 
     */
    ApplyTemplate(fileScreenTemplateName) {
        fileScreenTemplateName := fileScreenTemplateName is String ? BSTR.Alloc(fileScreenTemplateName).Value : fileScreenTemplateName

        result := ComCall(23, this, "ptr", fileScreenTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

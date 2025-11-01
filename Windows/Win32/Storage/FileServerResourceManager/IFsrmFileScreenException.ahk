#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmObject.ahk

/**
 * Used to configure an exception that excludes the specified files from the file screening process.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreenexception
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenException extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenException
     * @type {Guid}
     */
    static IID => Guid("{bee7ce02-df77-4515-9389-78f01c5afc1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "get_AllowedFileGroups", "put_AllowedFileGroups"]

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_path
     */
    get_Path(path) {
        result := ComCall(12, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} allowList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_allowedfilegroups
     */
    get_AllowedFileGroups(allowList) {
        result := ComCall(13, this, "ptr*", allowList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsrmMutableCollection} allowList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-put_allowedfilegroups
     */
    put_AllowedFileGroups(allowList) {
        result := ComCall(14, this, "ptr", allowList, "HRESULT")
        return result
    }
}

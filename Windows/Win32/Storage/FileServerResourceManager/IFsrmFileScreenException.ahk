#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmMutableCollection.ahk
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
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IFsrmMutableCollection} 
     */
    AllowedFileGroups {
        get => this.get_AllowedFileGroups()
        set => this.put_AllowedFileGroups(value)
    }

    /**
     * Retrieves the path that is associated with this file screen exception.
     * @remarks
     * 
     * Note that if the path is renamed, the exception becomes associated with the new path. If the path is deleted, 
     *     the exception is deleted.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_path
     */
    get_Path() {
        path := BSTR()
        result := ComCall(12, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns of the files that are allowed in the directory.
     * @returns {IFsrmMutableCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_allowedfilegroups
     */
    get_AllowedFileGroups() {
        result := ComCall(13, this, "ptr*", &allowList := 0, "HRESULT")
        return IFsrmMutableCollection(allowList)
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns of the files that are allowed in the directory.
     * @param {IFsrmMutableCollection} allowList 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-put_allowedfilegroups
     */
    put_AllowedFileGroups(allowList) {
        result := ComCall(14, this, "ptr", allowList, "HRESULT")
        return result
    }
}

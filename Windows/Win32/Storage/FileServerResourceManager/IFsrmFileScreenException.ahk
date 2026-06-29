#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import ".\IFsrmMutableCollection.ahk" { IFsrmMutableCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to configure an exception that excludes the specified files from the file screening process.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreenexception
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileScreenException extends IFsrmObject {
    /**
     * The interface identifier for IFsrmFileScreenException
     * @type {Guid}
     */
    static IID := Guid("{bee7ce02-df77-4515-9389-78f01c5afc1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileScreenException interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_Path              : IntPtr
        get_AllowedFileGroups : IntPtr
        put_AllowedFileGroups : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileScreenException.Vtbl()
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
     * @type {IFsrmMutableCollection} 
     */
    AllowedFileGroups {
        get => this.get_AllowedFileGroups()
        set => this.put_AllowedFileGroups(value)
    }

    /**
     * Retrieves the path that is associated with this file screen exception.
     * @remarks
     * Note that if the path is renamed, the exception becomes associated with the new path. If the path is deleted, 
     *     the exception is deleted.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_path
     */
    get_Path() {
        _path := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns of the files that are allowed in the directory. (Get)
     * @returns {IFsrmMutableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-get_allowedfilegroups
     */
    get_AllowedFileGroups() {
        result := ComCall(13, this, "ptr*", &allowList := 0, "HRESULT")
        return IFsrmMutableCollection(allowList)
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns of the files that are allowed in the directory. (Put)
     * @param {IFsrmMutableCollection} allowList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenexception-put_allowedfilegroups
     */
    put_AllowedFileGroups(allowList) {
        result := ComCall(14, this, "ptr", allowList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileScreenException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_AllowedFileGroups := CallbackCreate(GetMethod(implObj, "get_AllowedFileGroups"), flags, 2)
        this.vtbl.put_AllowedFileGroups := CallbackCreate(GetMethod(implObj, "put_AllowedFileGroups"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_AllowedFileGroups)
        CallbackFree(this.vtbl.put_AllowedFileGroups)
    }
}

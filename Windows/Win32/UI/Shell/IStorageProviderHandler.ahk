#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStorageProviderPropertyHandler.ahk" { IStorageProviderPropertyHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the IStorageProviderPropertyHandler associated with a specific file or folder.
 * @remarks
 * <div class="alert"><b>Caution</b>  <p class="note">You should only implement this interface if you have a specific need to do so.  
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nn-storageprovider-istorageproviderhandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStorageProviderHandler extends IUnknown {
    /**
     * The interface identifier for IStorageProviderHandler
     * @type {Guid}
     */
    static IID := Guid("{162c6fb5-44d3-435b-903d-e613fa093fb5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStorageProviderHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyHandlerFromPath   : IntPtr
        GetPropertyHandlerFromUri    : IntPtr
        GetPropertyHandlerFromFileId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStorageProviderHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an instance of IStorageProviderPropertyHandler associated with the provided path.
     * @param {PWSTR} _path The path for the relevant file.
     * @returns {IStorageProviderPropertyHandler} An <a href="https://docs.microsoft.com/windows/desktop/api/storageprovider/nn-storageprovider-istorageproviderpropertyhandler">IStorageProviderPropertyHandler</a> instance associated with the file specified by <i>path</i>.
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfrompath
     */
    GetPropertyHandlerFromPath(_path) {
        _path := _path is String ? StrPtr(_path) : _path

        result := ComCall(3, this, "ptr", _path, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }

    /**
     * Gets an instance of IStorageProviderPropertyHandler associated with the provided URI.
     * @remarks
     * This method is used to convert a remote URI to a local file system path. That path is then used to provide the <i>propertyHandler</i> to the local file.
     * @param {PWSTR} uri The URI for the relevant file.
     * @returns {IStorageProviderPropertyHandler} An <a href="https://docs.microsoft.com/windows/desktop/api/storageprovider/nn-storageprovider-istorageproviderpropertyhandler">IStorageProviderPropertyHandler</a> instance associated with the file specified by <i>uri</i>.
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfromuri
     */
    GetPropertyHandlerFromUri(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(4, this, "ptr", uri, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }

    /**
     * Gets an instance of IStorageProviderPropertyHandler associated with the provided file identifier.
     * @remarks
     * This method is used to convert a  file identifier to a local file system path. That path is then used to provide the <i>propertyHandler</i> to the local file.
     * @param {PWSTR} fileId The identifier for the relevant file.
     * @returns {IStorageProviderPropertyHandler} An <a href="https://docs.microsoft.com/windows/desktop/api/storageprovider/nn-storageprovider-istorageproviderpropertyhandler">IStorageProviderPropertyHandler</a> instance associated with the file specified by <i>fileId</i>.
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfromfileid
     */
    GetPropertyHandlerFromFileId(fileId) {
        fileId := fileId is String ? StrPtr(fileId) : fileId

        result := ComCall(5, this, "ptr", fileId, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }

    Query(iid) {
        if (IStorageProviderHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyHandlerFromPath := CallbackCreate(GetMethod(implObj, "GetPropertyHandlerFromPath"), flags, 3)
        this.vtbl.GetPropertyHandlerFromUri := CallbackCreate(GetMethod(implObj, "GetPropertyHandlerFromUri"), flags, 3)
        this.vtbl.GetPropertyHandlerFromFileId := CallbackCreate(GetMethod(implObj, "GetPropertyHandlerFromFileId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyHandlerFromPath)
        CallbackFree(this.vtbl.GetPropertyHandlerFromUri)
        CallbackFree(this.vtbl.GetPropertyHandlerFromFileId)
    }
}

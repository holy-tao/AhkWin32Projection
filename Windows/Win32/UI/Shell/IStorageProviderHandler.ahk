#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStorageProviderPropertyHandler.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves the IStorageProviderPropertyHandler associated with a specific file or folder.
 * @remarks
 * 
 * <div class="alert"><b>Caution</b>  <p class="note">You should only implement this interface if you have a specific need to do so.  
 * 
 * </div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//storageprovider/nn-storageprovider-istorageproviderhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderHandler
     * @type {Guid}
     */
    static IID => Guid("{162c6fb5-44d3-435b-903d-e613fa093fb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyHandlerFromPath", "GetPropertyHandlerFromUri", "GetPropertyHandlerFromFileId"]

    /**
     * 
     * @param {PWSTR} path 
     * @returns {IStorageProviderPropertyHandler} 
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfrompath
     */
    GetPropertyHandlerFromPath(path) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(3, this, "ptr", path, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {IStorageProviderPropertyHandler} 
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfromuri
     */
    GetPropertyHandlerFromUri(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(4, this, "ptr", uri, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }

    /**
     * 
     * @param {PWSTR} fileId 
     * @returns {IStorageProviderPropertyHandler} 
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderhandler-getpropertyhandlerfromfileid
     */
    GetPropertyHandlerFromFileId(fileId) {
        fileId := fileId is String ? StrPtr(fileId) : fileId

        result := ComCall(5, this, "ptr", fileId, "ptr*", &propertyHandler := 0, "HRESULT")
        return IStorageProviderPropertyHandler(propertyHandler)
    }
}

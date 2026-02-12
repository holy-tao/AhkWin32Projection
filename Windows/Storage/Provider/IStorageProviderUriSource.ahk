#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface for getting a content URI path and information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderurisource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderUriSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderUriSource
     * @type {Guid}
     */
    static IID => Guid("{b29806d1-8be0-4962-8bb6-0d4c2e14d47a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPathForContentUri", "GetContentInfoForPath"]

    /**
     * Gets the path of content URI given the name of the URI.
     * @param {HSTRING} contentUri The string name of the content URI.
     * @param {StorageProviderGetPathForContentUriResult} result_ The path of the provided content URI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderurisource.getpathforcontenturi
     */
    GetPathForContentUri(contentUri, result_) {
        if(contentUri is String) {
            pin := HSTRING.Create(contentUri)
            contentUri := pin.Value
        }
        contentUri := contentUri is Win32Handle ? NumGet(contentUri, "ptr") : contentUri

        result := ComCall(6, this, "ptr", contentUri, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets information about a storage provider URI given the path of the URI.
     * @param {HSTRING} path_ The path of the storage provider URI.
     * @param {StorageProviderGetContentInfoForPathResult} result_ Content information about the provided storage provider URI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderurisource.getcontentinfoforpath
     */
    GetContentInfoForPath(path_, result_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(7, this, "ptr", path_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

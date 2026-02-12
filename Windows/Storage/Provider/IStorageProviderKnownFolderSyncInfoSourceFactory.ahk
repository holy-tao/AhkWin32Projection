#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IStorageProviderKnownFolderSyncInfoSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface that a cloud files provider implements to provide instances of [IStorageProviderKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosource.md) to File Explorer.
 * @remarks
 * Cloud files providers implement this interface and register it as an extension in the app manifest. A new manifest element will be added to the package manifest schema under the `CloudFiles` extension element. You can use this element in the `CloudFiles` namespace:
 * 
 * ```xml
 * <Package
 *     xmlns:desktop3="http://schemas.microsoft.com/appx/manifest/desktop/windows10/3"
 *     xmlns:cloudfiles="http://schemas.microsoft.com/appx/manifest/cloudfiles/windows10"
 *     xmlns:cloudfiles3="http://schemas.microsoft.com/appx/manifest/cloudfiles/windows10/3"
 * >
 * 
 * <Applications>
 *     <Application>
 *         <Extensions>
 *             <desktop3:Extension>
 *             <desktop3:CloudFiles>
 *             <cloudfiles3: StorageProviderKnownFolderSyncInfoSourceFactory >
 * ...
 * </Applications>
 * ```
 * 
 * Alternatively, for non-packaged Win32 apps, registration of this class can be done directly in the registry by setting the CLSID of the implementation class as the value of the following registry key:
 * 
 * ```
 * HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StorageProvider
 * ```
 * 
 * This is consistent with the existing mechanism for unpackaged provider registration. This registration allows a storage provider to offer the entry point before a cloud user account is added. When installed globally, cloud files providers should register the factory in each user's profile.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderknownfoldersyncinfosourcefactory
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderKnownFolderSyncInfoSourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderKnownFolderSyncInfoSourceFactory
     * @type {Guid}
     */
    static IID => Guid("{aaee03a7-a7f6-50be-a9b0-8e82d0c81082}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKnownFolderSyncInfoSource"]

    /**
     * The method that File Explorer calls to obtain an instance of [IStorageProviderKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosource.md) for a given provider.
     * @remarks
     * Changing a property on the object after it has been returned by **GetKnownFolderSyncInfoSource** could result in undefined behavior. To update any property on [StorageProviderKnownFolderSyncInfo](storageproviderknownfoldersyncinfo.md), the cloud files provider should raise the [KnownFolderSyncInfoChanged](istorageproviderknownfoldersyncinfosource_knownfoldersyncinfochanged.md) event on **IStorageProviderKnownFolderSyncInfoSource** and be ready to provide a new **StorageProviderKnownFolderSyncInfo** object.
     * @returns {IStorageProviderKnownFolderSyncInfoSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderknownfoldersyncinfosourcefactory.getknownfoldersyncinfosource
     */
    GetKnownFolderSyncInfoSource() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderKnownFolderSyncInfoSource(result_)
    }
}

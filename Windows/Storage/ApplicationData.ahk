#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationData.ahk
#Include .\IApplicationData2.ahk
#Include .\IApplicationData3.ahk
#Include ..\Foundation\IClosable.ahk
#Include .\IApplicationDataStatics2.ahk
#Include .\IApplicationDataStatics.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\ApplicationData.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Provides access to the application data store. Application data consists of files and settings that are either local, roaming, or temporary.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationData.IID

    /**
     * Provides access to the app data store associated with the app's app package.
     * @remarks
     * Application folders and settings can be accessed through the `Windows.Storage.ApplicationData.Current` property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.current
     * @type {ApplicationData} 
     */
    static Current {
        get => ApplicationData.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Static method that returns the [ApplicationData](applicationdata.md) for a [User](../windows.system/user.md).
     * @param {User} user_ The [User](../windows.system/user.md) for which the [ApplicationData](applicationdata.md) is returned.
     * @returns {IAsyncOperation<ApplicationData>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.getforuserasync
     */
    static GetForUserAsync(user_) {
        if (!ApplicationData.HasProp("__IApplicationDataStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.ApplicationData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationDataStatics2.IID)
            ApplicationData.__IApplicationDataStatics2 := IApplicationDataStatics2(factoryPtr)
        }

        return ApplicationData.__IApplicationDataStatics2.GetForUserAsync(user_)
    }

    /**
     * 
     * @returns {ApplicationData} 
     */
    static get_Current() {
        if (!ApplicationData.HasProp("__IApplicationDataStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.ApplicationData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationDataStatics.IID)
            ApplicationData.__IApplicationDataStatics := IApplicationDataStatics(factoryPtr)
        }

        return ApplicationData.__IApplicationDataStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the version number of the application data in the app data store.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * Gets the application settings container in the local app data store.
     * @remarks
     * For both LocalSettings and [RoamingSettings](applicationdata_roamingsettings.md), the name of each setting can be 255 characters in length at most. Each setting can be up to 8K bytes in size and each composite setting can be up to 64K bytes in size.
     * 
     * The [Windows Runtime data types](/windows/desktop/WinRT/base-data-types) are supported for app settings.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.localsettings
     * @type {ApplicationDataContainer} 
     */
    LocalSettings {
        get => this.get_LocalSettings()
    }

    /**
     * Gets the application settings container in the roaming app data store.
     * @remarks
     * > [!WARNING]
     * > Roaming data and settings is no longer supported as of Windows 11. The recommended replacement is [Azure App Service](/azure/app-service/). Azure App Service is widely supported, well documented, reliable, and supports cross-platform/cross-ecosystem scenarios such as iOS, Android and web. Settings stored here no longer roam (as of Windows 11), but the settings store is still available.
     * > 
     * > This documentation applies to Windows 10 versions 1909 and lower.
     * 
     * See [LocalSettings](applicationdata_localsettings.md) for remarks and examples on accessing RoamingSettings.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.roamingsettings
     * @type {ApplicationDataContainer} 
     */
    RoamingSettings {
        get => this.get_RoamingSettings()
    }

    /**
     * Gets the root folder in the local app data store. This folder is backed up to the cloud.
     * @remarks
     * You can access files in the local app data store using the "ms-appdata:///local/" protocol. For example:
     * 
     * `<img src="ms-appdata:///local/myFile.png" alt="" />`
     * 
     * To access files in the app package, use [Windows.ApplicationModel.Package.Current.InstalledLocation](../windows.applicationmodel/package_installedlocation.md).
     * 
     * To request that Windows index your app data for search, create a folder named "Indexed" under this folder and store the files that you want indexed there. Windows indexes the file content and metadata (properties) in this "Indexed" folder and all its subfolders.
     * 
     * > [!NOTE]
     * > Content in the indexed folder will not be surfaced in a system search, but can be searched by the app. 
     * 
     * If the device that runs this app supports app data backup, any content placed on LocalFolder will be eligible to be backed up to the cloud. Therefore if you want to persist data and keep it local to the device you should consider using [LocalCacheFolder](applicationdata_localcachefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.localfolder
     * @type {StorageFolder} 
     */
    LocalFolder {
        get => this.get_LocalFolder()
    }

    /**
     * Gets the root folder in the roaming app data store.
     * @remarks
     * > [!WARNING]
     * > Roaming data and settings is no longer supported as of Windows 11. The recommended replacement is [Azure App Service](/azure/app-service/). Azure App Service is widely supported, well documented, reliable, and supports cross-platform/cross-ecosystem scenarios such as iOS, Android and web. Settings stored here no longer roam (as of Windows 11), but the settings store is still available.
     * > 
     * > This documentation applies to Windows 10 versions 1909 and lower.
     * 
     * The sync engine has restrictions on the file name conventions that you must follow to ensure the items in the roaming folder can roam. Be sure that your file and folder names do not contain leading whitespace. The sync engine may limit the total size of settings and files that can roam.
     * 
     * You can access files in the roaming app data store using the "ms-appdata:///roaming/" protocol. For example:
     * 
     * `<img src="ms-appdata:///roaming/myFile.png" alt="" />`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.roamingfolder
     * @type {StorageFolder} 
     */
    RoamingFolder {
        get => this.get_RoamingFolder()
    }

    /**
     * Gets the root folder in the temporary app data store.
     * @remarks
     * You can access files in the temporary app data store using the "ms-appdata:///temp/" protocol. For example:
     * 
     * `<img src="ms-appdata:///temp/myFile.png" alt="" />`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.temporaryfolder
     * @type {StorageFolder} 
     */
    TemporaryFolder {
        get => this.get_TemporaryFolder()
    }

    /**
     * Gets the maximum size of the data that can be synchronized to the cloud from the roaming app data store.
     * @remarks
     * > [!WARNING]
     * > Roaming data and settings is no longer supported as of Windows 11. The recommended replacement is [Azure App Service](/azure/app-service/). Azure App Service is widely supported, well documented, reliable, and supports cross-platform/cross-ecosystem scenarios such as iOS, Android and web. Settings stored here no longer roam (as of Windows 11), but the settings store is still available.
     * > 
     * > This documentation applies to Windows 10 versions 1909 and lower.
     * 
     * If the current size of the roaming data in the roaming app data store exceeds the maximum size specified by RoamingStorageQuota, the system suspends data replication for all apps in the package to the cloud until the current size no longer exceeds the maximum size.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.roamingstoragequota
     * @type {Integer} 
     */
    RoamingStorageQuota {
        get => this.get_RoamingStorageQuota()
    }

    /**
     * Gets the folder in the local app data store where you can save files that are not included in backup and restore.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.localcachefolder
     * @type {StorageFolder} 
     */
    LocalCacheFolder {
        get => this.get_LocalCacheFolder()
    }

    /**
     * Gets the root folder in the shared app data store.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.sharedlocalfolder
     * @type {StorageFolder} 
     */
    SharedLocalFolder {
        get => this.get_SharedLocalFolder()
    }

    /**
     * Occurs when roaming application data is synchronized.
     * @remarks
     * The event handler receives an [ApplicationData](applicationdata.md) object that provides access to the changed roaming data containers. For more information, see [Roaming data](/windows/uwp/design/app-settings/store-and-retrieve-app-data#roaming-data).
     * @type {TypedEventHandler<ApplicationData, IInspectable>}
    */
    OnDataChanged {
        get {
            if(!this.HasProp("__OnDataChanged")){
                this.__OnDataChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b5348b3b-5081-5ae9-8fa3-4d22d68fb0ea}"),
                    ApplicationData,
                    IInspectable
                )
                this.__OnDataChangedToken := this.add_DataChanged(this.__OnDataChanged.iface)
            }
            return this.__OnDataChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataChangedToken")) {
            this.remove_DataChanged(this.__OnDataChangedToken)
            this.__OnDataChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_Version()
    }

    /**
     * Sets the version number of the application data in the app data store.
     * @remarks
     * Versioning enables you to change the application data format used in a future release of your app without causing compatibility problems with previous releases of your app. The app checks the version of the data in the data store, and if it is less than the version the app expects, the app should update the application data to the new format and update the version.
     * 
     * It is strongly recommended that you use sequential and incrementing version numbers, starting at 1.
     * @param {Integer} desiredVersion The new version number.
     * @param {ApplicationDataSetVersionHandler} handler The set version event handler.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.setversionasync
     */
    SetVersionAsync(desiredVersion, handler) {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.SetVersionAsync(desiredVersion, handler)
    }

    /**
     * Removes all application data from the specified app data store.
     * 
     * > [!NOTE]
     * > ClearAsync(ApplicationDataLocality) method encounters an error if there are any open file handles. You should take care to close all open files prior to calling ClearAsync.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.clearasync
     */
    ClearAllAsync() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.ClearAllAsync()
    }

    /**
     * Removes all application data from the local, roaming, and temporary app data stores.
     * 
     * > [!NOTE]
     * > ClearAsync() method encounters an error if there are any open file handles. You should take care to close all open files prior to calling ClearAsync.
     * @param {Integer} locality 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.clearasync
     */
    ClearAsync(locality) {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.ClearAsync1(locality)
    }

    /**
     * 
     * @returns {ApplicationDataContainer} 
     */
    get_LocalSettings() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_LocalSettings()
    }

    /**
     * 
     * @returns {ApplicationDataContainer} 
     */
    get_RoamingSettings() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_RoamingSettings()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_LocalFolder() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_LocalFolder()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_RoamingFolder() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_RoamingFolder()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_TemporaryFolder() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_TemporaryFolder()
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationData, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataChanged(handler) {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.add_DataChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataChanged(token) {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.remove_DataChanged(token)
    }

    /**
     * Sends a [DataChanged](applicationdata_datachanged.md) event to all registered event handlers.
     * @remarks
     * You can use the SignalDataChanged method to fire a [DataChanged](applicationdata_datachanged.md) event that you can use to signal other code in your app to reload the local state.
     * 
     * The system automatically fires the [DataChanged](applicationdata_datachanged.md) event when the roaming state changes. After those changes are roamed to other devices, any instance of your app that is running on those devices will also be able to respond to the [DataChanged](applicationdata_datachanged.md) event by refreshing their roaming state.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.signaldatachanged
     */
    SignalDataChanged() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.SignalDataChanged()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoamingStorageQuota() {
        if (!this.HasProp("__IApplicationData")) {
            if ((queryResult := this.QueryInterface(IApplicationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData := IApplicationData(outPtr)
        }

        return this.__IApplicationData.get_RoamingStorageQuota()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_LocalCacheFolder() {
        if (!this.HasProp("__IApplicationData2")) {
            if ((queryResult := this.QueryInterface(IApplicationData2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData2 := IApplicationData2(outPtr)
        }

        return this.__IApplicationData2.get_LocalCacheFolder()
    }

    /**
     * Gets the specified subfolder of the shared storage folder for the publisher of the current app.
     * @remarks
     * The strong security model of Windows Runtime app typically prevents apps from sharing data among themselves. It can be useful, however, for apps from the same publisher to share files and settings on a per-user basis. As an app publisher, you can register your app to share a storage folder with other apps that you publish by adding extensions to the app manifest.
     * 
     * Here are some examples of how you can use this shared storage folder if you publish multiple apps.
     * 
     * 
     * + **Share files.** For example, if multiple apps use the same images or the same custom fonts, you can save these files in the shared storage folder.
     * + **Share the user's settings in a custom settings file.** For example, if multiple apps use temperatures, you can save a copy of the user's preference for Celsius or Fahrenheit in a custom settings file in the shared storage folder. We recommend that you also store the user's settings with each app or in another master location, however, since the user can clear the contents of the shared storage folder.
     * The shared storage folder for the app publisher is automatically provisioned when the user installs the first app from the publisher.
     * 
     * The shared storage folder has the following requirements and restrictions.
     * 
     * 
     * + Data in the shared storage folder is not backed up or roamed. Also, the user can clear the contents of the shared storage folder.
     * + You cannot use this feature to share data among apps from different publishers.
     * + You cannot use this feature to share data among different users.
     * + The shared storage folder does not have version management.
     * 
     * **To register an app to use the publisher's shared storage folder**
     * 
     * Manually enter XML similar to the following example in the app manifest to register subfolders. You don't have to create these subfolders. They are automatically provisioned for you.
     * 
     * ```xml
     * <Package>
     *     …
     *     <Extensions>
     *         …
     *         <Extension Category="windows.publisherCacheFolders">
     *             <PublisherCacheFolders>
     *                 <Folder Name="Folder1"/>
     *                 <Folder Name="Folder2"/>
     *             </PublisherCacheFolders>
     *         </Extension>
     *         …
     *     </Extensions>
     *     …
     * </Package>
     * 
     * ```
     * 
     * **To access data in the publisher's shared storage folder**
     * 
     * Call the GetPublisherCacheFolder method to get one of the registered subfolders from the shared storage folder.
     * 
     * Then use the properties and methods of the [StorageFolder](storagefolder.md) class to read and write files and subfolders in the shared folder.
     * 
     * Access to the shared storage folder has the following requirements and restrictions.
     * 
     * 
     * + There is no default subfolder. You have to specify a subfolder when you call the GetPublisherCacheFolder method.
     * + You can only access subfolders registered in the app manifest.
     * + You can't access the root of the shared storage folder.
     * 
     * **To clean up the data in the publisher's shared storage folder**
     * 
     * Call the [ClearPublisherCacheFolderAsync](applicationdata_clearpublishercachefolderasync_203747524.md) method to clear the files and subfolders from the specified subfolder of the shared storage folder for the publisher of the current app.
     * 
     * The shared storage folder is automatically cleaned up when the last app from the publisher is uninstalled.
     * 
     * Data saved in the shared storage folder is not linked to the app that saved it. When you uninstall the app that saved the data, the data remains in the shared storage folder until the last app from the same publisher is uninstalled.
     * @param {HSTRING} folderName The subfolder to get from the shared storage folder for the publisher of the current app.
     * @returns {StorageFolder} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.getpublishercachefolder
     */
    GetPublisherCacheFolder(folderName) {
        if (!this.HasProp("__IApplicationData3")) {
            if ((queryResult := this.QueryInterface(IApplicationData3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData3 := IApplicationData3(outPtr)
        }

        return this.__IApplicationData3.GetPublisherCacheFolder(folderName)
    }

    /**
     * Clears the files and subfolders from the specified subfolder of the shared storage folder for the publisher of the current app.
     * @remarks
     * For more info about how to share files and folders among apps from the same publisher, see [GetPublisherCacheFolder](applicationdata_getpublishercachefolder_572269963.md).
     * @param {HSTRING} folderName The subfolder of the shared storage folder for the publisher of the current app from which to clear the files and subfolders.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.clearpublishercachefolderasync
     */
    ClearPublisherCacheFolderAsync(folderName) {
        if (!this.HasProp("__IApplicationData3")) {
            if ((queryResult := this.QueryInterface(IApplicationData3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData3 := IApplicationData3(outPtr)
        }

        return this.__IApplicationData3.ClearPublisherCacheFolderAsync(folderName)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_SharedLocalFolder() {
        if (!this.HasProp("__IApplicationData3")) {
            if ((queryResult := this.QueryInterface(IApplicationData3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationData3 := IApplicationData3(outPtr)
        }

        return this.__IApplicationData3.get_SharedLocalFolder()
    }

    /**
     * > [!NOTE]
     * > This member is not implemented in C#.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdata.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}

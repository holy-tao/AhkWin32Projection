#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDownloadsFolderStatics2.ahk
#Include .\IDownloadsFolderStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Creates files and folders inside the Downloads folder.
 * @remarks
 * This class is static and cannot be instantiated. Call the methods directly instead.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class DownloadsFolder extends IInspectable {
;@region Static Methods
    /**
     * Creates a new file in the Downloads folder of a specific [User](../windows.system/user.md), and specifies what to do if a file with the same name already exists in the Downloads folder.
     * @param {User} user_ The [User](../windows.system/user.md) for which the file is created.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * 
     * If there is an existing file in the current folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfileforuserasync
     */
    static CreateFileForUserAsync(user_, desiredName) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics2.IID)
            DownloadsFolder.__IDownloadsFolderStatics2 := IDownloadsFolderStatics2(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics2.CreateFileForUserAsync(user_, desiredName)
    }

    /**
     * Creates a new subfolder in the Downloads folder of a specific [User](../windows.system/user.md), and specifies what to do if a subfolder with the same name already exists in the Downloads folder.
     * @param {User} user_ The [User](../windows.system/user.md) for which the folder is created.
     * @param {HSTRING} desiredName The desired name of the subfolder to create.
     * 
     * If there is an existing subfolder in the Downloads folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfolderforuserasync
     */
    static CreateFolderForUserAsync(user_, desiredName) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics2.IID)
            DownloadsFolder.__IDownloadsFolderStatics2 := IDownloadsFolderStatics2(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics2.CreateFolderForUserAsync(user_, desiredName)
    }

    /**
     * Creates a new file inside the Downloads folder of a specific [User](../windows.system/user.md).
     * @param {User} user_ The [User](../windows.system/user.md) for which the file is created.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * 
     * If a file with the specified name already exists, a similar but unique name will be used. For example, if *desiredName* is "MyFileName.jpg" and a file by that name already exists in the Downloads folder, the new file will be created with a name like "MyFileName (1).jpg" instead.
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfileforuserasync
     */
    static CreateFileForUserWithCollisionOptionAsync(user_, desiredName, option) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics2.IID)
            DownloadsFolder.__IDownloadsFolderStatics2 := IDownloadsFolderStatics2(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics2.CreateFileForUserWithCollisionOptionAsync(user_, desiredName, option)
    }

    /**
     * Creates a new subfolder inside the Downloads folder of a specific [User](../windows.system/user.md).
     * @param {User} user_ The [User](../windows.system/user.md) for which the folder is created.
     * @param {HSTRING} desiredName The desired name of the subfolder to create.
     * 
     * If a subfolder with the specified name already exists, a similar but unique name will be used. For example, if *desiredName* is "MyFolder" and a subfolder by that name already exists in the Downloads folder, the new subfolder will be created with a name like "MyFolder (1)" instead.
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfolderforuserasync
     */
    static CreateFolderForUserWithCollisionOptionAsync(user_, desiredName, option) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics2.IID)
            DownloadsFolder.__IDownloadsFolderStatics2 := IDownloadsFolderStatics2(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics2.CreateFolderForUserWithCollisionOptionAsync(user_, desiredName, option)
    }

    /**
     * Creates a new file in the Downloads folder, and specifies what to do if a file with the same name already exists in the Downloads folder.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * 
     * If there is an existing file in the current folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfileasync
     */
    static CreateFileAsync(desiredName) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics.IID)
            DownloadsFolder.__IDownloadsFolderStatics := IDownloadsFolderStatics(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics.CreateFileAsync(desiredName)
    }

    /**
     * Creates a new subfolder in the Downloads folder, and specifies what to do if a subfolder with the same name already exists in the Downloads folder.
     * @param {HSTRING} desiredName The desired name of the subfolder to create.
     * 
     * If there is an existing subfolder in the Downloads folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfolderasync
     */
    static CreateFolderAsync(desiredName) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics.IID)
            DownloadsFolder.__IDownloadsFolderStatics := IDownloadsFolderStatics(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics.CreateFolderAsync(desiredName)
    }

    /**
     * Creates a new file inside the Downloads folder.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * 
     * If a file with the specified name already exists, a similar but unique name will be used. For example, if *desiredName* is "MyFileName.jpg" and a file by that name already exists in the Downloads folder, the new file will be created with a name like "MyFileName (1).jpg" instead.
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfileasync
     */
    static CreateFileWithCollisionOptionAsync(desiredName, option) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics.IID)
            DownloadsFolder.__IDownloadsFolderStatics := IDownloadsFolderStatics(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics.CreateFileWithCollisionOptionAsync(desiredName, option)
    }

    /**
     * Creates a new subfolder in the Downloads folder.
     * @param {HSTRING} desiredName The desired name of the subfolder to create.
     * 
     * If a subfolder with the specified name already exists, a similar but unique name will be used. For example, if *desiredName* is "MyFolder" and a subfolder by that name already exists in the Downloads folder, the new subfolder will be created with a name like "MyFolder (1)" instead.
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.downloadsfolder.createfolderasync
     */
    static CreateFolderWithCollisionOptionAsync(desiredName, option) {
        if (!DownloadsFolder.HasProp("__IDownloadsFolderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.DownloadsFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDownloadsFolderStatics.IID)
            DownloadsFolder.__IDownloadsFolderStatics := IDownloadsFolderStatics(factoryPtr)
        }

        return DownloadsFolder.__IDownloadsFolderStatics.CreateFolderWithCollisionOptionAsync(desiredName, option)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

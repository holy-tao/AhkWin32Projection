#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProvider.ahk
#Include .\IStorageProvider2.ahk
#Include ..\..\Guid.ahk

/**
 * Contains info about the service that stores files and folders. Files and folders may be stored either by the local file system or by a remote service like Microsoft OneDrive.
 * @remarks
 * For example, if a file or folder is stored on Microsoft OneDrive, **StorageProvider** will contain a display name, id, and thumbnail for Microsoft OneDrive.
 * 
 * Typically, you access **StorageProvider** objects as the result of calls to asynchronous methods and functions. They can also be accessed through properties of other file and folder objects such as the [IStorageItemPropertiesWithProvider.Provider](istorageitempropertieswithprovider_provider.md), [StorageFile.Provider](storagefile_provider.md), and [StorageFolder.Provider](storagefolder_provider.md) properties.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storageprovider
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an identifier for the current provider of files and folders.
     * @remarks
     * The ID that is returned will depend on your provider. Examples include `Local`, `Network`, `OneDrive`, or `Computer`.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storageprovider.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a user-friendly name for the current provider of files and folders.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storageprovider.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IStorageProvider")) {
            if ((queryResult := this.QueryInterface(IStorageProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProvider := IStorageProvider(outPtr)
        }

        return this.__IStorageProvider.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IStorageProvider")) {
            if ((queryResult := this.QueryInterface(IStorageProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProvider := IStorageProvider(outPtr)
        }

        return this.__IStorageProvider.get_DisplayName()
    }

    /**
     * Determines if a property is supported by a cloud storage provider.
     * @param {HSTRING} propertyCanonicalName The name of the property. E.g., "System.Photo.DateTaken" or "System.Music.Artist"
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storageprovider.ispropertysupportedforpartialfileasync
     */
    IsPropertySupportedForPartialFileAsync(propertyCanonicalName) {
        if (!this.HasProp("__IStorageProvider2")) {
            if ((queryResult := this.QueryInterface(IStorageProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProvider2 := IStorageProvider2(outPtr)
        }

        return this.__IStorageProvider2.IsPropertySupportedForPartialFileAsync(propertyCanonicalName)
    }

;@endregion Instance Methods
}

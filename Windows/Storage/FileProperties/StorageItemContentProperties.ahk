#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemContentProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the content-related properties of an item (like a file or folder).
 * @remarks
 * You can get a StorageItemContentProperties object using the [Properties](../windows.storage/istorageitemproperties_properties.md) property that is available on the following objects:
 * 
 * + [StorageFile.Properties](../windows.storage/storagefile_properties.md) property
 * + [StorageFolder.Properties](../windows.storage/storagefolder_properties.md) property
 * + [FileInformation.Properties](../windows.storage.bulkaccess/fileinformation_properties.md) property
 * + [FolderInformation.Properties](../windows.storage.bulkaccess/folderinformation_properties.md) property
 * 
 * 
 * > [!NOTE]
 * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
 * 
 * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class StorageItemContentProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageItemContentProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageItemContentProperties.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the music properties of the item (like a file of folder).
     * @returns {IAsyncOperation<MusicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.getmusicpropertiesasync
     */
    GetMusicPropertiesAsync() {
        if (!this.HasProp("__IStorageItemContentProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemContentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemContentProperties := IStorageItemContentProperties(outPtr)
        }

        return this.__IStorageItemContentProperties.GetMusicPropertiesAsync()
    }

    /**
     * Retrieves the video properties of the item (like a file of folder).
     * @returns {IAsyncOperation<VideoProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.getvideopropertiesasync
     */
    GetVideoPropertiesAsync() {
        if (!this.HasProp("__IStorageItemContentProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemContentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemContentProperties := IStorageItemContentProperties(outPtr)
        }

        return this.__IStorageItemContentProperties.GetVideoPropertiesAsync()
    }

    /**
     * Retrieves the image properties of the item (like a file of folder).
     * @returns {IAsyncOperation<ImageProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.getimagepropertiesasync
     */
    GetImagePropertiesAsync() {
        if (!this.HasProp("__IStorageItemContentProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemContentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemContentProperties := IStorageItemContentProperties(outPtr)
        }

        return this.__IStorageItemContentProperties.GetImagePropertiesAsync()
    }

    /**
     * Retrieves the document properties of the item (like a file of folder).
     * @remarks
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the [documentProperties](documentproperties.md) object when it is returned.
     * @returns {IAsyncOperation<DocumentProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.getdocumentpropertiesasync
     */
    GetDocumentPropertiesAsync() {
        if (!this.HasProp("__IStorageItemContentProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemContentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemContentProperties := IStorageItemContentProperties(outPtr)
        }

        return this.__IStorageItemContentProperties.GetDocumentPropertiesAsync()
    }

    /**
     * Retrieves the specified properties associated with the item.
     * @remarks
     * Expando properties can be retrieved by RetrievePropertiesAsync. See the remarks under [SavePropertiesAsync(IIterable(IKeyValuePair))](storageitemcontentproperties_savepropertiesasync_132989229.md).
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve. The list of supported properties can be found on the [Core properties page](/windows/desktop/properties/core-bumper).
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.retrievepropertiesasync
     */
    RetrievePropertiesAsync(propertiesToRetrieve) {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.RetrievePropertiesAsync(propertiesToRetrieve)
    }

    /**
     * Saves all properties associated with the item.
     * @remarks
     * If any one of the property values is invalid, none of the values will be saved.
     * @param {IIterable<IKeyValuePair<HSTRING, IInspectable>>} propertiesToSave 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.savepropertiesasync
     */
    SavePropertiesAsync(propertiesToSave) {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.SavePropertiesAsync(propertiesToSave)
    }

    /**
     * Saves the specified properties and values associated with the item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemcontentproperties.savepropertiesasync
     */
    SavePropertiesAsyncOverloadDefault() {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.SavePropertiesAsyncOverloadDefault()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBasicProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the basic properties, like the size of the item or the date the item was last modified, of the item (like a file or folder).
 * @remarks
 * You can access a BasicProperties object asynchronously using the [GetBasicPropertiesAsync](../windows.storage/istorageitem_getbasicpropertiesasync_375277280.md) method of an item (like a file of folder), or synchronously using the [BasicProperties](../windows.storage.bulkaccess/istorageiteminformation_basicproperties.md) property if it is available.
 * 
 * You can get a BasicProperties object using any of the following methods and properties:
 * 
 * + [storageFile.getBasicPropertiesAsync](../windows.storage/storagefile_getbasicpropertiesasync_375277280.md) method
 * + [storageFolder.getBasicPropertiesAsync](../windows.storage/storagefolder_getbasicpropertiesasync_375277280.md) method
 * + [FileInformation.basicProperties](../windows.storage.bulkaccess/fileinformation_basicproperties.md) property
 * + [FolderInformation.basicProperties](../windows.storage.bulkaccess/folderinformation_basicproperties.md) property
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class BasicProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBasicProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBasicProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size of the file in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Gets the timestamp of the last time the file was modified.
     * @remarks
     * If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. In JavaScript, for example, 0 translates to December 16, 1600. You should always check that this property is a real value and not 0.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.datemodified
     * @type {DateTime} 
     */
    DateModified {
        get => this.get_DateModified()
    }

    /**
     * Gets the most relevant date for the item.
     * @remarks
     * This property lets you get the most relevant date for an item without the need to access item-specific properties.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.itemdate
     * @type {DateTime} 
     */
    ItemDate {
        get => this.get_ItemDate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IBasicProperties")) {
            if ((queryResult := this.QueryInterface(IBasicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBasicProperties := IBasicProperties(outPtr)
        }

        return this.__IBasicProperties.get_Size()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateModified() {
        if (!this.HasProp("__IBasicProperties")) {
            if ((queryResult := this.QueryInterface(IBasicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBasicProperties := IBasicProperties(outPtr)
        }

        return this.__IBasicProperties.get_DateModified()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ItemDate() {
        if (!this.HasProp("__IBasicProperties")) {
            if ((queryResult := this.QueryInterface(IBasicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBasicProperties := IBasicProperties(outPtr)
        }

        return this.__IBasicProperties.get_ItemDate()
    }

    /**
     * Retrieves the specified properties associated with the item.
     * @remarks
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.retrievepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.savepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.basicproperties.savepropertiesasync
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

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDocumentProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the document-related properties of an item (like a file or folder).
 * @remarks
 * You can access a DocumentProperties object asynchronously using the [GetDocumentPropertiesAsync](storageitemcontentproperties_getdocumentpropertiesasync_124814975.md) method from the [Properties](../windows.storage/istorageitemproperties_properties.md) property of an item (like a file of folder), or synchronously using the [DocumentProperties](../windows.storage.bulkaccess/istorageiteminformation_documentproperties.md) property if it is available.
 * You can get a DocumentProperties object using any of the following methods and properties:
 * 
 * + [FileInformation.documentProperties](../windows.storage.bulkaccess/fileinformation_documentproperties.md) property
 * + [FolderInformation.documentProperties](../windows.storage.bulkaccess/folderinformation_documentproperties.md) property
 * + [StorageItemContentProperties.getDocumentPropertiesAsync](storageitemcontentproperties_getdocumentpropertiesasync_124814975.md) method, which can be accessed using the [Properties](../windows.storage/istorageitemproperties_properties.md) property, if it is available.
 * 
 * 
 * > [!NOTE]
 * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
 * 
 * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class DocumentProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDocumentProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDocumentProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of the document's authors.
     * @remarks
     * This property is read-only. It returns a collection, and you can't delete or replace the collection itself. The contents of the collection, however, are not read-only. You can add items to the collection, remove items from the collection, and change existing items in the collection. Call the **SavePropertiesAsync** method of the parent class to save the updated contents of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.author
     * @type {IVector<HSTRING>} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * Gets or sets the title of the document.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the collection of keywords associated with the document.
     * @remarks
     * This property is read-only, similar to the [Author](documentproperties_author.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.keywords
     * @type {IVector<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * Gets or sets the comments associated with the document.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
        set => this.put_Comment(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Author() {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.get_Author()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.put_Title(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Keywords() {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.get_Keywords()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.get_Comment()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Comment(value) {
        if (!this.HasProp("__IDocumentProperties")) {
            if ((queryResult := this.QueryInterface(IDocumentProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDocumentProperties := IDocumentProperties(outPtr)
        }

        return this.__IDocumentProperties.put_Comment(value)
    }

    /**
     * Retrieves the specified properties associated with the item.
     * @remarks
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.retrievepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.savepropertiesasync
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
     * @remarks
     * To save file properties, create a **[PropertySet](/uwp/api/Windows.Foundation.Collections.PropertySet#Windows_Foundation_Collections_PropertySet__ctor)** and **[Add](/uwp/api/windows.foundation.collections.propertyset#Windows_Foundation_Collections_PropertySet_Add__0__1_)** the file properties to be saved. Once added, use **SavePropertiesAsync** to save the changes.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.documentproperties.savepropertiesasync
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

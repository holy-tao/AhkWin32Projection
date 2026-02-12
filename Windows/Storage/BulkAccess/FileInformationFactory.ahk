#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileInformationFactory.ahk
#Include .\IFileInformationFactoryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to load information about files and folders from the results of a query and to bind these file system items to JavaScript [ListView](/previous-versions/windows/apps/br211837(v=win.10)) or XAML [ListView](../windows.ui.xaml.controls/listview.md) and [GridView](../windows.ui.xaml.controls/gridview.md) controls. After information is loaded, an app can then access that information quickly using synchronous operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class FileInformationFactory extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileInformationFactory

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileInformationFactory.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [FileInformationFactory](fileinformationfactory.md) object that retrieves information about the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects in the specified query result.
     * @remarks
     * If the query specified [SetThumbnailPrefetch](../windows.storage.search/queryoptions_setthumbnailprefetch_2085714012.md) options, those options are overridden by options requested in any of the FileInformationFactory constructors.
     * @param {IStorageQueryResultBase} queryResult The result of a query of files and folders on the system.
     * 
     * To learn about query result objects, see [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), and [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md).
     * @param {Integer} mode_ A value that indicates the type of thumbnail view to retrieve for the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md).
     * @returns {FileInformationFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.#ctor
     */
    static CreateWithMode(queryResult, mode_) {
        if (!FileInformationFactory.HasProp("__IFileInformationFactoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.BulkAccess.FileInformationFactory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileInformationFactoryFactory.IID)
            FileInformationFactory.__IFileInformationFactoryFactory := IFileInformationFactoryFactory(factoryPtr)
        }

        return FileInformationFactory.__IFileInformationFactoryFactory.CreateWithMode(queryResult, mode_)
    }

    /**
     * Creates a new [FileInformationFactory](fileinformationfactory.md) object that retrieves information about the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects in the specified query result and that specifies the requested size for thumbnails that are retrieved for the objects.
     * @param {IStorageQueryResultBase} queryResult The result of a query of files and folders on the system.
     * 
     * To learn about query result objects, see [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), and [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md).
     * @param {Integer} mode_ A value that indicates the type of thumbnail view to retrieve for the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md).
     * @param {Integer} requestedThumbnailSize The requested minimum size, in pixels, of the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) thumbnails.
     * 
     * If thumbnails are not required for [IStorageItemInformation](istorageiteminformation.md) objects, set the *requestedSize* to 0.
     * @returns {FileInformationFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.#ctor
     */
    static CreateWithModeAndSize(queryResult, mode_, requestedThumbnailSize) {
        if (!FileInformationFactory.HasProp("__IFileInformationFactoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.BulkAccess.FileInformationFactory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileInformationFactoryFactory.IID)
            FileInformationFactory.__IFileInformationFactoryFactory := IFileInformationFactoryFactory(factoryPtr)
        }

        return FileInformationFactory.__IFileInformationFactoryFactory.CreateWithModeAndSize(queryResult, mode_, requestedThumbnailSize)
    }

    /**
     * Creates a new [FileInformationFactory](fileinformationfactory.md) object that retrieves information about the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects in the specified query result, and that specifies the requested size and options for thumbnails that are retrieved for the objects.
     * @param {IStorageQueryResultBase} queryResult The result of a query of files and folders on the system.
     * 
     * To learn about query result objects, see [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), and [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md).
     * @param {Integer} mode_ A value that indicates the type of thumbnail view to retrieve for the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md).
     * @param {Integer} requestedThumbnailSize The requested minimum size, in pixels, of the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) thumbnails.
     * 
     * If thumbnails are not required for [IStorageItemInformation](istorageiteminformation.md) objects, set the *requestedSize* to 0.
     * @param {Integer} thumbnailOptions_ The thumbnail retrieval options.
     * 
     * If you're using [FileInformationFactory](fileinformationfactory.md) with the JavaScript [ListView](/previous-versions/windows/apps/br211837(v=win.10)) or XAML [ListView](../windows.ui.xaml.controls/listview.md) and [GridView](../windows.ui.xaml.controls/gridview.md) controls, don't specify [ThumbnailOptions.ReturnOnlyIfCached](../windows.storage.fileproperties/thumbnailoptions.md) because this mode may prevent the control from being correctly populated with thumbnails.
     * @returns {FileInformationFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.#ctor
     */
    static CreateWithModeAndSizeAndOptions(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_) {
        if (!FileInformationFactory.HasProp("__IFileInformationFactoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.BulkAccess.FileInformationFactory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileInformationFactoryFactory.IID)
            FileInformationFactory.__IFileInformationFactoryFactory := IFileInformationFactoryFactory(factoryPtr)
        }

        return FileInformationFactory.__IFileInformationFactoryFactory.CreateWithModeAndSizeAndOptions(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_)
    }

    /**
     * Creates a new [FileInformationFactory](fileinformationfactory.md) object that retrieves information about the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects in the specified query result, specifies the requested size and options for thumbnails that are retrieved for the objects, and indicates whether to delay loading information.
     * @param {IStorageQueryResultBase} queryResult The result of a query of files and folders on the system.
     * 
     * To learn about query result objects, see [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), and [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md).
     * @param {Integer} mode_ A value that indicates the type of thumbnail view to retrieve for the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md).
     * @param {Integer} requestedThumbnailSize The requested minimum size, in pixels, of the [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) thumbnails.
     * 
     * If thumbnails are not required for [IStorageItemInformation](istorageiteminformation.md) objects, set the *requestedSize* to 0.
     * @param {Integer} thumbnailOptions_ The thumbnail retrieval options.
     * 
     * If you're using [FileInformationFactory](fileinformationfactory.md) with the JavaScript [ListView](/previous-versions/windows/apps/br211837(v=win.10)) or XAML [ListView](../windows.ui.xaml.controls/listview.md) and [GridView](../windows.ui.xaml.controls/gridview.md) controls, don't specify [ThumbnailOptions.ReturnOnlyIfCached](../windows.storage.fileproperties/thumbnailoptions.md) because this mode may prevent the control from being correctly populated with thumbnails.
     * @param {Boolean} delayLoad True to delay loading information; otherwise false. By default, this option is false and delay loading is not used.
     * 
     * If *delayLoad* is true, it authorizes the [FileInformationFactory](fileinformationfactory.md) to return [IStorageItemInformation](istorageiteminformation.md) objects before thumbnails are available. Subsequently, the system fires a [ThumbnailUpdated](istorageiteminformation_thumbnailupdated.md) event when thumbnails become available. Using delay loading is recommended because it makes apps seem more responsive.
     * 
     * If *delayLoad* is false (as it is by default), the system will require more time to retrieve [IStorageItemInformation](istorageiteminformation.md) objects, but after the objects are retrieved all cached thumbnails will be accessible synchronously. Thumbnails that are not cached must still be accessed asynchronously in response to the [ThumbnailUpdated](istorageiteminformation_thumbnailupdated.md) event.
     * @returns {FileInformationFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.#ctor
     */
    static CreateWithModeAndSizeAndOptionsAndFlags(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_, delayLoad) {
        if (!FileInformationFactory.HasProp("__IFileInformationFactoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.BulkAccess.FileInformationFactory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileInformationFactoryFactory.IID)
            FileInformationFactory.__IFileInformationFactoryFactory := IFileInformationFactoryFactory(factoryPtr)
        }

        return FileInformationFactory.__IFileInformationFactoryFactory.CreateWithModeAndSizeAndOptionsAndFlags(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_, delayLoad)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves a collection of [IStorageItemInformation](fileinformation.md) objects that contain information about all the items in the collection.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<IStorageItemInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getitemsasync
     */
    GetItemsAsync(startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetItemsAsync(startIndex, maxItemsToRetrieve)
    }

    /**
     * Retrieves a collection of [IStorageItemInformation](fileinformation.md) objects that contain information about all the items in the collection.
     * @returns {IAsyncOperation<IVectorView<IStorageItemInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getitemsasync
     */
    GetItemsAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetItemsAsyncDefaultStartAndCount()
    }

    /**
     * Retrieves a collection of [FileInformation](fileinformation.md) objects that contain information about all [StorageFile](../windows.storage/storagefile.md) objects in a collection.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<FileInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getfilesasync
     */
    GetFilesAsync(startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetFilesAsync(startIndex, maxItemsToRetrieve)
    }

    /**
     * Retrieves a collection of [FileInformation](fileinformation.md) objects that contain information about all [StorageFile](../windows.storage/storagefile.md) objects in a collection.
     * @returns {IAsyncOperation<IVectorView<FileInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getfilesasync
     */
    GetFilesAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetFilesAsyncDefaultStartAndCount()
    }

    /**
     * Retrieves a collection of [FolderInformation](folderinformation.md) objects that contain information about all [StorageFolder](../windows.storage/storagefolder.md) objects in a collection.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<FolderInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getfoldersasync
     */
    GetFoldersAsync(startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetFoldersAsync(startIndex, maxItemsToRetrieve)
    }

    /**
     * Retrieves a collection of [FolderInformation](folderinformation.md) objects that contain information about all [StorageFolder](../windows.storage/storagefolder.md) objects in a collection.
     * @returns {IAsyncOperation<IVectorView<FolderInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getfoldersasync
     */
    GetFoldersAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetFoldersAsyncDefaultStartAndCount()
    }

    /**
     * Gets a virtualized vector of [IStorageItemInformation](istorageiteminformation.md) objects that can be bound to [ListView](../windows.ui.xaml.controls/listview.md) or [GridView](../windows.ui.xaml.controls/gridview.md) controls in C#, C++, and VB.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getvirtualizeditemsvector
     */
    GetVirtualizedItemsVector() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetVirtualizedItemsVector()
    }

    /**
     * Gets a virtualized vector of [IStorageItemInformation](istorageiteminformation.md) objects that can be bound to [ListView](../windows.ui.xaml.controls/listview.md) or [GridView](../windows.ui.xaml.controls/gridview.md) controls in C#, C++, and VB.
     * @remarks
     * A virtualized vector can return **null** for some items before it populates their value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getvirtualizedfilesvector
     */
    GetVirtualizedFilesVector() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetVirtualizedFilesVector()
    }

    /**
     * Gets a virtualized vector of [IStorageItemInformation](istorageiteminformation.md) objects that can be bound to [ListView](../windows.ui.xaml.controls/listview.md) or [GridView](../windows.ui.xaml.controls/gridview.md) controls in C#, C++, and VB.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformationfactory.getvirtualizedfoldersvector
     */
    GetVirtualizedFoldersVector() {
        if (!this.HasProp("__IFileInformationFactory")) {
            if ((queryResult := this.QueryInterface(IFileInformationFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileInformationFactory := IFileInformationFactory(outPtr)
        }

        return this.__IFileInformationFactory.GetVirtualizedFoldersVector()
    }

;@endregion Instance Methods
}

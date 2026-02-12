#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\StorageFileQueryResult.ahk
#Include .\StorageFolderQueryResult.ahk
#Include .\StorageItemQueryResult.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\StorageFile.ahk
#Include ..\StorageFolder.ahk
#Include ..\IStorageItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides methods to create search queries and retrieve files from a folder. This interface is implemented by [StorageFolder](../windows.storage/storagefolder.md) objects, which can represent file system folders, libraries, or virtual folders that are automatically generated when queries are created using group-based [CommonFolderQuery](commonfolderquery.md) values like [GroupByAlbum](commonfolderquery.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageFolderQueryOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolderQueryOperations
     * @type {Guid}
     */
    static IID => Guid("{cb43ccc9-446b-4a4f-be97-757771be5203}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndexedStateAsync", "CreateFileQueryOverloadDefault", "CreateFileQuery1", "CreateFileQueryWithOptions", "CreateFolderQueryOverloadDefault", "CreateFolderQuery1", "CreateFolderQueryWithOptions", "CreateItemQuery", "CreateItemQueryWithOptions", "GetFilesAsync", "GetFilesAsyncOverloadDefaultStartAndCount", "GetFoldersAsync", "GetFoldersAsyncOverloadDefaultStartAndCount", "GetItemsAsync", "AreQueryOptionsSupported", "IsCommonFolderQuerySupported", "IsCommonFileQuerySupported"]

    /**
     * Retrieves a value that indicates the indexed state of the [StorageFolder](../windows.storage/storagefolder.md) location associated with the query.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getindexedstateasync
     */
    GetIndexedStateAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * Retrieves an object with the specified options for enumerating the storage location in a folder and subscribing to events that fire when the contents of the storage location change.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfilequery
     */
    CreateFileQueryOverloadDefault() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFileQueryResult(value)
    }

    /**
     * Retrieves an object for enumerating the files in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @param {Integer} query 
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfilequery
     */
    CreateFileQuery1(query) {
        result := ComCall(8, this, "int", query, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFileQueryResult(value)
    }

    /**
     * Retrieves an object with the specified options for enumerating the files in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @param {QueryOptions} queryOptions_ The options for filtering the query results.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfilequerywithoptions
     */
    CreateFileQueryWithOptions(queryOptions_) {
        result := ComCall(9, this, "ptr", queryOptions_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFileQueryResult(value)
    }

    /**
     * Retrieves an object with the specified options for enumerating folders in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfolderquery
     */
    CreateFolderQueryOverloadDefault() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolderQueryResult(value)
    }

    /**
     * Retrieves an object for enumerating folders in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @param {Integer} query 
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfolderquery
     */
    CreateFolderQuery1(query) {
        result := ComCall(11, this, "int", query, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolderQueryResult(value)
    }

    /**
     * Retrieves an object with the specified options for enumerating folders in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @remarks
     * You can use [QueryOptions](queryoptions.md) and [CreateFileQueryWithOptions](istoragefolderqueryoperations_createfilequerywithoptions_2038131323.md) to create an indexed backed file query that lets you get properties that rely on another app's property handler. For more information see [QueryOptions](queryoptions.md).
     * @param {QueryOptions} queryOptions_ The options for filtering the query results.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createfolderquerywithoptions
     */
    CreateFolderQueryWithOptions(queryOptions_) {
        result := ComCall(12, this, "ptr", queryOptions_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolderQueryResult(value)
    }

    /**
     * Retrieves an object for performing shallow enumerations of the files and folders in a storage location. An app can use the object to enumerate the items in a storage location and subscribe to events that fire when the contents of the storage location change.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createitemquery
     */
    CreateItemQuery() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemQueryResult(value)
    }

    /**
     * Retrieves an object with the specified options for enumerating the files and folders in a storage location and subscribing to events that fire when the contents of the storage location change.
     * @remarks
     * Don't set [QueryOptions.FolderDepth](queryoptions_folderdepth.md) to [FolderDepth.Deep](folderdepth.md); deep queries do not work if you are querying files in a Digital Living Network Alliance (DLNA) device.
     * @param {QueryOptions} queryOptions_ The options for filtering the query results.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.createitemquerywithoptions
     */
    CreateItemQueryWithOptions(queryOptions_) {
        result := ComCall(14, this, "ptr", queryOptions_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemQueryResult(value)
    }

    /**
     * Retrieves a list of files based on the specified query (shallow enumeration). This returns a snapshot of the files at a point in time and does not allow you to keep track of changes through events.
     * @param {Integer} query The type of file query to perform.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getfilesasync
     */
    GetFilesAsync(query, startIndex, maxItemsToRetrieve) {
        result := ComCall(15, this, "int", query, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }

    /**
     * Retrieves a list of files based on the specified query (shallow enumeration). This returns a snapshot of the files at a point in time and does not allow you to keep track of changes through events.
     * @param {Integer} query The type of file query to perform.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getfilesasync
     */
    GetFilesAsyncOverloadDefaultStartAndCount(query) {
        result := ComCall(16, this, "int", query, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }

    /**
     * Retrieves a list of folders and file groups based on a specified folder query. This returns a snapshot of the folders or file groups at a point in time and does not allow you to keep track of changes through events.
     * @param {Integer} query The type of folder query to perform.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getfoldersasync
     */
    GetFoldersAsync(query, startIndex, maxItemsToRetrieve) {
        result := ComCall(17, this, "int", query, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFolder), operation)
    }

    /**
     * Retrieves a list of folders and file groups based on a specified folder query. This returns a snapshot of the folders or file groups at a point in time and does not allow you to keep track of changes through events.
     * @param {Integer} query The type of folder query to perform.
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getfoldersasync
     */
    GetFoldersAsyncOverloadDefaultStartAndCount(query) {
        result := ComCall(18, this, "int", query, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFolder), operation)
    }

    /**
     * Retrieves a list items like files, folders, or file groups, in a specified range (shallow enumeration).
     * @param {Integer} startIndex The zero-based index of the first item in the range. This parameter defaults to 0.
     * @param {Integer} maxItemsToRetrieve The maximum number of items to retrieve. Use -1 to retrieve all items.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.getitemsasync
     */
    GetItemsAsync(startIndex, maxItemsToRetrieve) {
        result := ComCall(19, this, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItem), operation)
    }

    /**
     * Verifies whether the folder supports the specified search query options (returns true or false).
     * @remarks
     * Not all locations support all query options. Because folders can be retrieved by the picker and you can't control the location, you can use this method to determine whether the location supports a particular query option.
     * 
     * Folders in a library or the HomeGroup support all query options. Other locations only support the following options:
     * + A shallow enumeration, such as [CommonFileQuery.DefaultQuery](commonfilequery.md) or [CommonFolderQuery.DefaultQuery](commonfolderquery.md), or a [QueryOptions](queryoptions.md) class that was created with no constructor arguments.
     * + A deep, flat list of files sorted by name, such as [CommonFileQuery.orderByName](commonfilequery.md) or the equivalent [QueryOptions](queryoptions.md) class.
     * + A deep, flat list of files sorted by search rank, such as [CommonFileQuery.orderBySearchRank](commonfilequery.md) or the equivalent [QueryOptions](queryoptions.md) class.
     * @param {QueryOptions} queryOptions_ The search query options to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.arequeryoptionssupported
     */
    AreQueryOptionsSupported(queryOptions_) {
        result := ComCall(20, this, "ptr", queryOptions_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Verifies whether this folder supports the specified folder query (returns true or false).
     * @remarks
     * Not all locations support all query options, for more detail refer to [IsCommonFileQuerySupported](istoragefolderqueryoperations_iscommonfilequerysupported_1848755604.md).
     * @param {Integer} query The folder query to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.iscommonfolderquerysupported
     */
    IsCommonFolderQuerySupported(query) {
        result := ComCall(21, this, "int", query, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Verifies whether this folder supports the specified file query (returns true or false).
     * @remarks
     * Not all locations support all query options. Because files can be retrieved by the picker and you can't control the location, you can use this method to determine whether the location supports a particular query option.
     * 
     * Folders in a library or the HomeGroup support all query options. Other locations only support the following options:
     * + A shallow enumeration, such as [CommonFileQuery.DefaultQuery](commonfilequery.md) or [CommonFolderQuery.DefaultQuery](commonfolderquery.md), or a [QueryOptions](queryoptions.md) class that was created with no constructor arguments.
     * + A deep, flat list of files sorted by name, such as [CommonFileQuery.orderByName](commonfilequery.md) or the equivalent [QueryOptions](queryoptions.md) class.
     * + A deep, flat list of files sorted by search rank, such as [CommonFileQuery.orderBySearchRank](commonfilequery.md) or the equivalent [QueryOptions](queryoptions.md) class.
     * @param {Integer} query The file query to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragefolderqueryoperations.iscommonfilequerysupported
     */
    IsCommonFileQuerySupported(query) {
        result := ComCall(22, this, "int", query, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

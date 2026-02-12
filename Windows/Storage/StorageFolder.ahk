#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageFolder.ahk
#Include .\IStorageItem.ahk
#Include Search\IStorageFolderQueryOperations.ahk
#Include .\IStorageItemProperties.ahk
#Include .\IStorageItemProperties2.ahk
#Include .\IStorageItem2.ahk
#Include .\IStorageFolder2.ahk
#Include .\IStorageItemPropertiesWithProvider.ahk
#Include .\IStorageFolder3.ahk
#Include .\IStorageFolderStatics.ahk
#Include .\IStorageFolderStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Manages folders and their contents and provides information about them.
 * @remarks
 * Typically you get StorageFolder objects as the return value of asynchronous method calls. For example, the static method [GetFolderFromPathAsync](storagefolder_getfolderfrompathasync_1337535799.md) returns a StorageFolder that represents the specified folder.
 * 
 * Note that when you call a file picker to let the user pick a folder, the file picker returns the folder as a StorageFolder.
 * 
 * There is not currently a "MoveAsync" or similar method. One simple implementation of moving a folder might be to get the desired folder, copy it to the desired location, and then delete the original folder.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageFolder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageFolder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageFolder.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the folder that has the specified absolute path in the file system.
     * @param {HSTRING} path_ The absolute path in the file system (not the Uri) of the folder to get.
     * 
     * If your path uses slashes, make sure you use backslashes (\\). Forward slashes (/) are not accepted by this method.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfolderfrompathasync
     */
    static GetFolderFromPathAsync(path_) {
        if (!StorageFolder.HasProp("__IStorageFolderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFolderStatics.IID)
            StorageFolder.__IStorageFolderStatics := IStorageFolderStatics(factoryPtr)
        }

        return StorageFolder.__IStorageFolderStatics.GetFolderFromPathAsync(path_)
    }

    /**
     * Gets the [StorageFolder](storagefolder.md) based on an absolute path in the file system for a given user.
     * @remarks
     * This method is Multi-User Aware (MUA).
     * @param {User} user_ The User for which the [StorageFolder](storagefolder.md) is returned.
     * @param {HSTRING} path_ The absolute path in the file system (not the Uri) of the folder to get.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfolderfrompathforuserasync
     */
    static GetFolderFromPathForUserAsync(user_, path_) {
        if (!StorageFolder.HasProp("__IStorageFolderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFolder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFolderStatics2.IID)
            StorageFolder.__IStorageFolderStatics2 := IStorageFolderStatics2(factoryPtr)
        }

        return StorageFolder.__IStorageFolderStatics2.GetFolderFromPathForUserAsync(user_, path_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the full path of the current folder in the file system, if the path is available.
     * @remarks
     * Don't rely on this property to access a folder, because a file system path is not available for some folders. For example, in the following cases, the folder may not have a file system path, or the file system path may not be available.
     * 
     * + The folder represents a container for a group of files (for example, the return value from some overloads of the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method) instead of an actual folder in the file system.
     * + The folder is backed by a URI.
     * + The folder was picked by using a file picker.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the attributes of the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.attributes
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the date and time that the current folder was created.
     * @remarks
     * If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. In JavaScript, for example, 0 translates to December 16, 1600. You should always check that this property is a real value and not 0.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Gets the user-friendly name of the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the user-friendly description of the type of the folder; for example, `JPEG image`.
     * @remarks
     * For an ordinary folder in the file system, the DisplayType property returns `File folder`.
     * 
     * Here are some examples of the value of the DisplayType property when you use a [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) value other than **DefaultQuery**.
     * 
     * + If you specify **GroupByType**, the value of DisplayType may be `JPEG image` or `PNG image`. The folders have the same name as the display type.
     * + If you specify **GroupByMonth**, the value of DisplayType is `Stack`. The folders have names like `October 2014` or `November 2014`.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.displaytype
     * @type {HSTRING} 
     */
    DisplayType {
        get => this.get_DisplayType()
    }

    /**
     * Gets an identifier for the current folder. This ID is unique for the query result or [StorageFolder](storagefolder.md) that contains the current folder or file group, and can be used to distinguish between items that have the same name.
     * @remarks
     * You create a query result object when you create a query using one of the methods on a [StorageFolder](storagefolder.md) object. Depending on the method you call, your query result object could be a [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), a [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), or a [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.folderrelativeid
     * @type {HSTRING} 
     */
    FolderRelativeId {
        get => this.get_FolderRelativeId()
    }

    /**
     * Gets an object that provides access to the content-related properties of the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.properties
     * @type {StorageItemContentProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [StorageProvider](storageprovider.md) object that contains info about the service that stores the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.provider
     * @type {StorageProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a new file in the current folder. This method also specifies what to do if a file with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The name of the new file to create in the current folder.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfileasync
     */
    CreateFileAsyncOverloadDefaultOptions(desiredName) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.CreateFileAsyncOverloadDefaultOptions(desiredName)
    }

    /**
     * Creates a new file with the specified name in the current folder.
     * @remarks
     * This method uses the **FailIfExists** value from the [CreationCollisionOption](creationcollisionoption.md) enumeration by default. That is, this method raises an exception if a file with the same name already exists in the current folder. If you want to handle a file name collision in a different way, call the [CreateFileAsync(String, CreationCollisionOption)](storagefolder_createfileasync_1058061470.md) method.
     * 
     * If you try to create a file in a virtual folder like a library, or a folder that represents a container for a group of files (for example, the return value from some overloads of the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method), the **CreateFileAsync** method may fail.
     * @param {HSTRING} desiredName The name of the new file to create in the current folder.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfileasync
     */
    CreateFileAsync(desiredName, options) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.CreateFileAsync1(desiredName, options)
    }

    /**
     * Creates a new subfolder with the specified name in the current folder. This method also specifies what to do if a subfolder with the same name already exists in the current folder.
     * @remarks
     * If a folder with the specified *desiredName* already exists in the current folder, the specified [CreationCollisionOption](creationcollisionoption.md) determines how to handle the collision.
     * @param {HSTRING} desiredName The name of the new subfolder to create in the current folder.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfolderasync
     */
    CreateFolderAsyncOverloadDefaultOptions(desiredName) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.CreateFolderAsyncOverloadDefaultOptions(desiredName)
    }

    /**
     * Creates a new subfolder with the specified name in the current folder.
     * @remarks
     * This method uses the **FailIfExists** value from the [CreationCollisionOption](creationcollisionoption.md) enumeration by default. That is, this method raises an exception if a subfolder with the same name already exists in the current folder. If you want to handle a folder name collision in a different way, call the [CreateFolderAsync(String, CreationCollisionOption)](storagefolder_createfolderasync_1043039832.md) method.
     * 
     * If you try to create a subfolder in a virtual folder like a library, or a folder that represents a container for a group of files (for example, the return value from some overloads of the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method), the CreateFolderAsync method may fail.
     * @param {HSTRING} desiredName The name of the new subfolder to create in the current folder.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfolderasync
     */
    CreateFolderAsync(desiredName, options) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.CreateFolderAsync1(desiredName, options)
    }

    /**
     * Gets the file with the specified name from the current folder.
     * @remarks
     * To get an item that's a file or a folder, call the [GetItemAsync](storagefolder_getitemasync_1847090456.md) method.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file to get.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfileasync
     */
    GetFileAsync(name) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetFileAsync(name)
    }

    /**
     * Gets the subfolder with the specified name from the current folder.
     * @param {HSTRING} name The name (or path relative to the current folder) of the subfolder to get.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfolderasync
     */
    GetFolderAsync(name) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetFolderAsync(name)
    }

    /**
     * Gets the file or folder with the specified name from the current folder.
     * @remarks
     * Call the [IsOfType](istorageitem_isoftype_1417811226.md) method of the [IStorageItem](istorageitem.md) interface to determine whether the returned item is a file or a folder.
     * 
     * To get a specific file without casting the return value, call the [GetFileAsync](storagefolder_getfileasync_703762627.md) method. To get a specific folder without casting the return value, call the [GetFolderAsync](storagefolder_getfolderasync_761626819.md) method.
     * 
     * To try to get a file or folder by name, or to check whether a file or folder exists, without the need to handle a **FileNotFoundException**, call the [TryGetItemAsync](storagefolder_trygetitemasync_1863649689.md) method.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file or folder to get.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getitemasync
     */
    GetItemAsync(name) {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetItemAsync(name)
    }

    /**
     * Gets the files in the current folder. Also gets the files from the subfolders of the current folder when the value of the *query* argument is something other than [CommonFileQuery.DefaultQuery](../windows.storage.search/commonfilequery.md). Files are sorted based on the specified value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfilesasync
     */
    GetFilesAsyncOverloadDefaultOptionsStartAndCount() {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetFilesAsyncOverloadDefaultOptionsStartAndCount()
    }

    /**
     * Gets the subfolders in the current folder. When the value of the *query* argument is something other than [CommonFolderQuery.DefaultQuery](../windows.storage.search/commonfolderquery.md), gets a list of virtual folders that represent containers for groups of files in the subfolders of the current folder. Files are grouped into folders based on the specified value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration.
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfoldersasync
     */
    GetFoldersAsyncOverloadDefaultOptionsStartAndCount() {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetFoldersAsyncOverloadDefaultOptionsStartAndCount()
    }

    /**
     * Gets the files and subfolders in the current folder.
     * @remarks
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of files and folders. The table identifies shallow queries that only return items from the current folder, and deep queries that return items from the current folder and from its subfolders.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateItemQueryWithOptions(QueryOptions)](storagefolder_createitemquerywithoptions_1519361285.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns items from the current folder | Create a deep query that returns items from the current folder and from its subfolders |
     * |---|---|---|
     * | GetItemsAsync() | Default behavior of this method. | N/A |
     * | [GetItemsAsync(UInt32, UInt32)](storagefolder_getitemsasync_561011846.md) | Default behavior of this method. | N/A |
     * | [CreateItemQuery()](storagefolder_createitemquery_543424716.md) | Default behavior of this method. | N/A |
     * | [CreateItemQueryWithOptions(QueryOptions)](storagefolder_createitemquerywithoptions_1519361285.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) or [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) or [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * 
     * To get only files, call the [GetFilesAsync](storagefolder_getfilesasync_1429382825.md) method. To get only folders, call the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getitemsasync
     */
    GetItemsAsyncOverloadDefaultStartAndCount() {
        if (!this.HasProp("__IStorageFolder")) {
            if ((queryResult := this.QueryInterface(IStorageFolder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder := IStorageFolder(outPtr)
        }

        return this.__IStorageFolder.GetItemsAsyncOverloadDefaultStartAndCount()
    }

    /**
     * Renames the current folder and specifies what to do if a folder with the same name already exists.
     * @param {HSTRING} desiredName The desired, new name for the current folder.
     * 
     * If there is an existing item in the current folder's location that already has the specified *desiredName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.renameasync
     */
    RenameAsyncOverloadDefaultOptions(desiredName) {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.RenameAsyncOverloadDefaultOptions(desiredName)
    }

    /**
     * Renames the current folder.
     * @remarks
     * If the name you specify is invalid, this method (and its overload) throws an exception. To handle all the ways the specified name could be invalid, you must catch all four of these exceptions:<table>
     *    <tr><td>E_INVALIDARG</td></tr>
     *    <tr><td>E_FAIL</td></tr>
     *    <tr><td>ERROR_FILENAME_EXCED_RANGE</td></tr>
     *    <tr><td>ERROR_INVALID_NAME</td></tr>
     * </table>
     * 
     * If the file is deleted before the rename finishes, this method throws the ERROR_FILE_NOT_FOUND exception. You must also catch and handle this exception when you use this method.
     * @param {HSTRING} desiredName The desired, new name for the current folder.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.renameasync
     */
    RenameAsync(desiredName, option) {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.RenameAsync1(desiredName, option)
    }

    /**
     * Deletes the current folder. This method also specifies whether to delete the folder permanently.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.deleteasync
     */
    DeleteAsyncOverloadDefaultOptions() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.DeleteAsyncOverloadDefaultOptions()
    }

    /**
     * Deletes the current folder.
     * @remarks
     * This method implicitly uses [StorageDeleteOption.Default](storagedeleteoption.md) to determine whether the item is deleted permanently.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.deleteasync
     */
    DeleteAsync(option) {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.DeleteAsync1(option)
    }

    /**
     * Gets the basic properties of the current folder or file group.
     * @returns {IAsyncOperation<BasicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getbasicpropertiesasync
     */
    GetBasicPropertiesAsync() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.GetBasicPropertiesAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.get_Path()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.get_Attributes()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateCreated() {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.get_DateCreated()
    }

    /**
     * Indicates whether the current [StorageFolder](storagefolder.md) matches the specified [StorageItemTypes](storageitemtypes.md) value.
     * @param {Integer} type The enum value that determines the object type to match against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.isoftype
     */
    IsOfType(type) {
        if (!this.HasProp("__IStorageItem")) {
            if ((queryResult := this.QueryInterface(IStorageItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem := IStorageItem(outPtr)
        }

        return this.__IStorageItem.IsOfType(type)
    }

    /**
     * Gets the indexed state of the current folder.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getindexedstateasync
     */
    GetIndexedStateAsync() {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetIndexedStateAsync()
    }

    /**
     * Gets a query result object that contains the files in the current folder. Also gets the files from the subfolders of the current folder when the value of the *query* argument is something other than [CommonFileQuery.DefaultQuery](../windows.storage.search/commonfilequery.md). Files are sorted based on the specified [CommonFileQuery](../windows.storage.search/commonfilequery.md).
     * @remarks
     * A [CommonFileQuery](../windows.storage.search/commonfilequery.md) sorts files based on specific file attributes (like title or date) quickly and easily.
     * 
     * When you specify the **DefaultQuery** option from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, this query is a shallow query that returns only files in the current folder. When you specify another value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, this query is a deep query that returns a flattened list of files from the current folder and from its subfolders.
     * 
     * > > [!TIP]
     * > Some of the values from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration can only be used with a library folder (such as the Pictures library) or the Homegroup folder. In addition to the **DefaultQuery** option, you can use only the **OrderByName** and **OrderBySearchRank** options with a folder that's not a library folder.
     * 
     * For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetFilesAsync](storagefolder_getfilesasync_1429382825.md).
     * 
     * To check whether a specific [CommonFileQuery](../windows.storage.search/commonfilequery.md) is available, call the folder's [IsCommonFileQuerySupported](storagefolder_iscommonfilequerysupported_1848755604.md) method.
     * 
     * You can also get a list of files in the current folder asynchronously by calling one of the [GetFilesAsync](storagefolder_getfilesasync_1429382825.md) methods.
     * 
     * > **For Windows Server 2012**
     * > You must install indexer components to use some [CommonFileQuery](../windows.storage.search/commonfilequery.md) values because indexer components are not installed by default.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfilequery
     */
    CreateFileQueryOverloadDefault() {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFileQueryOverloadDefault()
    }

    /**
     * Gets a query result object that contains the files in the current folder.
     * @remarks
     * This query is a shallow query that returns only files in the current folder. For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetFilesAsync](storagefolder_getfilesasync_1429382825.md).
     * 
     * You can also get a list of files in the current folder asynchronously by calling one of the [GetFilesAsync](storagefolder_getfilesasync_1429382825.md) methods.
     * 
     * To specify additional query options, call the [CreateFileQueryWithOptions](storagefolder_createfilequerywithoptions_2038131323.md) method.
     * 
     * To get items that are files or folders, call the [CreateItemQuery](storagefolder_createitemquery_543424716.md) method.
     * @param {Integer} query 
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfilequery
     */
    CreateFileQuery(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFileQuery1(query)
    }

    /**
     * Gets a query result object that contains the files in the current folder and, optionally, in the subfolders of the current folder. The results are based on the specified [QueryOptions](../windows.storage.search/queryoptions.md).
     * @remarks
     * In the following cases, this query is a shallow query that returns only files in the current folder:
     * 
     * - Default behavior of this method if none of the following options are specified. **_Or:_**
     * - Specify **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object. **_Or:_**
     * - Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * In the following cases, this query is a deep query that returns files from the current folder and from its subfolders:
     * 
     * - For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object. **_Or:_**
     * - For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md).
     * 
     * > [!TIP]
     * > Some of the values from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration can only be used with a library folder (such as the Pictures library) or the Homegroup folder. Despite the wording of the **ArgumentException** described above, you can use the **OrderByName** and **OrderBySearchRank** options (in addition to the **DefaultQuery** option) with a folder that's not a library folder.
     * 
     * For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetFilesAsync](storagefolder_getfilesasync_1429382825.md).
     * 
     * To check whether the [QueryOptions](../windows.storage.search/queryoptions.md) you want to specify are available for the current folder, call the folder's [AreQueryOptionsSupported](storagefolder_arequeryoptionssupported_849436946.md) method. To check whether a specific [CommonFileQuery](../windows.storage.search/commonfilequery.md) is available, call the folder's [IsCommonFileQuerySupported](storagefolder_iscommonfilequerysupported_1848755604.md) method.
     * 
     * You can also get a list of files in the current folder asynchronously by calling one of the [GetFilesAsync](storagefolder_getfilesasync_1429382825.md) methods.
     * 
     * To get a query result object that contains the files in the current folder without configuring a [QueryOptions](../windows.storage.search/queryoptions.md) object, call one of the [CreateFileQuery](storagefolder_createfilequery_1641434999.md) methods.
     * 
     * To get items that are files or folders, call the [CreateItemQueryWithOptions](storagefolder_createitemquerywithoptions_1519361285.md) method.
     * 
     * > [!NOTE]
     * > **For Windows Server 2012**, you must install indexer components to use some [QueryOptions](../windows.storage.search/queryoptions.md) because indexer components are not installed by default.
     * @param {QueryOptions} queryOptions_ The criteria that are applied to the query.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfilequerywithoptions
     */
    CreateFileQueryWithOptions(queryOptions_) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFileQueryWithOptions(queryOptions_)
    }

    /**
     * Gets a query result object that contains the subfolders in the current folder. When the value of the *query* argument is something other than [CommonFolderQuery.DefaultQuery](../windows.storage.search/commonfolderquery.md), gets a list of virtual folders that represent containers for groups of files in the subfolders of the current folder. Files are grouped into folders based on the specified value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration.
     * @remarks
     * A [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) groups the contents of subfolders into folders based on specific file attributes (like artist or album) quickly and easily. See the Remarks on the [CreateFileQuery](storagefolder_createfilequery_1641434999.md) method page for more information about specifying **DefaultQuery** options.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfolderquery
     */
    CreateFolderQueryOverloadDefault() {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFolderQueryOverloadDefault()
    }

    /**
     * Gets a query result object that contains the subfolders in the current folder.
     * @remarks
     * This query is a shallow query that returns only subfolders in the current folder. For a list of methods that identifies shallow queries and deep queries, see the Remarks in the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method.
     * 
     * To specify additional query options, call the [CreateFolderQueryWithOptions](storagefolder_createfolderquerywithoptions_573382953.md) method.
     * 
     * To get items that are files or folders, call the [CreateItemQuery](storagefolder_createitemquery_543424716.md) method.
     * @param {Integer} query 
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfolderquery
     */
    CreateFolderQuery(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFolderQuery1(query)
    }

    /**
     * Gets a query result object that contains the subfolders in the current folder and, optionally, nested subfolders. The results are based on the specified [QueryOptions](../windows.storage.search/queryoptions.md).
     * @remarks
     * For more information and examples on getting query result objects, see [CreateFileQueryWithOptions](storagefolder_createfilequerywithoptions_2038131323.md).
     * @param {QueryOptions} queryOptions_ The criteria that are applied to the query.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createfolderquerywithoptions
     */
    CreateFolderQueryWithOptions(queryOptions_) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateFolderQueryWithOptions(queryOptions_)
    }

    /**
     * Gets a query result object that contains the files and subfolders in the current folder.
     * @remarks
     * This query is a shallow query that returns only items in the current folder. For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetItemsAsync](/uwp/api/windows.storage.storagefolder.getitemsasync).
     * 
     * You can also get a list of items in the current folder asynchronously by calling one of the [GetItemsAsync](/uwp/api/windows.storage.storagefolder.getitemsasync) methods.
     * 
     * To specify additional query options, call the [CreateItemQueryWithOptions](storagefolder_createitemquerywithoptions_1519361285.md) method.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createitemquery
     */
    CreateItemQuery() {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateItemQuery()
    }

    /**
     * Gets a query result object that contains the files and subfolders in the current folder and, optionally, in the subfolders of the current folder. The results are based on the specified [QueryOptions](../windows.storage.search/queryoptions.md).
     * @remarks
     * For more information and examples on getting query result objects, see [CreateFileQueryWithOptions](storagefolder_createfilequerywithoptions_2038131323.md).
     * @param {QueryOptions} queryOptions_ The criteria that are applied to the query.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.createitemquerywithoptions
     */
    CreateItemQueryWithOptions(queryOptions_) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.CreateItemQueryWithOptions(queryOptions_)
    }

    /**
     * Gets the files in the current folder.
     * @remarks
     * This query is a shallow query that returns only files in the current folder. For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetFilesAsync](storagefolder_getfilesasync_1429382825.md).
     * 
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of files. The table identifies shallow queries that only return files from the current folder, and deep queries that return files from the current folder and from its subfolders.
     * 
     * Some methods take a value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration. When you specify the **DefaultQuery** option from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, the query is a shallow query that returns only files in the current folder. When you specify another value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, the query is a deep query that returns a flattened list of files from the current folder and from its subfolders.
     * 
     * > [!TIP]
     * > Some of the values from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration can only be used with a library folder (such as the Pictures library) or the Homegroup folder. In addition to the **DefaultQuery** option, you can use only the **OrderByName** and **OrderBySearchRank** options with a folder that's not a library folder.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateFileQueryWithOptions(QueryOptions)](storagefolder_createfilequerywithoptions_2038131323.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns files from the current folder | Create a deep query that returns files from the current folder and from its subfolders |
     * |---|---|---|
     * | GetFilesAsync() | Default behavior of this method. | N/A |
     * | [GetFilesAsync(CommonFileQuery)](storagefolder_getfilesasync_1429382825.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [GetFilesAsync(CommonFileQuery, UInt32, UInt32)](storagefolder_getfilesasync_1563132095.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFileQuery()](storagefolder_createfilequery_70815642.md) | Default behavior of this method. | N/A |
     * | [CreateFileQuery(CommonFileQuery)](storagefolder_createfilequery_1641434999.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFileQueryWithOptions(QueryOptions)](storagefolder_createfilequerywithoptions_2038131323.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * @param {Integer} query 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfilesasync
     */
    GetFilesAsync(query, startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetFilesAsync(query, startIndex, maxItemsToRetrieve)
    }

    /**
     * Gets the files in the current folder.
     * @remarks
     * This query is a shallow query that returns only files in the current folder. For a list of methods that identifies shallow queries and deep queries, see the Remarks in the topic [GetFilesAsync](storagefolder_getfilesasync_1429382825.md).
     * 
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of files. The table identifies shallow queries that only return files from the current folder, and deep queries that return files from the current folder and from its subfolders.
     * 
     * Some methods take a value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration. When you specify the **DefaultQuery** option from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, the query is a shallow query that returns only files in the current folder. When you specify another value from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration, the query is a deep query that returns a flattened list of files from the current folder and from its subfolders.
     * 
     * > [!TIP]
     * > Some of the values from the [CommonFileQuery](../windows.storage.search/commonfilequery.md) enumeration can only be used with a library folder (such as the Pictures library) or the Homegroup folder. In addition to the **DefaultQuery** option, you can use only the **OrderByName** and **OrderBySearchRank** options with a folder that's not a library folder.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateFileQueryWithOptions(QueryOptions)](storagefolder_createfilequerywithoptions_2038131323.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns files from the current folder | Create a deep query that returns files from the current folder and from its subfolders |
     * |---|---|---|
     * | GetFilesAsync() | Default behavior of this method. | N/A |
     * | [GetFilesAsync(CommonFileQuery)](storagefolder_getfilesasync_1429382825.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [GetFilesAsync(CommonFileQuery, UInt32, UInt32)](storagefolder_getfilesasync_1563132095.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFileQuery()](storagefolder_createfilequery_70815642.md) | Default behavior of this method. | N/A |
     * | [CreateFileQuery(CommonFileQuery)](storagefolder_createfilequery_1641434999.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFileQueryWithOptions(QueryOptions)](storagefolder_createfilequerywithoptions_2038131323.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * @param {Integer} query 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfilesasync
     */
    GetFilesAsyncOverloadDefaultStartAndCount(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetFilesAsyncOverloadDefaultStartAndCount(query)
    }

    /**
     * Gets the subfolders in the current folder.
     * @remarks
     * This query is a shallow query that returns only subfolders in the current folder.
     * 
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of subfolders. The table identifies shallow queries that only return subfolders from the current folder, and deep queries that return the contents of nested subfolders, grouped into virtual folders.
     * 
     * Some methods take a value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration.
     * 
     * + When you use the **DefaultQuery** option with any folder, the query returns a list of subfolders in the file system.
     * + When you use an option other than **DefaultQuery** with a library folder, the query returns a list of virtual folders that represent containers for files from the subfolders of the current folder. (Files from the current folder are not included.) The files are grouped into virtual folders based on the specified value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration. For example, if you specify **GroupByMonth**, the query returns a list of virtual folders such as `July 2014`, `August 2014`, and `September 2014`.
     * 
     * > [!TIP]
     * > You can use the **DefaultQuery** option with any folder; you can use the other options from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration only with library folders, such as the Pictures library, or the Homegroup folder.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateFolderQueryWithOptions(QueryOptions)](storagefolder_createfolderquerywithoptions_573382953.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns subfolders from the current folder | Create a deep query that returns all nested subfolders |
     * |---|---|---|
     * | GetFoldersAsync() | Default behavior of this method. | N/A |
     * | [GetFoldersAsync(CommonFileQuery)](storagefolder_getfoldersasync_595997124.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [GetFoldersAsync(CommonFileQuery, UInt32, UInt32)](storagefolder_getfoldersasync_731846614.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFolderQuery()](storagefolder_createfolderquery_325438332.md) | Default behavior of this method. | N/A |
     * | [CreateFolderQuery(CommonFileQuery)](storagefolder_createfolderquery_330767063.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFolderQueryWithOptions(QueryOptions)](storagefolder_createfolderquerywithoptions_573382953.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * @param {Integer} query 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfoldersasync
     */
    GetFoldersAsync(query, startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetFoldersAsync(query, startIndex, maxItemsToRetrieve)
    }

    /**
     * Gets the subfolders in the current folder.
     * @remarks
     * This query is a shallow query that returns only subfolders in the current folder.
     * 
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of subfolders. The table identifies shallow queries that only return subfolders from the current folder, and deep queries that return the contents of nested subfolders, grouped into virtual folders.
     * 
     * Some methods take a value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration.
     * 
     * + When you use the **DefaultQuery** option with any folder, the query returns a list of subfolders in the file system.
     * + When you use an option other than **DefaultQuery** with a library folder, the query returns a list of virtual folders that represent containers for files from the subfolders of the current folder. (Files from the current folder are not included.) The files are grouped into virtual folders based on the specified value from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration. For example, if you specify **GroupByMonth**, the query returns a list of virtual folders such as `July 2014`, `August 2014`, and `September 2014`.
     * 
     * > [!TIP]
     * > You can use the **DefaultQuery** option with any folder; you can use the other options from the [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration only with library folders, such as the Pictures library, or the Homegroup folder.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateFolderQueryWithOptions(QueryOptions)](storagefolder_createfolderquerywithoptions_573382953.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns subfolders from the current folder | Create a deep query that returns all nested subfolders |
     * |---|---|---|
     * | GetFoldersAsync() | Default behavior of this method. | N/A |
     * | [GetFoldersAsync(CommonFileQuery)](storagefolder_getfoldersasync_595997124.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [GetFoldersAsync(CommonFileQuery, UInt32, UInt32)](storagefolder_getfoldersasync_731846614.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFolderQuery()](storagefolder_createfolderquery_325438332.md) | Default behavior of this method. | N/A |
     * | [CreateFolderQuery(CommonFileQuery)](storagefolder_createfolderquery_330767063.md) | Specify the **DefaultQuery** option. | For a library folder, specify an option other than **DefaultQuery**. |
     * | [CreateFolderQueryWithOptions(QueryOptions)](storagefolder_createfolderquerywithoptions_573382953.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * @param {Integer} query 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getfoldersasync
     */
    GetFoldersAsyncOverloadDefaultStartAndCount(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetFoldersAsyncOverloadDefaultStartAndCount(query)
    }

    /**
     * Gets the files and subfolders in the current folder.
     * @remarks
     * The following table lists methods of the [StorageFolder](storagefolder.md) class that get a list of files and folders. The table identifies shallow queries that only return items from the current folder, and deep queries that return items from the current folder and from its subfolders.
     * 
     * To get deep query results from a folder that's not a library folder, call the [CreateItemQueryWithOptions(QueryOptions)](storagefolder_createitemquerywithoptions_1519361285.md) method and specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object.
     * 
     * | Method | Create a shallow query that only returns items from the current folder | Create a deep query that returns items from the current folder and from its subfolders |
     * |---|---|---|
     * | GetItemsAsync() | Default behavior of this method. | N/A |
     * | [GetItemsAsync(UInt32, UInt32)](storagefolder_getitemsasync_561011846.md) | Default behavior of this method. | N/A |
     * | [CreateItemQuery()](storagefolder_createitemquery_543424716.md) | Default behavior of this method. | N/A |
     * | [CreateItemQueryWithOptions(QueryOptions)](storagefolder_createitemquerywithoptions_1519361285.md) | Default behavior of this method if none of the following options are specified.<br/>- or -<br/>Specify **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) or [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>Specify **Shallow** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md) object. | For a library folder, specify a value other than **DefaultQuery** as the value of [CommonFileQuery](../windows.storage.search/commonfilequery.md) or [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) when you instantiate the [QueryOptions](../windows.storage.search/queryoptions.md) object.<br/>- or -<br/>For any folder, specify **Deep** as the value of the [FolderDepth](../windows.storage.search/queryoptions_folderdepth.md) property of the [QueryOptions](../windows.storage.search/queryoptions.md). |
     * 
     * To get only files, call the [GetFilesAsync](storagefolder_getfilesasync_1429382825.md) method. To get only folders, call the [GetFoldersAsync](storagefolder_getfoldersasync_592765033.md) method.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getitemsasync
     */
    GetItemsAsync(startIndex, maxItemsToRetrieve) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.GetItemsAsync(startIndex, maxItemsToRetrieve)
    }

    /**
     * Indicates whether the current folder supports the specified [QueryOptions](../windows.storage.search/queryoptions.md).
     * @remarks
     * [QueryOptions](../windows.storage.search/queryoptions.md) let you enumerate files in a folder and its subfolders by letting you specify criteria that you can then use to create a query result object of files in that folder and subfolders. The [CommonFileQuery](../windows.storage.search/commonfilequery.md) and [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) enumeration represent some of the most common criteria used to filter and enumerate files and folders.
     * 
     * Use the AreQueryOptionsSupported method to verify that the [QueryOptions](../windows.storage.search/queryoptions.md) you want to specify are available for the current folder. You can also check whether a specific [CommonFileQuery](../windows.storage.search/commonfilequery.md) or [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) value is available, by calling [IsCommonFileQuerySupported](storagefolder_iscommonfilequerysupported_1848755604.md) or [IsCommonFolderQuerySupported](storagefolder_iscommonfolderquerysupported_1797734947.md), respectively.
     * 
     * The specific options available to you depend on where the files or folders that you want to enumerate are located. For folders and files that are located inside a library or homegroup, you can use any combination of [QueryOptions](../windows.storage.search/queryoptions.md).
     * 
     * 
     * 
     * Folders and files outside of a library or homegroup support a only subset of options.
     * 
     * + For queries that enumerate only the top-level files or folders (also known as a shallow query), create a [QueryOptions](../windows.storage.search/queryoptions.md) object in one of the following three ways:
     * 
     *    + Call the default [QueryOptions()](../windows.storage.search/queryoptions_queryoptions_1221375020.md) constructor.
     *    + Call the [QueryOptions(CommonFolderQuery)](../windows.storage.search/queryoptions_queryoptions_1209951623.md) constructor and specify [CommonFolderQuery](../windows.storage.search/commonfolderquery.md).[DefaultQuery](../windows.storage.search/commonfolderquery.md).
     *    + Call the [QueryOptions(CommonFileQuery, IIterable(String))](../windows.storage.search/queryoptions_queryoptions_811500193.md) constructor and specify [CommonFileQuery](../windows.storage.search/commonfilequery.md).[DefaultQuery](../windows.storage.search/commonfilequery.md). You can still specify file types to be filtered when you use this constructor.
     * 
     * + For queries that enumerate all of the files inside the current folder and its subfolders (also known as a deep query), create a [QueryOptions](../windows.storage.search/queryoptions.md) object in one of the following two ways:
     * 
     *    + Call the [QueryOptions(CommonFolderQuery)](../windows.storage.search/queryoptions_queryoptions_1209951623.md) constructor and specify [CommonFileQuery](../windows.storage.search/commonfilequery.md).[OrderByName](../windows.storage.search/commonfilequery.md) or [CommonFileQuery](../windows.storage.search/commonfilequery.md).[OrderBySearchRank](../windows.storage.search/commonfilequery.md).
     *    + Call the [QueryOptions(CommonFileQuery, IIterable(String))](../windows.storage.search/queryoptions_queryoptions_811500193.md) constructor and specify [CommonFileQuery](../windows.storage.search/commonfilequery.md).[OrderByName](../windows.storage.search/commonfilequery.md) or [CommonFileQuery](../windows.storage.search/commonfilequery.md).[OrderBySearchRank](../windows.storage.search/commonfilequery.md). You can still specify file types to be filtered when you use this constructor.
     * 
     * > **For Windows Server 2012**
     * > You must install indexer components to use some [QueryOptions](../windows.storage.search/queryoptions.md), [CommonFileQuery](../windows.storage.search/commonfilequery.md) values, and [CommonFolderQuery](../windows.storage.search/commonfolderquery.md) values because indexer components are not installed by default.
     * @param {QueryOptions} queryOptions_ The [QueryOptions](../windows.storage.search/queryoptions.md) to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.arequeryoptionssupported
     */
    AreQueryOptionsSupported(queryOptions_) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.AreQueryOptionsSupported(queryOptions_)
    }

    /**
     * Indicates whether the current folder supports the specified [CommonFolderQuery](../windows.storage.search/commonfolderquery.md).
     * @param {Integer} query The value to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.iscommonfolderquerysupported
     */
    IsCommonFolderQuerySupported(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.IsCommonFolderQuerySupported(query)
    }

    /**
     * Indicates whether the current folder supports the specified [CommonFileQuery](../windows.storage.search/commonfilequery.md).
     * @param {Integer} query The value to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.iscommonfilequerysupported
     */
    IsCommonFileQuerySupported(query) {
        if (!this.HasProp("__IStorageFolderQueryOperations")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryOperations := IStorageFolderQueryOperations(outPtr)
        }

        return this.__IStorageFolderQueryOperations.IsCommonFileQuerySupported(query)
    }

    /**
     * Gets a thumbnail image for the current folder, sized for the specified purpose of the thumbnail and adjusted to the requested size.
     * @param {Integer} mode_ A value from the enumeration that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getthumbnailasync
     */
    GetThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_) {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.GetThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_)
    }

    /**
     * Gets a thumbnail image for the current folder, sized for the specified purpose of the thumbnail and adjusted to the requested size with the specified options.
     * @param {Integer} mode_ A value from the enumeration that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. This method uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If this method can't find a thumbnail image that it can scale to the requested size, it may return a larger thumbnail. If no larger thumbnail is available, it may return a thumbnail image that is smaller than the requested size.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getthumbnailasync
     */
    GetThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize) {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.GetThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize)
    }

    /**
     * Gets a thumbnail image for the current folder, sized for the specified purpose of the thumbnail.
     * @remarks
     * For a sample that demonstrates the **GetThumbnailAsync** method, see [File and folder thumbnail sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FileThumbnails).
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * 
     * > The [StorageFolder.GetThumbnailAsync](storagefolder_getthumbnailasync_1511435522.md) method sometimes returns the default image of a folder. For Windows Phone 8.x app, this method ignores the current theme when it returns this default image. The image returned is always the image for the dark theme; that is, the folder is transparent with a white border. If you want to return the image for the light theme, you have to create your own image that's visible on a light background. Then you have to use conditional logic to check the active theme. If the active theme is the light theme, use a method other than [GetThumbnailAsync](storagefile_getthumbnailasync_1575071988.md) to retrieve your custom image.
     * @param {Integer} mode_ A value from the enumeration that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getthumbnailasync
     */
    GetThumbnailAsync(mode_, requestedSize, options) {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.GetThumbnailAsync2(mode_, requestedSize, options)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayType() {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.get_DisplayType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderRelativeId() {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.get_FolderRelativeId()
    }

    /**
     * 
     * @returns {StorageItemContentProperties} 
     */
    get_Properties() {
        if (!this.HasProp("__IStorageItemProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties := IStorageItemProperties(outPtr)
        }

        return this.__IStorageItemProperties.get_Properties()
    }

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail and the requested size.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_) {
        if (!this.HasProp("__IStorageItemProperties2")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties2 := IStorageItemProperties2(outPtr)
        }

        return this.__IStorageItemProperties2.GetScaledImageAsThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_)
    }

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail, the requested size, and the specified options
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that it can scale to meet the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize) {
        if (!this.HasProp("__IStorageItemProperties2")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties2 := IStorageItemProperties2(outPtr)
        }

        return this.__IStorageItemProperties2.GetScaledImageAsThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize)
    }

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsync(mode_, requestedSize, options) {
        if (!this.HasProp("__IStorageItemProperties2")) {
            if ((queryResult := this.QueryInterface(IStorageItemProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemProperties2 := IStorageItemProperties2(outPtr)
        }

        return this.__IStorageItemProperties2.GetScaledImageAsThumbnailAsync2(mode_, requestedSize, options)
    }

    /**
     * Gets the parent folder of the current folder.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.getparentasync
     */
    GetParentAsync() {
        if (!this.HasProp("__IStorageItem2")) {
            if ((queryResult := this.QueryInterface(IStorageItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem2 := IStorageItem2(outPtr)
        }

        return this.__IStorageItem2.GetParentAsync()
    }

    /**
     * Indicates whether the current folder is equal to the specified folder.
     * @remarks
     * Use the IsEqual method to determine whether two items represent the same folder.
     * 
     * This method compares the [Path](storagefolder_path.md) property of both items to determine if they are the same. If there is no [Path](storagefolder_path.md) (if the item is a library for example), or if the paths do not match the items are compared using [IShellItem.Compare](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare).
     * @param {IStorageItem} item The [IStorageItem](istorageitem.md) object that represents the folder to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.isequal
     */
    IsEqual(item) {
        if (!this.HasProp("__IStorageItem2")) {
            if ((queryResult := this.QueryInterface(IStorageItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItem2 := IStorageItem2(outPtr)
        }

        return this.__IStorageItem2.IsEqual(item)
    }

    /**
     * Tries to get the file or folder with the specified name from the current folder. Returns **null** instead of raising a **FileNotFoundException** if the specified file or folder is not found.
     * @remarks
     * Call the TryGetItemAsync method to try to get a file or folder by name, or to check whether a file or folder exists, without the need to handle a **FileNotFoundException**. If the file or folder can't be found, TryGetItemAsync returns **null** instead of raising an exception.
     * 
     * Call the [IsOfType](istorageitem_isoftype_1417811226.md) method of the [IStorageItem](istorageitem.md) interface to determine whether the returned item is a file or a folder.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file or folder to get.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.trygetitemasync
     */
    TryGetItemAsync(name) {
        if (!this.HasProp("__IStorageFolder2")) {
            if ((queryResult := this.QueryInterface(IStorageFolder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder2 := IStorageFolder2(outPtr)
        }

        return this.__IStorageFolder2.TryGetItemAsync(name)
    }

    /**
     * 
     * @returns {StorageProvider} 
     */
    get_Provider() {
        if (!this.HasProp("__IStorageItemPropertiesWithProvider")) {
            if ((queryResult := this.QueryInterface(IStorageItemPropertiesWithProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemPropertiesWithProvider := IStorageItemPropertiesWithProvider(outPtr)
        }

        return this.__IStorageItemPropertiesWithProvider.get_Provider()
    }

    /**
     * Gets the [StorageLibraryChangeTracker](/uwp/api/Windows.Storage.StorageLibraryChangeTracker) associated with a [StorageFolder](/uwp/api/windows.storage.storagefolder).
     * @returns {StorageLibraryChangeTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefolder.trygetchangetracker
     */
    TryGetChangeTracker() {
        if (!this.HasProp("__IStorageFolder3")) {
            if ((queryResult := this.QueryInterface(IStorageFolder3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolder3 := IStorageFolder3(outPtr)
        }

        return this.__IStorageFolder3.TryGetChangeTracker()
    }

;@endregion Instance Methods
}

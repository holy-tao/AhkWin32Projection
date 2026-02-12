#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemInformation.ahk
#Include ..\IStorageFolder.ahk
#Include ..\IStorageItem.ahk
#Include ..\IStorageItemProperties.ahk
#Include ..\Search\IStorageFolderQueryOperations.ahk
#Include ..\IStorageItem2.ahk
#Include ..\IStorageFolder2.ahk
#Include ..\IStorageItemPropertiesWithProvider.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides synchronous access to the properties exposed off [StorageFolder](../windows.storage/storagefolder.md) and lets an app perform asynchronous management operations such as delete and rename.
 * @remarks
 * > [!NOTE]
 * > Although it's not attributed with `marshalling_behavior(agile)`, this class can be treated as agile. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * <!--W8B 988884 v2-->
 * 
 * You can retrieve a list of FolderInformation objects by calling one of the [FileInformationFactory.GetFoldersAsync](fileinformationfactory_getfoldersasync_1487375516.md) methods.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class FolderInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageItemInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageItemInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the music properties associated with the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.musicproperties
     * @type {MusicProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * Gets the video properties that are associated with the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.videoproperties
     * @type {VideoProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * Gets the image properties of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.imageproperties
     * @type {ImageProperties} 
     */
    ImageProperties {
        get => this.get_ImageProperties()
    }

    /**
     * Gets the document properties of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.documentproperties
     * @type {DocumentProperties} 
     */
    DocumentProperties {
        get => this.get_DocumentProperties()
    }

    /**
     * Gets an object that contains the basic properties information of the folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.basicproperties
     * @type {BasicProperties} 
     */
    BasicProperties {
        get => this.get_BasicProperties()
    }

    /**
     * Gets the thumbnail for the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.thumbnail
     * @type {StorageItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets the name of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the path of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the attributes of a loaded folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.attributes
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the date that the folder was created.
     * @remarks
     * If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. In JavaScript, for example, 0 translates to December 16, 1600. You should always check that this property is a real value and not 0.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Gets the user-friendly name of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the display type of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.displaytype
     * @type {HSTRING} 
     */
    DisplayType {
        get => this.get_DisplayType()
    }

    /**
     * Gets the identifier that uniquely identifies the [StorageFolder](../windows.storage/storagefolder.md) relative to other items in the same folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.folderrelativeid
     * @type {HSTRING} 
     */
    FolderRelativeId {
        get => this.get_FolderRelativeId()
    }

    /**
     * Gets an object for retrieving the properties of the [StorageFolder](../windows.storage/storagefolder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.properties
     * @type {StorageItemContentProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [StorageProvider](../windows.storage/storageprovider.md) object that contains info about the service that stores the current folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.provider
     * @type {StorageProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * Fires when the [StorageFolder](../windows.storage/storagefolder.md)'s thumbnail is updated or a better quality thumbnail is available.
     * @type {TypedEventHandler<IStorageItemInformation, IInspectable>}
    */
    OnThumbnailUpdated {
        get {
            if(!this.HasProp("__OnThumbnailUpdated")){
                this.__OnThumbnailUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5b98b352-e0cf-58de-b2ec-4fd786bbb5a7}"),
                    IStorageItemInformation,
                    IInspectable
                )
                this.__OnThumbnailUpdatedToken := this.add_ThumbnailUpdated(this.__OnThumbnailUpdated.iface)
            }
            return this.__OnThumbnailUpdated
        }
    }

    /**
     * Occurs when one or more of the [StorageFolder](../windows.storage/storagefolder.md)'s properties is updated.
     * @type {TypedEventHandler<IStorageItemInformation, IInspectable>}
    */
    OnPropertiesUpdated {
        get {
            if(!this.HasProp("__OnPropertiesUpdated")){
                this.__OnPropertiesUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5b98b352-e0cf-58de-b2ec-4fd786bbb5a7}"),
                    IStorageItemInformation,
                    IInspectable
                )
                this.__OnPropertiesUpdatedToken := this.add_PropertiesUpdated(this.__OnPropertiesUpdated.iface)
            }
            return this.__OnPropertiesUpdated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnThumbnailUpdatedToken")) {
            this.remove_ThumbnailUpdated(this.__OnThumbnailUpdatedToken)
            this.__OnThumbnailUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnPropertiesUpdatedToken")) {
            this.remove_PropertiesUpdated(this.__OnPropertiesUpdatedToken)
            this.__OnPropertiesUpdated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {MusicProperties} 
     */
    get_MusicProperties() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_MusicProperties()
    }

    /**
     * 
     * @returns {VideoProperties} 
     */
    get_VideoProperties() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_VideoProperties()
    }

    /**
     * 
     * @returns {ImageProperties} 
     */
    get_ImageProperties() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_ImageProperties()
    }

    /**
     * 
     * @returns {DocumentProperties} 
     */
    get_DocumentProperties() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_DocumentProperties()
    }

    /**
     * 
     * @returns {BasicProperties} 
     */
    get_BasicProperties() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_BasicProperties()
    }

    /**
     * 
     * @returns {StorageItemThumbnail} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.get_Thumbnail()
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageItemInformation, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ThumbnailUpdated(changedHandler) {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.add_ThumbnailUpdated(changedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ThumbnailUpdated(eventCookie) {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.remove_ThumbnailUpdated(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageItemInformation, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertiesUpdated(changedHandler) {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.add_PropertiesUpdated(changedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PropertiesUpdated(eventCookie) {
        if (!this.HasProp("__IStorageItemInformation")) {
            if ((queryResult := this.QueryInterface(IStorageItemInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemInformation := IStorageItemInformation(outPtr)
        }

        return this.__IStorageItemInformation.remove_PropertiesUpdated(eventCookie)
    }

    /**
     * Creates a new file in the current folder, and specifies what to do if a file with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The name of the new file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfileasync
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
     * Creates a new file in the current folder.
     * @param {HSTRING} desiredName The name of the new file.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfileasync
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
     * Creates a new child folder of the current folder, and specifies what to do if a folder with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The name of the new folder.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfolderasync
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
     * Creates a new child folder of the current folder.
     * @param {HSTRING} desiredName The name of the new folder.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfolderasync
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
     * Retrieves a file from the current folder.
     * @param {HSTRING} name The name of the file to retrieve.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfileasync
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
     * Retrieves the specified child folder from the current folder.
     * @param {HSTRING} name The name of the child folder to retrieve.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfolderasync
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
     * Retrieves an item from the folder.
     * @param {HSTRING} name The name of the item to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getitemasync
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
     * Retrieves files from the current folder based on a common folder query.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfilesasync
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
     * Retrieves child folders from the current folder based on a common folder query.
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfoldersasync
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
     * Retrieves all items from the current folder.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getitemsasync
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
     * Renames the [StorageFolder](../windows.storage/storagefolder.md), and specifies what to do if a folder with the same name already exists.
     * @param {HSTRING} desiredName The new name.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.renameasync
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
     * Renames the [StorageFolder](../windows.storage/storagefolder.md).
     * @param {HSTRING} desiredName The new name.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.renameasync
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
     * Deletes the current folder, optionally moving the deleted folder to the recycle bin.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.deleteasync
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
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.deleteasync
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
     * Retrieves the basic properties of the [StorageFolder](../windows.storage/storagefolder.md) object.
     * @returns {IAsyncOperation<BasicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getbasicpropertiesasync
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
     * Determines whether the loaded [StorageFolder](../windows.storage/storagefolder.md) is the specified type.
     * @param {Integer} type The type of item to check against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.isoftype
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
     * Retrieves the thumbnail that is associated with the [StorageFolder](../windows.storage/storagefolder.md), scaling it to the specified size.
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getthumbnailasync
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
     * Retrieves the thumbnail that is associated with the [StorageFolder](../windows.storage/storagefolder.md), based on the specified options.
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @param {Integer} requestedSize The requested size in pixels of thumbnail to retrieve.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getthumbnailasync
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
     * Retrieves the thumbnail that is associated with the [StorageFolder](../windows.storage/storagefolder.md).
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getthumbnailasync
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
     * Retrieves the indexed state of the folder.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getindexedstateasync
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
     * Creates an object for performing filtered search queries for [StorageFile](../windows.storage/storagefile.md) objects in the current folder. Search results are grouped based on the specified file attribute.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfilequery
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
     * Creates an object for performing filtered search queries for [StorageFile](../windows.storage/storagefile.md) in the current folder.
     * @param {Integer} query 
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfilequery
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
     * Creates an object used to perform filtered search queries for [StorageFile](../windows.storage/storagefile.md) objects in the folder. The object is initialized with the specified query options.
     * @param {QueryOptions} queryOptions_ The initial query options.
     * @returns {StorageFileQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfilequerywithoptions
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
     * Creates an object for performing filtered search queries for child [StorageFolder](../windows.storage/storagefolder.md) objects of the current folder. Search results are grouped based on the specified folder attribute.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfolderquery
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
     * Creates an object for performing filtered search queries for child [StorageFolder](../windows.storage/storagefolder.md) objects of the current folder.
     * @param {Integer} query 
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfolderquery
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
     * Creates an object used to perform filtered search queries for child [StorageFolder](../windows.storage/storagefolder.md) objects of the current folder. The object is initialized with the specified query options.
     * @param {QueryOptions} queryOptions_ The initial query options.
     * @returns {StorageFolderQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createfolderquerywithoptions
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
     * Creates an object used to perform filtered search queries for items in the folder.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createitemquery
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
     * Creates an object used to perform filtered search queries for items in the folder. The object is initialized with the specified query options.
     * @param {QueryOptions} queryOptions_ The initial query options.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.createitemquerywithoptions
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
     * Retrieves all files from the current folder.
     * @param {Integer} query 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfilesasync
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
     * Retrieves all files from the current folder.
     * @param {Integer} query 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfilesasync
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
     * Retrieves all child folders from the current folder.
     * @param {Integer} query 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfoldersasync
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
     * Retrieves all child folders from the current folder.
     * @param {Integer} query 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getfoldersasync
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
     * Retrieves all items from the current folder.
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getitemsasync
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
     * Retrieves a value that indicates whether the folder supports the specified search query options.
     * @param {QueryOptions} queryOptions_ The search query options to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.arequeryoptionssupported
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
     * Retrieves a value that indicates whether the current folder supports the specified common folder query.
     * @param {Integer} query The common folder query to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.iscommonfolderquerysupported
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
     * Retrieves a value that indicates whether the current folder supports the specified common file query.
     * @param {Integer} query The common file query to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.iscommonfilequerysupported
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
     * Gets the parent folder of the current folder.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.getparentasync
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
     * @param {IStorageItem} item The [IStorageItem](../windows.storage/istorageitem.md) object that represents the folder to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.isequal
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
     * Try to get a specific file or sub-folder from the current folder using the name of the file or folder to get.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file or sub-folder to try to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.folderinformation.trygetitemasync
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

;@endregion Instance Methods
}

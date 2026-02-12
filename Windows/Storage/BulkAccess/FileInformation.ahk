#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemInformation.ahk
#Include ..\IStorageFile.ahk
#Include ..\Streams\IInputStreamReference.ahk
#Include ..\Streams\IRandomAccessStreamReference.ahk
#Include ..\IStorageItem.ahk
#Include ..\IStorageItemProperties.ahk
#Include ..\IStorageItem2.ahk
#Include ..\IStorageItemPropertiesWithProvider.ahk
#Include ..\IStorageFilePropertiesWithAvailability.ahk
#Include ..\IStorageFile2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides synchronous access to the properties exposed off [StorageFile](../windows.storage/storagefile.md) and lets an app perform asynchronous file operations such as copy, delete, move, and rename.
 * @remarks
 * You can retrieve a list of FileInformation objects by calling one of the [fileInformationFactory.getFilesAsync](fileinformationfactory_getfilesasync_1261374131.md) methods.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class FileInformation extends IInspectable {
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
     * Gets the music properties associated with the [StorageFile](../windows.storage/storagefile.md), such as the album name, artist name, bit rate, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.musicproperties
     * @type {MusicProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * Gets an object that provides access to the video properties of the [StorageFile](../windows.storage/storagefile.md), such as the duration, rating, date released, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.videoproperties
     * @type {VideoProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * Gets the image properties of the [StorageFile](../windows.storage/storagefile.md), such as the title, rating, date that the image was taken,
     * <!--Could this be changed to "date that the image was created"? "Taken" goes better with the word "photo" than with "image".-->
     * and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.imageproperties
     * @type {ImageProperties} 
     */
    ImageProperties {
        get => this.get_ImageProperties()
    }

    /**
     * Gets an object that provides access to the document properties of the [StorageFile](../windows.storage/storagefile.md), such as the title, author name, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.documentproperties
     * @type {DocumentProperties} 
     */
    DocumentProperties {
        get => this.get_DocumentProperties()
    }

    /**
     * Gets an object that contains the basic properties information of the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.basicproperties
     * @type {BasicProperties} 
     */
    BasicProperties {
        get => this.get_BasicProperties()
    }

    /**
     * Gets the thumbnail associated with the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.thumbnail
     * @type {StorageItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets the file type.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.filetype
     * @type {HSTRING} 
     */
    FileType {
        get => this.get_FileType()
    }

    /**
     * Gets a string that describes the contents of the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the name of the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the path of the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the attributes of a file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.attributes
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the date that the file was created.
     * @remarks
     * If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. In JavaScript, for example, 0 translates to December 16, 1600. You should always check that this property is a real value and not 0.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Gets the user-friendly name of the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the display type of the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.displaytype
     * @type {HSTRING} 
     */
    DisplayType {
        get => this.get_DisplayType()
    }

    /**
     * Gets the identifier that uniquely identifies the [StorageFile](../windows.storage/storagefile.md) relative to other items in the same folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.folderrelativeid
     * @type {HSTRING} 
     */
    FolderRelativeId {
        get => this.get_FolderRelativeId()
    }

    /**
     * Gets an object for retrieving the properties of the [StorageFile](../windows.storage/storagefile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.properties
     * @type {StorageItemContentProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [StorageProvider](../windows.storage/storageprovider.md) object that contains info about the service that stores the current file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.provider
     * @type {StorageProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * Indicates if the current file has been downloaded or can be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.isavailable
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
    }

    /**
     * Fires when the [StorageFile](../windows.storage/storagefile.md)'s thumbnail is updated or a better quality thumbnail is available.
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
     * Occurs when one or more of the [StorageFile](../windows.storage/storagefile.md)'s properties is updated.
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
     * 
     * @returns {HSTRING} 
     */
    get_FileType() {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.get_FileType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.get_ContentType()
    }

    /**
     * Opens a random-access stream with the specified options over the specified file.
     * @param {Integer} accessMode One of the enumeration values that specifies the type of access to allow.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.openasync
     */
    OpenAsync(accessMode) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.OpenAsync(accessMode)
    }

    /**
     * Opens a random-access stream to the file that can be used for transacted-write operations with the specified options.
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.opentransactedwriteasync
     */
    OpenTransactedWriteAsync() {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.OpenTransactedWriteAsync()
    }

    /**
     * Creates a copy of the [StorageFile](../windows.storage/storagefile.md), gives it the specified file name, and stores it in the specified [StorageFolder](../windows.storage/storagefolder.md).
     * @param {IStorageFolder} destinationFolder The folder in which to store the copied file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.copyasync
     */
    CopyOverloadDefaultNameAndOptions(destinationFolder) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.CopyOverloadDefaultNameAndOptions(destinationFolder)
    }

    /**
     * Creates a copy of the [StorageFile](../windows.storage/storagefile.md), gives it the specified file name, and stores it in the specified [StorageFolder](../windows.storage/storagefolder.md). The method also specifies what to do if a file with the same name already exists in the specified folder.
     * @param {IStorageFolder} destinationFolder The folder in which to store the copied file.
     * @param {HSTRING} desiredNewName The name of the new copy.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.copyasync
     */
    CopyOverloadDefaultOptions(destinationFolder, desiredNewName) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.CopyOverloadDefaultOptions(destinationFolder, desiredNewName)
    }

    /**
     * Creates a copy of the [StorageFile](../windows.storage/storagefile.md) and stores it in the specified [StorageFolder](../windows.storage/storagefolder.md).
     * @param {IStorageFolder} destinationFolder The folder in which to store the copied file.
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.copyasync
     */
    CopyOverload(destinationFolder, desiredNewName, option) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.CopyOverload(destinationFolder, desiredNewName, option)
    }

    /**
     * Replaces the specified [StorageFile](../windows.storage/storagefile.md) with a copy of the current file.
     * @param {IStorageFile} fileToReplace The [StorageFile](../windows.storage/storagefile.md) to be replaced.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.copyandreplaceasync
     */
    CopyAndReplaceAsync(fileToReplace) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.CopyAndReplaceAsync(fileToReplace)
    }

    /**
     * Moves the [StorageFile](../windows.storage/storagefile.md) to the specified folder, and gives the file the specified file name.
     * @param {IStorageFolder} destinationFolder The destination folder.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.moveasync
     */
    MoveOverloadDefaultNameAndOptions(destinationFolder) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.MoveOverloadDefaultNameAndOptions(destinationFolder)
    }

    /**
     * Moves the [StorageFile](../windows.storage/storagefile.md) to the specified folder and gives it the specified file name. The method also specifies what to do if a file with the same name already exists in the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder.
     * @param {HSTRING} desiredNewName The new file name.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.moveasync
     */
    MoveOverloadDefaultOptions(destinationFolder, desiredNewName) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.MoveOverloadDefaultOptions(destinationFolder, desiredNewName)
    }

    /**
     * Moves the [StorageFile](../windows.storage/storagefile.md) to the specified [StorageFolder](../windows.storage/storagefolder.md).
     * @param {IStorageFolder} destinationFolder The destination folder.
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.moveasync
     */
    MoveOverload(destinationFolder, desiredNewName, option) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.MoveOverload(destinationFolder, desiredNewName, option)
    }

    /**
     * Moves the current [StorageFile](../windows.storage/storagefile.md) from its location and uses it to replace the specified [StorageFile](../windows.storage/storagefile.md).
     * @param {IStorageFile} fileToReplace The [StorageFile](../windows.storage/storagefile.md) to be replaced.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.moveandreplaceasync
     */
    MoveAndReplaceAsync(fileToReplace) {
        if (!this.HasProp("__IStorageFile")) {
            if ((queryResult := this.QueryInterface(IStorageFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile := IStorageFile(outPtr)
        }

        return this.__IStorageFile.MoveAndReplaceAsync(fileToReplace)
    }

    /**
     * Opens a read-only, sequential-access stream over the [StorageFile](../windows.storage/storagefile.md).
     * @returns {IAsyncOperation<IInputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.opensequentialreadasync
     */
    OpenSequentialReadAsync() {
        if (!this.HasProp("__IInputStreamReference")) {
            if ((queryResult := this.QueryInterface(IInputStreamReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputStreamReference := IInputStreamReference(outPtr)
        }

        return this.__IInputStreamReference.OpenSequentialReadAsync()
    }

    /**
     * Opens a read-only, random-access stream over the [StorageFile](../windows.storage/storagefile.md).
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.openreadasync
     */
    OpenReadAsync() {
        if (!this.HasProp("__IRandomAccessStreamReference")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStreamReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStreamReference := IRandomAccessStreamReference(outPtr)
        }

        return this.__IRandomAccessStreamReference.OpenReadAsync()
    }

    /**
     * Renames the [StorageFile](../windows.storage/storagefile.md), and specifies what to do if a file with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The new name.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.renameasync
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
     * Renames the [StorageFile](../windows.storage/storagefile.md).
     * @param {HSTRING} desiredName The new name.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.renameasync
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
     * Deletes a file, optionally moving the deleted file to the recycle bin.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.deleteasync
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
     * Deletes a file.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.deleteasync
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
     * Retrieves the basic properties of the [StorageFile](../windows.storage/storagefile.md).
     * @returns {IAsyncOperation<BasicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.getbasicpropertiesasync
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
     * Determines whether the loaded [StorageFile](../windows.storage/storagefile.md) is the specified type.
     * @param {Integer} type The type of item to check against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.isoftype
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
     * Retrieves the thumbnail that is associated with the [StorageFile](../windows.storage/storagefile.md), scaling it to the specified size.
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.getthumbnailasync
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
     * Retrieves the thumbnail that is associated with the [StorageFile](../windows.storage/storagefile.md), based on the specified options.
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @param {Integer} requestedSize The requested size in pixels of thumbnail to retrieve.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.getthumbnailasync
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
     * Retrieves the thumbnail that is associated with the [StorageFile](../windows.storage/storagefile.md).
     * @param {Integer} mode_ The thumbnail mode to retrieve.
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.getthumbnailasync
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
     * Gets the parent folder of the current file.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.getparentasync
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
     * Indicates whether the current file is the same as the specified storage item.
     * @param {IStorageItem} item The [IStorageItem](../windows.storage/istorageitem.md) object that represents a storage item to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.isequal
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
     * 
     * @returns {Boolean} 
     */
    get_IsAvailable() {
        if (!this.HasProp("__IStorageFilePropertiesWithAvailability")) {
            if ((queryResult := this.QueryInterface(IStorageFilePropertiesWithAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFilePropertiesWithAvailability := IStorageFilePropertiesWithAvailability(outPtr)
        }

        return this.__IStorageFilePropertiesWithAvailability.get_IsAvailable()
    }

    /**
     * Opens a random-access stream with the specified options over the specified file.
     * @param {Integer} accessMode One of the enumeration values that specifies the type of access to allow.
     * @param {Integer} options 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.openasync
     */
    OpenWithOptionsAsync(accessMode, options) {
        if (!this.HasProp("__IStorageFile2")) {
            if ((queryResult := this.QueryInterface(IStorageFile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile2 := IStorageFile2(outPtr)
        }

        return this.__IStorageFile2.OpenWithOptionsAsync(accessMode, options)
    }

    /**
     * Opens a random-access stream to the file that can be used for transacted-write operations.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.fileinformation.opentransactedwriteasync
     */
    OpenTransactedWriteWithOptionsAsync(options) {
        if (!this.HasProp("__IStorageFile2")) {
            if ((queryResult := this.QueryInterface(IStorageFile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFile2 := IStorageFile2(outPtr)
        }

        return this.__IStorageFile2.OpenTransactedWriteWithOptionsAsync(options)
    }

;@endregion Instance Methods
}

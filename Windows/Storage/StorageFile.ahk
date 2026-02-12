#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageFile.ahk
#Include Streams\IInputStreamReference.ahk
#Include Streams\IRandomAccessStreamReference.ahk
#Include .\IStorageItem.ahk
#Include .\IStorageItemProperties.ahk
#Include .\IStorageItemProperties2.ahk
#Include .\IStorageItem2.ahk
#Include .\IStorageItemPropertiesWithProvider.ahk
#Include .\IStorageFilePropertiesWithAvailability.ahk
#Include .\IStorageFile2.ahk
#Include .\IStorageFileStatics.ahk
#Include .\IStorageFileStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a file. Provides information about the file and its content, and ways to manipulate them.
 * @remarks
 * Typically, you access StorageFile objects as the result of asynchronous method and/or function calls. For example, both of the static methods [GetFileFromPathAsync](storagefile_getfilefrompathasync_1252266672.md) and [GetFileFromApplicationUriAsync](storagefile_getfilefromapplicationuriasync_1702427701.md) return a StorageFile that represents the specified file.
 * 
 * Additionally, whenever you call a file picker to let the user pick a file (or files) the file picker will return the file as a StorageFile.
 * 
 * > [!NOTE]
 * > StorageFile objects can't represent files that are ".lnk", ".url", or ".wsh" file types.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageFile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageFile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageFile.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [StorageFile](storagefile.md) object to represent the file at the specified path.
     * @param {HSTRING} path_ The path of the file to get a [StorageFile](storagefile.md) to represent.
     * 
     * If your path uses slashes, make sure you use backslashes (\\). Forward slashes (/) are not accepted by this method.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getfilefrompathasync
     */
    static GetFileFromPathAsync(path_) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.GetFileFromPathAsync(path_)
    }

    /**
     * Gets a [StorageFile](storagefile.md) object to represent the specified Uniform Resource Identifier (URI) app resource. For examples of sample URIs see [Load images and assets tailored for scale, theme, high contrast, and others](/windows/uwp/app-resources/images-tailored-for-scale-theme-contrast).
     * @remarks
     * You can use this method to access your app's resources using either "ms-appx://" or "ms-appdata://"  Uniform Resource Identifier (URI).
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the app resource to get a [StorageFile](storagefile.md) to represent.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getfilefromapplicationuriasync
     */
    static GetFileFromApplicationUriAsync(uri_) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.GetFileFromApplicationUriAsync(uri_)
    }

    /**
     * Creates a [StorageFile](storagefile.md) to represent the specified stream of data. This method lets the app produce the data on-demand by specifying a function to be invoked when the [StorageFile](storagefile.md) that represents the stream is first accessed.
     * @remarks
     * Both this method and [CreateStreamedFileFromUriAsync](storagefile_createstreamedfilefromuriasync_983266077.md) can be used to create a [StorageFile](storagefile.md) that can be passed to other methods or passed to another app through app contracts.
     * 
     * These methods let you defer expensive operations to produce the data until that data needed (when it is first accessed). This avoids creating unnecessary delays in user interaction while the data is produced.
     * @param {HSTRING} displayNameWithExtension The user-friendly name of the [StorageFile](storagefile.md) to create, including a file type extension.
     * @param {StreamedFileDataRequestedHandler} dataRequested The function that should be invoked when the [StorageFile](storagefile.md) that is returned is first accessed. This function should produce the data stream represented by the returned [StorageFile](storagefile.md) and lets the app produce data on-demand instead of writing the contents of the file at creation time.
     * @param {IRandomAccessStreamReference} thumbnail The thumbnail image for the [StorageFile](storagefile.md) to create.
     * 
     * For a high-quality thumbnail, one edge of this thumbnail should be at least 1024 pixels.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.createstreamedfileasync
     */
    static CreateStreamedFileAsync(displayNameWithExtension, dataRequested, thumbnail) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.CreateStreamedFileAsync(displayNameWithExtension, dataRequested, thumbnail)
    }

    /**
     * Replaces the contents of the file referred to by the specified [IStorageFile](istoragefile.md) object with a new data stream. This method lets the app produce the data on-demand by specifying a function to be invoked when the [StorageFile](storagefile.md) that represents the stream is first accessed.
     * @remarks
     * This method lets you defer expensive operations to produce the data until that data needed (when it is first accessed). This avoids creating unnecessary delays in user interaction while the data is produced.
     * @param {IStorageFile} fileToReplace The file (type [IStorageFile](istoragefile.md)) that the new data stream should be written to.
     * @param {StreamedFileDataRequestedHandler} dataRequested The function that should be invoked when the [StorageFile](storagefile.md) that is returned is first accessed. This function should produce the data stream represented by the returned [StorageFile](storagefile.md) and lets the app produce data on-demand instead of writing the contents of the file at creation time.
     * @param {IRandomAccessStreamReference} thumbnail The thumbnail image for the [StorageFile](storagefile.md) to create.
     * 
     * For a high-quality thumbnail, one edge of this thumbnail should be at least 1024 pixels.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.replacewithstreamedfileasync
     */
    static ReplaceWithStreamedFileAsync(fileToReplace, dataRequested, thumbnail) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.ReplaceWithStreamedFileAsync(fileToReplace, dataRequested, thumbnail)
    }

    /**
     * Creates a [StorageFile](storagefile.md) to represent a stream of data from the specified Uniform Resource Identifier (URI) resource. This method lets the app download the data on-demand when the [StorageFile](storagefile.md) that represents the stream is first accessed.
     * @remarks
     * This method is nearly equivalent to [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md), except when using this method, the system provides a [StreamedFileDataRequestedHandler](streamedfiledatarequestedhandler.md) on the app's behalf and implements this function to download the specified [Uri](../windows.foundation/uri.md) into the streamed file.
     * @param {HSTRING} displayNameWithExtension The user-friendly name of the [StorageFile](storagefile.md) to create, including a file type extension.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the resource used to create the [StorageFile](storagefile.md).
     * @param {IRandomAccessStreamReference} thumbnail The thumbnail image for the [StorageFile](storagefile.md) to create.
     * 
     * For a high-quality thumbnail, one edge of this thumbnail should be at least 1024 pixels.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.createstreamedfilefromuriasync
     */
    static CreateStreamedFileFromUriAsync(displayNameWithExtension, uri_, thumbnail) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.CreateStreamedFileFromUriAsync(displayNameWithExtension, uri_, thumbnail)
    }

    /**
     * Replaces the contents of the file referred to by the specified [IStorageFile](istoragefile.md) object with a new data stream of the specified Uniform Resource Identifier (URI). This method lets the app download the data on-demand when the [StorageFile](storagefile.md) that represents the stream is first accessed.
     * 
     * The data stream is accessed through the [StorageFile](storagefile.md) that is returned and the data is downloaded on-demand when the [StorageFile](storagefile.md) is first accessed.
     * 
     * Replaces the [IStorageFile](istoragefile.md) object that represents the specified file with a new [StorageFile](storagefile.md) that provides a stream of the specified Uniform Resource Identifier (URI).
     * @param {IStorageFile} fileToReplace The file that the created [StorageFile](storagefile.md) will provide a stream of.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the resource used to create the [StorageFile](storagefile.md).
     * @param {IRandomAccessStreamReference} thumbnail The thumbnail image for the [StorageFile](storagefile.md) to create.
     * 
     * For a high-quality thumbnail, one edge of this thumbnail should be at least 1024 pixels.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.replacewithstreamedfilefromuriasync
     */
    static ReplaceWithStreamedFileFromUriAsync(fileToReplace, uri_, thumbnail) {
        if (!StorageFile.HasProp("__IStorageFileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics.IID)
            StorageFile.__IStorageFileStatics := IStorageFileStatics(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics.ReplaceWithStreamedFileFromUriAsync(fileToReplace, uri_, thumbnail)
    }

    /**
     * Gets a [StorageFile](storagefile.md) object based on an absolute path in the file system for a given user.
     * @remarks
     * This method is Multi-User Aware (MUA).
     * @param {User} user_ The User for which the [StorageFile](storagefile.md) is returned.
     * @param {HSTRING} path_ The path of the file to get a [StorageFile](storagefile.md) to represent.
     * 
     * If your path uses slashes, make sure you use backslashes (\\). Forward slashes (/) are not accepted by this method.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getfilefrompathforuserasync
     */
    static GetFileFromPathForUserAsync(user_, path_) {
        if (!StorageFile.HasProp("__IStorageFileStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageFile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageFileStatics2.IID)
            StorageFile.__IStorageFileStatics2 := IStorageFileStatics2(factoryPtr)
        }

        return StorageFile.__IStorageFileStatics2.GetFileFromPathForUserAsync(user_, path_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type (file name extension) of the file.
     * @remarks
     * The file type includes all characters starting with (and including) the final "." in the file name. For example, an image file might have the ".jpg" file type.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.filetype
     * @type {HSTRING} 
     */
    FileType {
        get => this.get_FileType()
    }

    /**
     * Gets the MIME type of the contents of the file.
     * @remarks
     * The `ContentType` property provides an interpretation of the file extension to determine the MIME type. It does not inspect the actual contents of the file. For example, renaming a text file (`.txt`) to have a `.jpg` extension will result in the `ContentType` being reported as `image/jpeg`.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the name of the file including the file name extension.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the full file-system path of the current file, if the file has a path.
     * @remarks
     * Do not rely on this property to access a file because some files may not have file-system paths. For example if the file is backed by a URI, or was picked using the file picker, the file is not guaranteed to have a file-system path.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the attributes of a file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.attributes
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the date and time when the current file was created.
     * @remarks
     * - **DateTime**: If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. Microsoft .NET languages do not use this type directly. In .NET it is projected as a `System.DateTimeOffset`. Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * - **DateTimeOffset**: Because the .NET `DateTimeOffset` is a structure, a `DateTimeOffset` object that has been declared but not otherwise initialized contains the default values for each of its member fields. This means that its `DateTime` property is set to `DateTimeOffset.MinValue` and its `Offset` property is set to `TimeSpan.Zero`. In string format, the `DateTimeOffset` that a file was created might be "4/18/2020 3:13:50 PM".
     * 
     * You should always check that this property is a real value and is not set to the default value.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Gets a user-friendly name for the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a user-friendly description of the type of the file.
     * @remarks
     * For example, an image file might have a user-friendly type of "JPG File".
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.displaytype
     * @type {HSTRING} 
     */
    DisplayType {
        get => this.get_DisplayType()
    }

    /**
     * Gets an identifier for the file. This ID is unique for the query result or [StorageFolder](storagefolder.md) that contains the file and can be used to distinguish between items that have the same name.
     * @remarks
     * You create a query result object when you create a query using one of the methods on a [StorageFolder](storagefolder.md) object. Depending on the method you call, your query result object could be a [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), a [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), or a [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.folderrelativeid
     * @type {HSTRING} 
     */
    FolderRelativeId {
        get => this.get_FolderRelativeId()
    }

    /**
     * Gets an object that provides access to the content-related properties of the file.
     * @remarks
     * > [!NOTE]
     * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
     * 
     * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.properties
     * @type {StorageItemContentProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [StorageProvider](storageprovider.md) object that contains info about the service that stores the current file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.provider
     * @type {StorageProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * Indicates if the file is local, is cached locally, or can be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.isavailable
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.openasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.opentransactedwriteasync
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
     * Creates a copy of the file in the specified folder and renames the copy.
     * @param {IStorageFolder} destinationFolder The destination folder where the copy of the file is created.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.copyasync
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
     * Creates a copy of the file in the specified folder and renames the copy. This method also specifies what to do if a file with the same name already exists in the destination folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the copy of the file is created.
     * @param {HSTRING} desiredNewName The new name for the copy of the file created in the *destinationFolder*.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.copyasync
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
     * Creates a copy of the file in the specified folder.
     * @remarks
     * This method uses the **FailIfExists** value from the [CreationCollisionOption](creationcollisionoption.md) enumeration by default. That is, this method raises an exception if a file with the same name already exists in the destination folder. If you want to handle a file name collision in a different way, call the [CopyAsync(IStorageFolder, String, NameCollisionOption)](storagefile_copyasync_460876542.md) overloaded method.
     * 
     * > [!NOTE]
     * > When StorageFile.CopyAsync is used to copy a file that is encrypted to a destination that is not encrypted, the call will fail with the following exception: `System.UnauthorizedAccessException: Access is denied. (Excep_FromHResult 0x80070005)`
     * @param {IStorageFolder} destinationFolder The destination folder where the copy of the file is created.
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.copyasync
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
     * Replaces the specified file with a copy of the current file.
     * @param {IStorageFile} fileToReplace The file to replace.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.copyandreplaceasync
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
     * Moves the current file to the specified folder and renames the file according to the desired name.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws a **System.Exception** with the following message: **Value does not fall within the expected range.**
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.moveasync
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
     * Moves the current file to the specified folder and renames the file according to the desired name. This method also specifies what to do if a file with the same name already exists in the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws a **System.Exception** with the following message: **Value does not fall within the expected range.**
     * @param {HSTRING} desiredNewName The desired name of the file after it is moved.
     * 
     * If there is an existing file in the destination folder that already has the specified *desiredNewName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.moveasync
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
     * Moves the current file to the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws a **System.Exception** with the following message: **Value does not fall within the expected range.**
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.moveasync
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
     * Moves the current file to the location of the specified file and replaces the specified file in that location.
     * @param {IStorageFile} fileToReplace The file to replace.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.moveandreplaceasync
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
     * Opens a sequential-access stream over the current file for reading file contents.
     * @returns {IAsyncOperation<IInputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.opensequentialreadasync
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
     * Opens a random-access stream over the current file for reading file contents.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.openreadasync
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
     * Renames the current file. This method also specifies what to do if an existing item in the current file's location has the same name.
     * @param {HSTRING} desiredName The desired, new name of the current file.
     * 
     * If there's an existing item in the current file's location that already has the specified *desiredName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.renameasync
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
     * Renames the current file.
     * @remarks
     * If the name you specify is invalid, this method throws an exception. To handle all the ways the specified name could be invalid, you must catch all of these exceptions:
     * 
     * - **E_INVALIDARG**
     * - **E_FAIL**
     * - **ERROR_FILENAME_EXCED_RANGE**
     * - **ERROR_INVALID_NAME**
     * 
     * If the file is deleted before the rename finishes, this method throws the **ERROR_FILE_NOT_FOUND** exception. You must also catch and handle this exception when you use this method.
     * 
     * If there's an existing item in the current file's location that already has the specified *desiredName*, the [RenameAsync(String, NameCollisionOption)](storagefile_renameasync_831946424.md) method should be used instead to specify how Windows responds to the conflict. This method doesn't allow you to specify a [NameCollisionOption](namecollisionoption.md) value, and the default behavior is to always throw an exception if there's a name conflict.
     * @param {HSTRING} desiredName The desired, new name of the current item.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.renameasync
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
     * Deletes the current file, optionally deleting the item permanently.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.deleteasync
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
     * Deletes the current file.
     * @remarks
     * This method uses [StorageDeleteOption.default](storagedeleteoption.md) to determine whether the item is deleted permanently.
     * 
     * **FileNotFoundException** is thrown if the file does not exist..
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.deleteasync
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
     * Gets the basic properties of the current file.
     * @remarks
     * This method will return **E_ILLEGAL_METHOD_CALL** if there are other async operations in progress on the same [IStorageItem](istorageitem.md) instance. Make sure that another thread isn't modifying the **IStorageItem** at the same time.
     * @returns {IAsyncOperation<BasicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getbasicpropertiesasync
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
     * Determines whether the current [StorageFile](storagefile.md) matches the specified [StorageItemTypes](storageitemtypes.md) value.
     * @param {Integer} type The value to match against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.isoftype
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
     * Retrieves an adjusted thumbnail image for the file, determined by the purpose of the thumbnail and the requested size.
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/thumbnails).
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getthumbnailasync
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
     * Retrieves an adjusted thumbnail image for the file, determined by the purpose of the thumbnail, the requested size, and the specified options.
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/thumbnails).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that it can scale to meet the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getthumbnailasync
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
     * Retrieves an adjusted thumbnail image for the file, determined by the purpose of the thumbnail.
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/thumbnails).
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getthumbnailasync
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
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getscaledimageasthumbnailasync
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
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that it can scale to meet the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getscaledimageasthumbnailasync
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
     * @remarks
     * While GetThumbnailAsync adheres to the max size supported by the thumbnail disk cache, GetScaledImageAsThumbnailAsync can extract thumbnails that are larger than what the thumbnail disk cache supports. GetScaledImageAsThumbnailAsync provides optimal quality but can affect performance by not using the disk cache if the thumbnail size is too large.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getscaledimageasthumbnailasync
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
     * Gets the parent folder of the current file.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.getparentasync
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
     * Indicates whether the current file is equal to the specified file.
     * @remarks
     * Use the IsEqual method to determine whether two storage items represent the same file or folder.
     * 
     * This method compares the [Path](storagefile_path.md) property of both items to determine if they are the same. If there is no [Path](storagefile_path.md) (if the item is a library for example), or if the paths do not match the items are compared using [IShellItem.Compare](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare).
     * 
     * This example shows how to compare two storage files for equality.
     * 
     * ```javascript
     * function openNewFile() {
     *     var picker = new Windows.Storage.Pickers.FileOpenPicker;
     *     picker.fileTypeFilter.replaceAll(["*"]);
     *     picker.pickSingleFileAsync().then(function (file) {
     *         var alreadyOpenedFile = null;
     *         _openFiles.some(function (openFile) {
     *             if (file.IsEqual(openFile.file)) {
     *                 alreadyOpenedFile = openFile;
     *                 return true;
     *             }
     *             return false;
     *         });
     * 
     *         if (alreadyOpenedFile != null) {
     *             alreadyOpenedFile.window.activate();
     *         } else {
     *             createNewFileViewerWindow(file);
     *         }
     *     });
     * }
     * ```
     * @param {IStorageItem} item The [IStorageItem](istorageitem.md) object that represents a file to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.isequal
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.openasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagefile.opentransactedwriteasync
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

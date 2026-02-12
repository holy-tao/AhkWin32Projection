#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IPhotoImportSession2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a photo import session with a photo import source.
 * @remarks
 * Get an instance of this class by accessing the [PhotoImportOperation.Session](photoimportoperation_session.md) property or by calling [PhotoImportSource.CreateImportSession](photoimportsource_createimportsession_1938274523.md).
 * 
 * For how-to guidance for adding media import to your app, see [Import media from a device](/windows/uwp/audio-video-camera/import-media-from-a-device).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the source device associated with the photo import session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.source
     * @type {PhotoImportSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets a unique identifier for the import session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.sessionid
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets or sets the destination folder for the photo import session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.destinationfolder
     * @type {IStorageFolder} 
     */
    DestinationFolder {
        get => this.get_DestinationFolder()
        set => this.put_DestinationFolder(value)
    }

    /**
     * Gets or sets a value specifying whether the session date should be appended to the destination folder name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.appendsessiondatetodestinationfolder
     * @type {Boolean} 
     */
    AppendSessionDateToDestinationFolder {
        get => this.get_AppendSessionDateToDestinationFolder()
        set => this.put_AppendSessionDateToDestinationFolder(value)
    }

    /**
     * Gets or sets a value indicating the method used for naming subfolders within the destination folder.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.subfoldercreationmode
     * @type {Integer} 
     */
    SubfolderCreationMode {
        get => this.get_SubfolderCreationMode()
        set => this.put_SubfolderCreationMode(value)
    }

    /**
     * Gets or sets the prefix for the destination file name.
     * @remarks
     * The prefix must consist of valid filename characters and may not exceed 64 characters.
     * It may not begin with a space or end in multiple spaces.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.destinationfilenameprefix
     * @type {HSTRING} 
     */
    DestinationFileNamePrefix {
        get => this.get_DestinationFileNamePrefix()
        set => this.put_DestinationFileNamePrefix(value)
    }

    /**
     * Gets or sets a value indicating the date format used by the session for subfolders.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.subfolderdateformat
     * @type {Integer} 
     */
    SubfolderDateFormat {
        get => this.get_SubfolderDateFormat()
        set => this.put_SubfolderDateFormat(value)
    }

    /**
     * Gets a value indicating whether the deselected items for the session should be remembered.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.rememberdeselecteditems
     * @type {Boolean} 
     */
    RememberDeselectedItems {
        get => this.get_RememberDeselectedItems()
        set => this.put_RememberDeselectedItems(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {PhotoImportSource} 
     */
    get_Source() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_Source()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_SessionId()
    }

    /**
     * 
     * @param {IStorageFolder} value 
     * @returns {HRESULT} 
     */
    put_DestinationFolder(value) {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.put_DestinationFolder(value)
    }

    /**
     * 
     * @returns {IStorageFolder} 
     */
    get_DestinationFolder() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_DestinationFolder()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AppendSessionDateToDestinationFolder(value) {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.put_AppendSessionDateToDestinationFolder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AppendSessionDateToDestinationFolder() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_AppendSessionDateToDestinationFolder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SubfolderCreationMode(value) {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.put_SubfolderCreationMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubfolderCreationMode() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_SubfolderCreationMode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DestinationFileNamePrefix(value) {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.put_DestinationFileNamePrefix(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DestinationFileNamePrefix() {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.get_DestinationFileNamePrefix()
    }

    /**
     * Asynchronously finds items on the source device that are available for import.
     * @param {Integer} contentTypeFilter A value indicating whether the find operation includes images, videos, or both in the results.
     * @param {Integer} itemSelectionMode A value indicating whether all items, no items, or only new items in the results are initially marked as selected.
     * @returns {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.finditemsasync
     */
    FindItemsAsync(contentTypeFilter, itemSelectionMode) {
        if (!this.HasProp("__IPhotoImportSession")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession := IPhotoImportSession(outPtr)
        }

        return this.__IPhotoImportSession.FindItemsAsync(contentTypeFilter, itemSelectionMode)
    }

    /**
     * Closes the photo import session and releases associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SubfolderDateFormat(value) {
        if (!this.HasProp("__IPhotoImportSession2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession2 := IPhotoImportSession2(outPtr)
        }

        return this.__IPhotoImportSession2.put_SubfolderDateFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubfolderDateFormat() {
        if (!this.HasProp("__IPhotoImportSession2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession2 := IPhotoImportSession2(outPtr)
        }

        return this.__IPhotoImportSession2.get_SubfolderDateFormat()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RememberDeselectedItems(value) {
        if (!this.HasProp("__IPhotoImportSession2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession2 := IPhotoImportSession2(outPtr)
        }

        return this.__IPhotoImportSession2.put_RememberDeselectedItems(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RememberDeselectedItems() {
        if (!this.HasProp("__IPhotoImportSession2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSession2 := IPhotoImportSession2(outPtr)
        }

        return this.__IPhotoImportSession2.get_RememberDeselectedItems()
    }

;@endregion Instance Methods
}

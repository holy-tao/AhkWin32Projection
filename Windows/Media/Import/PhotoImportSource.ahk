#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportSource.ahk
#Include .\IPhotoImportSourceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the source device for a photo import session.
 * @remarks
 * Get an instance of this class by accessing the [PhotoImportSession.Source](photoimportsession_source.md) property or by calling [PhotoImportSource.FromIdAsync](photoimportsource_fromidasync_1322863552.md) or [PhotoImportSource.FromFolderAsync](photoimportsource_fromfolderasync_1787212244.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of [PhotoImportSource](photoimportsource.md) from the specified device ID.
     * @param {HSTRING} sourceId The root folder from which the photo import source is created.
     * @returns {IAsyncOperation<PhotoImportSource>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.fromidasync
     */
    static FromIdAsync(sourceId) {
        if (!PhotoImportSource.HasProp("__IPhotoImportSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Import.PhotoImportSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhotoImportSourceStatics.IID)
            PhotoImportSource.__IPhotoImportSourceStatics := IPhotoImportSourceStatics(factoryPtr)
        }

        return PhotoImportSource.__IPhotoImportSourceStatics.FromIdAsync(sourceId)
    }

    /**
     * Creates a new instance of [PhotoImportSource](photoimportsource.md) from the specified root folder.
     * @param {IStorageFolder} sourceRootFolder The root folder from which the photo import source is created.
     * @returns {IAsyncOperation<PhotoImportSource>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.fromfolderasync
     */
    static FromFolderAsync(sourceRootFolder) {
        if (!PhotoImportSource.HasProp("__IPhotoImportSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Import.PhotoImportSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhotoImportSourceStatics.IID)
            PhotoImportSource.__IPhotoImportSourceStatics := IPhotoImportSourceStatics(factoryPtr)
        }

        return PhotoImportSource.__IPhotoImportSourceStatics.FromFolderAsync(sourceRootFolder)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a unique 16-byte identifier that is common across multiple transports supported by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the human-readable display name for the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a human-readable description of the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the source device's human-readable manufacturer name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.manufacturer
     * @type {HSTRING} 
     */
    Manufacturer {
        get => this.get_Manufacturer()
    }

    /**
     * Gets the device model name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.model
     * @type {HSTRING} 
     */
    Model {
        get => this.get_Model()
    }

    /**
     * Gets the serial number of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.serialnumber
     * @type {HSTRING} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * Gets the connection protocol that is being used to communicate with the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.connectionprotocol
     * @type {HSTRING} 
     */
    ConnectionProtocol {
        get => this.get_ConnectionProtocol()
    }

    /**
     * Gets a value indicating the transport mechanism that is being used for importing items from the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.connectiontransport
     * @type {Integer} 
     */
    ConnectionTransport {
        get => this.get_ConnectionTransport()
    }

    /**
     * Gets a value indicating the type of the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating the type of power source being used by the source device, if it is known.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.powersource
     * @type {Integer} 
     */
    PowerSource {
        get => this.get_PowerSource()
    }

    /**
     * The battery level of the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.batterylevelpercent
     * @type {IReference<Integer>} 
     */
    BatteryLevelPercent {
        get => this.get_BatteryLevelPercent()
    }

    /**
     * Gets the current date and time on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.datetime
     * @type {IReference<DateTime>} 
     */
    DateTime {
        get => this.get_DateTime()
    }

    /**
     * Gets a list of objects representing the different storage media exposed by the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.storagemedia
     * @type {IVectorView<PhotoImportStorageMedium>} 
     */
    StorageMedia {
        get => this.get_StorageMedia()
    }

    /**
     * Gets a value indicating if the source device is locked.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.islocked
     * @type {IReference<Boolean>} 
     */
    IsLocked {
        get => this.get_IsLocked()
    }

    /**
     * Gets a value indicating if the source device is a mass storage device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.ismassstorage
     * @type {Boolean} 
     */
    IsMassStorage {
        get => this.get_IsMassStorage()
    }

    /**
     * Gets a reference to a stream containing the thumbnail image for the source device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
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
    get_Id() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Manufacturer() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Manufacturer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Model() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Model()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SerialNumber() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_SerialNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionProtocol() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_ConnectionProtocol()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionTransport() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_ConnectionTransport()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerSource() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_PowerSource()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_BatteryLevelPercent() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_BatteryLevelPercent()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_DateTime() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_DateTime()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportStorageMedium>} 
     */
    get_StorageMedia() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_StorageMedia()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsLocked() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_IsLocked()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMassStorage() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_IsMassStorage()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.get_Thumbnail()
    }

    /**
     * Creates a new photo import session.
     * @returns {PhotoImportSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsource.createimportsession
     */
    CreateImportSession() {
        if (!this.HasProp("__IPhotoImportSource")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSource := IPhotoImportSource(outPtr)
        }

        return this.__IPhotoImportSource.CreateImportSession()
    }

;@endregion Instance Methods
}

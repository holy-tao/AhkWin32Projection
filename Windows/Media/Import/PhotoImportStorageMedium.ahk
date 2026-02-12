#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportStorageMedium.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a storage medium exposed by a photo import source device.
 * @remarks
 * Get an instance of this class by accessing the [PhotoImportSource.StorageMedia](photoimportsource_storagemedia.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportStorageMedium extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportStorageMedium

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportStorageMedium.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the storage medium.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a description of the storage medium.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the serial number of the storage medium.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.serialnumber
     * @type {HSTRING} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * Gets the type of the storage medium.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.storagemediumtype
     * @type {Integer} 
     */
    StorageMediumType {
        get => this.get_StorageMediumType()
    }

    /**
     * Gets a value indicating the access modes supported by the storage medium.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.supportedaccessmode
     * @type {Integer} 
     */
    SupportedAccessMode {
        get => this.get_SupportedAccessMode()
    }

    /**
     * Gets the capacity of the storage media, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.capacityinbytes
     * @type {Integer} 
     */
    CapacityInBytes {
        get => this.get_CapacityInBytes()
    }

    /**
     * Gets the available space on the storage medium, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.availablespaceinbytes
     * @type {Integer} 
     */
    AvailableSpaceInBytes {
        get => this.get_AvailableSpaceInBytes()
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
    get_Name() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SerialNumber() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_SerialNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StorageMediumType() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_StorageMediumType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedAccessMode() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_SupportedAccessMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CapacityInBytes() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_CapacityInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvailableSpaceInBytes() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.get_AvailableSpaceInBytes()
    }

    /**
     * Refreshes the information about the storage medium.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemedium.refresh
     */
    Refresh() {
        if (!this.HasProp("__IPhotoImportStorageMedium")) {
            if ((queryResult := this.QueryInterface(IPhotoImportStorageMedium.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportStorageMedium := IPhotoImportStorageMedium(outPtr)
        }

        return this.__IPhotoImportStorageMedium.Refresh()
    }

;@endregion Instance Methods
}

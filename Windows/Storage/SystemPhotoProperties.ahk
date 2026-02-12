#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemPhotoProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [Windows photo file properties](/windows/desktop/properties/photo-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemPhotoProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemPhotoProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemPhotoProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Photo.CameraManufacturer](/windows/desktop/properties/props-system-photo-cameramanufacturer) property (one of the [Windows photo file properties](/windows/desktop/properties/photo-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties.cameramanufacturer
     * @type {HSTRING} 
     */
    CameraManufacturer {
        get => this.get_CameraManufacturer()
    }

    /**
     * Gets the name of the [System.Photo.CameraModel](/windows/desktop/properties/props-system-photo-cameramodel) property (one of the [Windows photo file properties](/windows/desktop/properties/photo-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties.cameramodel
     * @type {HSTRING} 
     */
    CameraModel {
        get => this.get_CameraModel()
    }

    /**
     * Gets the name of the [System.Photo.DateTaken](/windows/desktop/properties/props-system-photo-datetaken) property (one of the [Windows photo file properties](/windows/desktop/properties/photo-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties.datetaken
     * @type {HSTRING} 
     */
    DateTaken {
        get => this.get_DateTaken()
    }

    /**
     * Gets the name of the [System.Photo.Orientation](/windows/desktop/properties/props-system-photo-orientation) property (one of the [Windows photo file properties](/windows/desktop/properties/photo-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties.orientation
     * @type {HSTRING} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the name of the [System.Photo.PeopleNames](/windows/desktop/properties/props-system-photo-peoplenames) property (one of the [Windows photo file properties](/windows/desktop/properties/photo-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemphotoproperties.peoplenames
     * @type {HSTRING} 
     */
    PeopleNames {
        get => this.get_PeopleNames()
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
    get_CameraManufacturer() {
        if (!this.HasProp("__ISystemPhotoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemPhotoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemPhotoProperties := ISystemPhotoProperties(outPtr)
        }

        return this.__ISystemPhotoProperties.get_CameraManufacturer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraModel() {
        if (!this.HasProp("__ISystemPhotoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemPhotoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemPhotoProperties := ISystemPhotoProperties(outPtr)
        }

        return this.__ISystemPhotoProperties.get_CameraModel()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DateTaken() {
        if (!this.HasProp("__ISystemPhotoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemPhotoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemPhotoProperties := ISystemPhotoProperties(outPtr)
        }

        return this.__ISystemPhotoProperties.get_DateTaken()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISystemPhotoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemPhotoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemPhotoProperties := ISystemPhotoProperties(outPtr)
        }

        return this.__ISystemPhotoProperties.get_Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PeopleNames() {
        if (!this.HasProp("__ISystemPhotoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemPhotoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemPhotoProperties := ISystemPhotoProperties(outPtr)
        }

        return this.__ISystemPhotoProperties.get_PeopleNames()
    }

;@endregion Instance Methods
}

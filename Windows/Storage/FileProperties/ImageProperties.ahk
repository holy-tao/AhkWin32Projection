#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the image-related properties of an item (like a file or folder).
 * @remarks
 * You can access a ImageProperties object asynchronously using the [getImagePropertiesAsync](storageitemcontentproperties_getimagepropertiesasync_292219360.md) method from the [Properties](../windows.storage/istorageitemproperties_properties.md) property of an item (like a file of folder), or synchronously using the [ImageProperties](../windows.storage.bulkaccess/istorageiteminformation_imageproperties.md) property if it is available.
 * You can get a ImageProperties object using any of the following methods and properties:
 * 
 * + [StorageItemContentProperties.getImagePropertiesAsync](storageitemcontentproperties_getimagepropertiesasync_292219360.md) method, which can be accessed using the [Properties](../windows.storage/istorageitemproperties_properties.md) property, if it is available.
 * + [FileInformation.imageProperties](../windows.storage.bulkaccess/fileinformation_imageproperties.md) property
 * + [FolderInformation.imageProperties](../windows.storage.bulkaccess/folderinformation_imageproperties.md) property
 * 
 * 
 * > [!NOTE]
 * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
 * 
 * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class ImageProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rating associated with an image file.
     * @remarks
     * The rating property for this media file type is obtained from the [Windows file properties](/windows/desktop/properties/props), specifically from [System.Rating](/windows/desktop/properties/props-system-rating). [System.Rating](/windows/desktop/properties/props-system-rating) has a value from 0 to 99. A value of 0 indicates that the file has not been rated.
     * 
     * Rating info is often presented to the user as a “star” metaphor, where a star rating can be from 0 to 5 stars. This is shown as the outline of 5 star shapes, with the current rating indicated by a horizontal color bar within the 5 star shapes. For more info, see [Guidelines for the Rating control](/windows/uwp/design/controls-and-patterns/index).
     * 
     * For HTML UI, the [Rating](/previous-versions/windows/apps/br211895(v=win.10)) control implements a star-rating behavior, but you’ll have convert a **Rating** property value into the star-count values that the [Rating](/previous-versions/windows/apps/br211895(v=win.10)) control uses for its properties.
     * 
     * For XAML UI there is no default rating control in the Windows Runtime XAML vocabulary. However, several third-party control vendors have created a XAML rating control.
     * 
     * Here’s some suggested logic for converting the 0-99 possible value of a **Rating** property to an integer value between 0 and 5 that is suitable for a 5-star UI presentation metaphor, and for the [Rating](/previous-versions/windows/apps/br211895(v=win.10)) control: `uint starRating = rating == 0 ? 0 : (uint)Math.Round((double)rating / 25.0) + 1;
     * `.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.rating
     * @type {Integer} 
     */
    Rating {
        get => this.get_Rating()
        set => this.put_Rating(value)
    }

    /**
     * Gets the collection of keywords associated with the image.
     * @remarks
     * This property is read-only. It returns a collection, and you can't delete or replace the collection itself. The contents of the collection, however, are not read-only. You can add items to the collection, remove items from the collection, and change existing items in the collection. Call the **SavePropertiesAsync** method of the parent class to save the updated contents of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.keywords
     * @type {IVector<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * Gets or sets the date when the image was taken.
     * @remarks
     * If the date property isn't set, this value defaults to January 1, 1601 00:00:00. You should always check that this property is a real value and not the default date.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.datetaken
     * @type {DateTime} 
     */
    DateTaken {
        get => this.get_DateTaken()
        set => this.put_DateTaken(value)
    }

    /**
     * Gets the width of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets or sets the title of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the latitude coordinate where the photo was taken.
     * @remarks
     * To set the latitude or longitude of the photo, you must set all four of the file properties that are used to compute the latitude coordinate.
     * 
     * For code examples that demonstrate working with Latitude, [Longitude](imageproperties_longitude.md) and their underlying file properties, see the [Simple imaging sample](https://github.com/microsoft/Windows-universal-samples/blob/master/Samples/SimpleImaging/README.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.latitude
     * @type {IReference<Float>} 
     */
    Latitude {
        get => this.get_Latitude()
    }

    /**
     * Gets the longitude coordinate where the photo was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.longitude
     * @type {IReference<Float>} 
     */
    Longitude {
        get => this.get_Longitude()
    }

    /**
     * Gets or sets the manufacturer of the camera that took the photo.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.cameramanufacturer
     * @type {HSTRING} 
     */
    CameraManufacturer {
        get => this.get_CameraManufacturer()
        set => this.put_CameraManufacturer(value)
    }

    /**
     * Gets or sets the model of the camera that took the photo.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.cameramodel
     * @type {HSTRING} 
     */
    CameraModel {
        get => this.get_CameraModel()
        set => this.put_CameraModel(value)
    }

    /**
     * Gets the Exchangeable Image File (EXIF) orientation flag of the photo.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the names of people who are tagged in the photo.
     * @remarks
     * This property is read-only. You can't delete or replace the collection itself, and the contents of the collection are also read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.peoplenames
     * @type {IVectorView<HSTRING>} 
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
     * @returns {Integer} 
     */
    get_Rating() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Rating()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rating(value) {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.put_Rating(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Keywords() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Keywords()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateTaken() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_DateTaken()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_DateTaken(value) {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.put_DateTaken(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.put_Title(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Latitude() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Latitude()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Longitude() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Longitude()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraManufacturer() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_CameraManufacturer()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CameraManufacturer(value) {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.put_CameraManufacturer(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraModel() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_CameraModel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CameraModel(value) {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.put_CameraModel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_Orientation()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PeopleNames() {
        if (!this.HasProp("__IImageProperties")) {
            if ((queryResult := this.QueryInterface(IImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageProperties := IImageProperties(outPtr)
        }

        return this.__IImageProperties.get_PeopleNames()
    }

    /**
     * Retrieves the specified properties associated with the item.
     * @remarks
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.retrievepropertiesasync
     */
    RetrievePropertiesAsync(propertiesToRetrieve) {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.RetrievePropertiesAsync(propertiesToRetrieve)
    }

    /**
     * Saves all properties associated with the item.
     * @remarks
     * If any one of the property values is invalid, none of the values will be saved.
     * @param {IIterable<IKeyValuePair<HSTRING, IInspectable>>} propertiesToSave 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.savepropertiesasync
     */
    SavePropertiesAsync(propertiesToSave) {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.SavePropertiesAsync(propertiesToSave)
    }

    /**
     * Saves the specified properties and values associated with the item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.savepropertiesasync
     */
    SavePropertiesAsyncOverloadDefault() {
        if (!this.HasProp("__IStorageItemExtraProperties")) {
            if ((queryResult := this.QueryInterface(IStorageItemExtraProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemExtraProperties := IStorageItemExtraProperties(outPtr)
        }

        return this.__IStorageItemExtraProperties.SavePropertiesAsyncOverloadDefault()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the video-related properties of an item (like a file or folder).
 * @remarks
 * You can access a VideoProperties object asynchronously using the [getVideoPropertiesAsync](storageitemcontentproperties_getvideopropertiesasync_1365065087.md) method from the [Properties](../windows.storage/istorageitemproperties_properties.md) property of an item (like a file of folder), or synchronously using the [VideoProperties](../windows.storage.bulkaccess/istorageiteminformation_videoproperties.md) property if it is available.
 * You can get a VideoProperties object using any of the following methods and properties:
 * 
 * + [StorageItemContentProperties.getVideoPropertiesAsync](storageitemcontentproperties_getvideopropertiesasync_1365065087.md) method, which can be accessed using the [Properties](../windows.storage/istorageitemproperties_properties.md) property, if it is available.
 * + [FileInformation.videoProperties](../windows.storage.bulkaccess/fileinformation_videoproperties.md) property
 * + [FolderInformation.videoProperties](../windows.storage.bulkaccess/folderinformation_videoproperties.md) property
 * 
 * 
 * > [!NOTE]
 * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
 * 
 * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class VideoProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rating associated with a video file.
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.rating
     * @type {Integer} 
     */
    Rating {
        get => this.get_Rating()
        set => this.put_Rating(value)
    }

    /**
     * Gets the collection of keywords associated with the video.
     * @remarks
     * This property is read-only, similar to the [Directors](videoproperties_directors.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.keywords
     * @type {IVector<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * Gets the width of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the duration of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the latitude coordinate where the video was shot.
     * @remarks
     * To set the latitude or longitude of the video, you must set all four of the file properties that are used to compute the latitude or longitude coordinates.
     * 
     * For code examples that demonstrate working with Latitude, [Longitude](videoproperties_longitude.md) and their underlying file properties, see the [Simple imaging sample](https://github.com/microsoft/Windows-universal-samples/blob/master/Samples/SimpleImaging/README.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.latitude
     * @type {IReference<Float>} 
     */
    Latitude {
        get => this.get_Latitude()
    }

    /**
     * Gets the longitude coordinate where the video was shot.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.longitude
     * @type {IReference<Float>} 
     */
    Longitude {
        get => this.get_Longitude()
    }

    /**
     * Gets or sets the title of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the subtitle of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.subtitle
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
    }

    /**
     * Gets the producers of the video.
     * @remarks
     * This property is read-only, similar to the [Directors](videoproperties_directors.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.producers
     * @type {IVector<HSTRING>} 
     */
    Producers {
        get => this.get_Producers()
    }

    /**
     * Gets or sets the publisher of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.publisher
     * @type {HSTRING} 
     */
    Publisher {
        get => this.get_Publisher()
        set => this.put_Publisher(value)
    }

    /**
     * Gets the script writers for the video.
     * @remarks
     * This property is read-only, similar to the [Directors](videoproperties_directors.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.writers
     * @type {IVector<HSTRING>} 
     */
    Writers {
        get => this.get_Writers()
    }

    /**
     * Gets or sets the year that the video was shot or released.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.year
     * @type {Integer} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
    }

    /**
     * Gets the sum audio and video bitrate of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.bitrate
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
    }

    /**
     * Gets the directors of the video.
     * @remarks
     * This property is read-only. It returns a collection, and you can't delete or replace the collection itself. The contents of the collection, however, are not read-only. You can add items to the collection, remove items from the collection, and change existing items in the collection. Call the **SavePropertiesAsync** method of the parent class to save the updated contents of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.directors
     * @type {IVector<HSTRING>} 
     */
    Directors {
        get => this.get_Directors()
    }

    /**
     * Gets a [VideoOrientation](videoorientation.md) value that indicates how the video should be rotated to display it correctly.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
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
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Rating()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rating(value) {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.put_Rating(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Keywords() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Keywords()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Height()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Duration()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Latitude() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Latitude()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Longitude() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Longitude()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Subtitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.put_Subtitle(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Producers() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Producers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Publisher() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Publisher()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Publisher(value) {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.put_Publisher(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Writers() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Writers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Year()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Year(value) {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.put_Year(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Bitrate()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Directors() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Directors()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IVideoProperties")) {
            if ((queryResult := this.QueryInterface(IVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoProperties := IVideoProperties(outPtr)
        }

        return this.__IVideoProperties.get_Orientation()
    }

    /**
     * Retrieves the specified properties associated with the item.
     * @remarks
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.retrievepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.savepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoproperties.savepropertiesasync
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

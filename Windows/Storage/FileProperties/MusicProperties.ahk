#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMusicProperties.ahk
#Include .\IStorageItemExtraProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the music-related properties of an item (like a file or folder).
 * @remarks
 * You can access a MusicProperties object asynchronously using the [GetMusicPropertiesAsync](storageitemcontentproperties_getmusicpropertiesasync_1352653225.md) method from the [Properties](../windows.storage/istorageitemproperties_properties.md) property of an item (like a file of folder), or synchronously using the [MusicProperties](../windows.storage.bulkaccess/istorageiteminformation_musicproperties.md) property if it is available.
 * You can get a musicProperties object using any of the following methods and properties:
 * 
 * + [StorageItemContentProperties.GetMusicPropertiesAsync](storageitemcontentproperties_getmusicpropertiesasync_1352653225.md) method, which can be accessed using the [Properties](../windows.storage/istorageitemproperties_properties.md) property, if it is available.
 * + [FileInformation.MusicProperties](../windows.storage.bulkaccess/fileinformation_musicproperties.md) property
 * + [FolderInformation.MusicProperties](../windows.storage.bulkaccess/folderinformation_musicproperties.md) property
 * 
 * 
 * > [!NOTE]
 * > Properties that are get or set using a property handler that is defined by another app (like Microsoft Word) may not be accessible. Instead, you can try to get these properties using a file query that is backed by the system index. For more information, see [QueryOptions](../windows.storage.search/queryoptions.md).
 * 
 * For more code samples about accessing properties, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class MusicProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMusicProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMusicProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the album that contains the song.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.album
     * @type {HSTRING} 
     */
    Album {
        get => this.get_Album()
        set => this.put_Album(value)
    }

    /**
     * Gets the artists that contributed to the song.
     * @remarks
     * This is how the value returned by the Artist property is determined:
     * 
     * 1. If the [AlbumArtist](musicproperties_albumartist.md) property of the song contains a value, the value of the [AlbumArtist](musicproperties_albumartist.md) property is returned.
     * 1. If the [AlbumArtist](musicproperties_albumartist.md) property of the song does not contain a value, and the song is marked as part of a compilation, the value "Various Artists" is returned.
     * 1. Otherwise, the first value from the contributing artists list is returned. The contributing artists list is the value of the **System.Music.Artist** file property.
     * If you want to get the album artist, use [AlbumArtist](musicproperties_albumartist.md) instead.
     * 
     * If you want to get the list of all the contributing artists, query the value of the **System.Music.Artist** file property. The following example shows how to do this.
     * 
     * ```csharp
     * using Windows.Storage;
     * using Windows.Storage.FileProperties;
     * ...
     *     StorageFile musicFile = 
     *         await StorageFile.GetFileFromApplicationUriAsync(new Uri("ms-appx:///assets/song.mp3"));
     *     StorageItemContentProperties fileProperties = musicFile.Properties;
     *     MusicProperties musicFileProperties =
     *         await fileProperties.GetMusicPropertiesAsync();
     *     string[] contributingArtistsKey = { "System.Music.Artist" };
     *     IDictionary<string, object> contributingArtistsProperty =
     *         await musicFileProperties.RetrievePropertiesAsync(contributingArtistsKey);
     *     string[] contributingArtists = contributingArtistsProperty["System.Music.Artist"] as string[];
     *     foreach (string contributingArtist in contributingArtists)
     *     {
     *         // Do something with the name of each contributing artist.
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.artist
     * @type {HSTRING} 
     */
    Artist {
        get => this.get_Artist()
        set => this.put_Artist(value)
    }

    /**
     * Gets the names of music genres that the song belongs to.
     * @remarks
     * This property is read-only, similar to the [Composers](musicproperties_composers.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.genre
     * @type {IVector<HSTRING>} 
     */
    Genre {
        get => this.get_Genre()
    }

    /**
     * Gets or sets the track number of the song on the song's album.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.tracknumber
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
        set => this.put_TrackNumber(value)
    }

    /**
     * Gets or sets the title of the song
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the rating associated with a music file.
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.rating
     * @type {Integer} 
     */
    Rating {
        get => this.get_Rating()
        set => this.put_Rating(value)
    }

    /**
     * Gets the duration of the song in milliseconds.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the bit rate of the song file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.bitrate
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
    }

    /**
     * Gets or sets the name of the album artist of the song.
     * @remarks
     * If you want to get the names of all the artists that contributed to the song (from the song's [System.Music.Artist](/windows/desktop/properties/props-system-music-artist) file property) use [Artist](musicproperties_artist.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.albumartist
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
        set => this.put_AlbumArtist(value)
    }

    /**
     * Gets the composers of the song.
     * @remarks
     * This property is read-only. It returns a collection, and you can't delete or replace the collection itself. The contents of the collection, however, are not read-only. You can add items to the collection, remove items from the collection, and change existing items in the collection. Call the **SavePropertiesAsync** method of the parent class to save the updated contents of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.composers
     * @type {IVector<HSTRING>} 
     */
    Composers {
        get => this.get_Composers()
    }

    /**
     * Gets the conductors of the song.
     * @remarks
     * This property is read-only, similar to the [Composers](musicproperties_composers.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.conductors
     * @type {IVector<HSTRING>} 
     */
    Conductors {
        get => this.get_Conductors()
    }

    /**
     * Gets or sets the subtitle of the song.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.subtitle
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
    }

    /**
     * Gets the producers of the song.
     * @remarks
     * This property is read-only, similar to the [Composers](musicproperties_composers.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.producers
     * @type {IVector<HSTRING>} 
     */
    Producers {
        get => this.get_Producers()
    }

    /**
     * Gets or sets the publisher of the song.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.publisher
     * @type {HSTRING} 
     */
    Publisher {
        get => this.get_Publisher()
        set => this.put_Publisher(value)
    }

    /**
     * Gets the songwriters.
     * @remarks
     * This property is read-only. It returns a collection, and you can't delete or replace the collection itself. The contents of the collection, however, are not read-only. You can add items to the collection, remove items from the collection, and change existing items in the collection. Call the **SavePropertiesAsync** method of the parent class to save the updated contents of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.writers
     * @type {IVector<HSTRING>} 
     */
    Writers {
        get => this.get_Writers()
    }

    /**
     * Gets or sets the year that the song was released.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.year
     * @type {Integer} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
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
    get_Album() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Album()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Album(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Album(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Artist() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Artist()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Artist(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Artist(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Genre() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Genre()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackNumber() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_TrackNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TrackNumber(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_TrackNumber(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Title(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rating() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Rating()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rating(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Rating(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Duration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Bitrate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumArtist() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_AlbumArtist()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AlbumArtist(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_AlbumArtist(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Composers() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Composers()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Conductors() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Conductors()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Subtitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Subtitle(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Producers() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Producers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Publisher() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Publisher()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Publisher(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Publisher(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Writers() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Writers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Year() {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.get_Year()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Year(value) {
        if (!this.HasProp("__IMusicProperties")) {
            if ((queryResult := this.QueryInterface(IMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicProperties := IMusicProperties(outPtr)
        }

        return this.__IMusicProperties.put_Year(value)
    }

    /**
     * Retrieves the specified music-related Windows file properties associated with the item.
     * @remarks
     * For more information about the music-related file properties you can retrieve using this method, see [Music Windows Properties](/windows/desktop/properties/music-bumper).
     * 
     * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.retrievepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.savepropertiesasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.musicproperties.savepropertiesasync
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

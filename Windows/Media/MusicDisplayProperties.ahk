#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMusicDisplayProperties.ahk
#Include .\IMusicDisplayProperties2.ahk
#Include .\IMusicDisplayProperties3.ahk
#Include ..\..\Guid.ahk

/**
 * Provides properties for music information that is displayed by the [SystemMediaTransportControlsDisplayUpdater](systemmediatransportcontrolsdisplayupdater.md) class.
 * @remarks
 * Starting with Windows 10, version 1607, UWP apps that use the [MediaPlayer](../windows.media.playback/mediaplayer.md) class or [AudioGraph](../windows.media.audio/audiograph.md) class to play media are automatically integrated with the System Media Transport Controls by default. When using automatic integration, you can get an instance of the **MusicDisplayProperties** class using the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) class. Call [GetDisplayProperties](../windows.media.playback/mediaplaybackitem_getdisplayproperties_103236454.md) to get an instance of the [MediaItemDisplayProperties](../windows.media.playback/mediaitemdisplayproperties.md) class. Update the object with the values you want to be displayed for the item in the SMTC and then call [ApplyDisplayProperties](../windows.media.playback/mediaplaybackitem_applydisplayproperties_1634192028.md) to commit the changes. For how-to guidance on using the SMTC from your app, see [Integrate with the SystemMediaTransportControls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * 
 * When manually controlling the SMTC, get an instance of **MusicDisplayProperties** by using the [SystemMediaTransportControlsDisplayUpdater](systemmediatransportcontrolsdisplayupdater.md) class. For how-to guidance on manually controlling the SMTC, see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MusicDisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMusicDisplayProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMusicDisplayProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or set the title of the song.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the name of the album artist.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.albumartist
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
        set => this.put_AlbumArtist(value)
    }

    /**
     * Gets or set the name of the song artist.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.artist
     * @type {HSTRING} 
     */
    Artist {
        get => this.get_Artist()
        set => this.put_Artist(value)
    }

    /**
     * Gets or sets the album title.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.albumtitle
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
        set => this.put_AlbumTitle(value)
    }

    /**
     * Gets or sets the track number.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.tracknumber
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
        set => this.put_TrackNumber(value)
    }

    /**
     * Gets a modifiable list of strings representing genre names.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.genres
     * @type {IVector<HSTRING>} 
     */
    Genres {
        get => this.get_Genres()
    }

    /**
     * Gets or sets the album track count.
     * @see https://learn.microsoft.com/uwp/api/windows.media.musicdisplayproperties.albumtrackcount
     * @type {Integer} 
     */
    AlbumTrackCount {
        get => this.get_AlbumTrackCount()
        set => this.put_AlbumTrackCount(value)
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
    get_Title() {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumArtist() {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.get_AlbumArtist()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AlbumArtist(value) {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.put_AlbumArtist(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Artist() {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.get_Artist()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Artist(value) {
        if (!this.HasProp("__IMusicDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties := IMusicDisplayProperties(outPtr)
        }

        return this.__IMusicDisplayProperties.put_Artist(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumTitle() {
        if (!this.HasProp("__IMusicDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties2 := IMusicDisplayProperties2(outPtr)
        }

        return this.__IMusicDisplayProperties2.get_AlbumTitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AlbumTitle(value) {
        if (!this.HasProp("__IMusicDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties2 := IMusicDisplayProperties2(outPtr)
        }

        return this.__IMusicDisplayProperties2.put_AlbumTitle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackNumber() {
        if (!this.HasProp("__IMusicDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties2 := IMusicDisplayProperties2(outPtr)
        }

        return this.__IMusicDisplayProperties2.get_TrackNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TrackNumber(value) {
        if (!this.HasProp("__IMusicDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties2 := IMusicDisplayProperties2(outPtr)
        }

        return this.__IMusicDisplayProperties2.put_TrackNumber(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Genres() {
        if (!this.HasProp("__IMusicDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties2 := IMusicDisplayProperties2(outPtr)
        }

        return this.__IMusicDisplayProperties2.get_Genres()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlbumTrackCount() {
        if (!this.HasProp("__IMusicDisplayProperties3")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties3 := IMusicDisplayProperties3(outPtr)
        }

        return this.__IMusicDisplayProperties3.get_AlbumTrackCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlbumTrackCount(value) {
        if (!this.HasProp("__IMusicDisplayProperties3")) {
            if ((queryResult := this.QueryInterface(IMusicDisplayProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMusicDisplayProperties3 := IMusicDisplayProperties3(outPtr)
        }

        return this.__IMusicDisplayProperties3.put_AlbumTrackCount(value)
    }

;@endregion Instance Methods
}

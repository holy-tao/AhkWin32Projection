#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionMediaProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Holds information about the content that the current session has.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionMediaProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSessionMediaProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSessionMediaProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the title.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the subtitle.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.subtitle
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
    }

    /**
     * Gets the album's artist
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.albumartist
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
    }

    /**
     * Gets the Artist's name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.artist
     * @type {HSTRING} 
     */
    Artist {
        get => this.get_Artist()
    }

    /**
     * Gets the title of the album.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.albumtitle
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
    }

    /**
     * The number associated with this track
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.tracknumber
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
    }

    /**
     * Gets the list of genres.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.genres
     * @type {IVectorView<HSTRING>} 
     */
    Genres {
        get => this.get_Genres()
    }

    /**
     * Gets the total number of tracks on the album.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.albumtrackcount
     * @type {Integer} 
     */
    AlbumTrackCount {
        get => this.get_AlbumTrackCount()
    }

    /**
     * The playback type of the content
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.playbacktype
     * @type {IReference<Integer>} 
     */
    PlaybackType {
        get => this.get_PlaybackType()
    }

    /**
     * A reference to a RandomAccessStream of the thumbnail image associated with this content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionmediaproperties.thumbnail
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
    get_Title() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_Subtitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumArtist() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_AlbumArtist()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Artist() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_Artist()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumTitle() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_AlbumTitle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackNumber() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_TrackNumber()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Genres() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_Genres()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlbumTrackCount() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_AlbumTrackCount()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PlaybackType() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_PlaybackType()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionMediaProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionMediaProperties := IGlobalSystemMediaTransportControlsSessionMediaProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionMediaProperties.get_Thumbnail()
    }

;@endregion Instance Methods
}

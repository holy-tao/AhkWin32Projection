#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMusicProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [Windows music file properties](/windows/desktop/properties/music-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemMusicProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMusicProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMusicProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Music.AlbumArtist](/windows/desktop/properties/props-system-music-albumartist) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.albumartist
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
    }

    /**
     * Gets the name of the [System.Music.AlbumTitle](/windows/desktop/properties/props-system-music-albumtitle) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.albumtitle
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
    }

    /**
     * Gets the name of the [System.Music.Artist](/windows/desktop/properties/props-system-music-artist) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.artist
     * @type {HSTRING} 
     */
    Artist {
        get => this.get_Artist()
    }

    /**
     * Gets the name of the [System.Music.Composer](/windows/desktop/properties/props-system-music-composer) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.composer
     * @type {HSTRING} 
     */
    Composer {
        get => this.get_Composer()
    }

    /**
     * Gets the name of the [System.Music.Conductor](/windows/desktop/properties/props-system-music-conductor) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.conductor
     * @type {HSTRING} 
     */
    Conductor {
        get => this.get_Conductor()
    }

    /**
     * Gets the name of the [System.Music.DisplayArtist](/windows/desktop/properties/props-system-music-displayartist) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.displayartist
     * @type {HSTRING} 
     */
    DisplayArtist {
        get => this.get_DisplayArtist()
    }

    /**
     * Gets the name of the [System.Music.Genre](/windows/desktop/properties/props-system-music-genre) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.genre
     * @type {HSTRING} 
     */
    Genre {
        get => this.get_Genre()
    }

    /**
     * Gets the name of the [System.Music.TrackNumber](/windows/desktop/properties/props-system-music-tracknumber) property (one of the [Windows music file properties](/windows/desktop/properties/music-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmusicproperties.tracknumber
     * @type {HSTRING} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
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
    get_AlbumArtist() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_AlbumArtist()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumTitle() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_AlbumTitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Artist() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_Artist()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Composer() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_Composer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Conductor() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_Conductor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayArtist() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_DisplayArtist()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Genre() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_Genre()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TrackNumber() {
        if (!this.HasProp("__ISystemMusicProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMusicProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMusicProperties := ISystemMusicProperties(outPtr)
        }

        return this.__ISystemMusicProperties.get_TrackNumber()
    }

;@endregion Instance Methods
}

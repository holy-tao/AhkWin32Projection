#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaItemDisplayProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a set of metadata for a [MediaPlaybackItem](mediaplaybackitem.md) that is displayed in the System Media Transport Controls while the item is playing.
 * @remarks
 * Get an instance of the **MediaItemDisplayProperties** class by calling [GetDisplayProperties](mediaplaybackitem_getdisplayproperties_103236454.md) on an initialized [MediaPlaybackItem](mediaplaybackitem.md) object. Update the display properties for the playback item by setting the properties of the retrieved **MediaItemDisplayProperties** object and then calling [ApplyDisplayProperties](mediaplaybackitem_applydisplayproperties_1634192028.md).
 * 
 * For how-to guidance for integrating with the SMTC, see [Integrate with the System Media Transport Controls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaItemDisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaItemDisplayProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaItemDisplayProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating the type of media that is represented by the [MediaPlaybackItem](mediaplaybackitem.md), such as audio or video.
     * @remarks
     * Apps should set a value for the **Type** property even if they aren't supplying other media metadata to be displayed by the System Media Transport Controls. This value helps the system handle your media content correctly, including preventing the screen saver from activating during playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets the metadata for a music item that will be displayed by the System Media Transport Controls when the item is played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties.musicproperties
     * @type {MusicDisplayProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * Gets the metadata for a video item that will be displayed by the System Media Transport Controls when the item is played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties.videoproperties
     * @type {VideoDisplayProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * Gets or sets the thumbnail image for a [MediaPlaybackItem](mediaplaybackitem.md) that will be displayed by the System Media Transport Controls when the item is played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties.thumbnail
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
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
    get_Type() {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.put_Type(value)
    }

    /**
     * 
     * @returns {MusicDisplayProperties} 
     */
    get_MusicProperties() {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.get_MusicProperties()
    }

    /**
     * 
     * @returns {VideoDisplayProperties} 
     */
    get_VideoProperties() {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.get_VideoProperties()
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.get_Thumbnail()
    }

    /**
     * 
     * @param {RandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.put_Thumbnail(value)
    }

    /**
     * Clears the values of all media item display properties.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaitemdisplayproperties.clearall
     */
    ClearAll() {
        if (!this.HasProp("__IMediaItemDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IMediaItemDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaItemDisplayProperties := IMediaItemDisplayProperties(outPtr)
        }

        return this.__IMediaItemDisplayProperties.ClearAll()
    }

;@endregion Instance Methods
}

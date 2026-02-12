#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoDisplayProperties.ahk
#Include .\IVideoDisplayProperties2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides properties for video information that is displayed by [SystemMediaTransportControlsDisplayUpdater](systemmediatransportcontrolsdisplayupdater.md) class.
 * @remarks
 * Starting with Windows 10, version 1607, UWP apps that use the [MediaPlayer](../windows.media.playback/mediaplayer.md) class or [AudioGraph](../windows.media.audio/audiograph.md) class to play media are automatically integrated with the System Media Transport Controls by default. When using automatic integration, you can get an instance of the **VideoDisplayProperties** class using the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) class. Call [GetDisplayProperties](../windows.media.playback/mediaplaybackitem_getdisplayproperties_103236454.md) to get an instance of the [MediaItemDisplayProperties](../windows.media.playback/mediaitemdisplayproperties.md) class. Update the object with the values you want to be displayed for the item in the SMTC and then call [ApplyDisplayProperties](../windows.media.playback/mediaplaybackitem_applydisplayproperties_1634192028.md) to commit the changes. For how-to guidance on using the SMTC from your app, see [Integrate with the SystemMediaTransportControls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * 
 * When manually controlling the SMTC, get an instance of **VideoDisplayProperties** by using the [SystemMediaTransportControlsDisplayUpdater](systemmediatransportcontrolsdisplayupdater.md) class. For how-to guidance on manually controlling the SMTC, see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.media.videodisplayproperties
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class VideoDisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoDisplayProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoDisplayProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the title of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videodisplayproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the subtitle of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videodisplayproperties.subtitle
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
    }

    /**
     * Gets a modifiable list of strings representing genre names.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videodisplayproperties.genres
     * @type {IVector<HSTRING>} 
     */
    Genres {
        get => this.get_Genres()
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
        if (!this.HasProp("__IVideoDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IVideoDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDisplayProperties := IVideoDisplayProperties(outPtr)
        }

        return this.__IVideoDisplayProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IVideoDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IVideoDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDisplayProperties := IVideoDisplayProperties(outPtr)
        }

        return this.__IVideoDisplayProperties.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        if (!this.HasProp("__IVideoDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IVideoDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDisplayProperties := IVideoDisplayProperties(outPtr)
        }

        return this.__IVideoDisplayProperties.get_Subtitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        if (!this.HasProp("__IVideoDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IVideoDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDisplayProperties := IVideoDisplayProperties(outPtr)
        }

        return this.__IVideoDisplayProperties.put_Subtitle(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Genres() {
        if (!this.HasProp("__IVideoDisplayProperties2")) {
            if ((queryResult := this.QueryInterface(IVideoDisplayProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDisplayProperties2 := IVideoDisplayProperties2(outPtr)
        }

        return this.__IVideoDisplayProperties2.get_Genres()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToSourceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [SourceSelected](playtomanager_sourceselected.md) event.
 * @remarks
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToSourceSelectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToSourceSelectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToSourceSelectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name of the selected Play To source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets the display icon for the selected Play To source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs.icon
     * @type {IRandomAccessStreamWithContentType} 
     */
    Icon {
        get => this.get_Icon()
    }

    /**
     * Gets a value that indicates whether the selected Play To source supports displaying images.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs.supportsimage
     * @type {Boolean} 
     */
    SupportsImage {
        get => this.get_SupportsImage()
    }

    /**
     * Gets a value that indicates whether the selected Play To source supports audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs.supportsaudio
     * @type {Boolean} 
     */
    SupportsAudio {
        get => this.get_SupportsAudio()
    }

    /**
     * Gets a value that indicates whether the selected Play To source supports video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourceselectedeventargs.supportsvideo
     * @type {Boolean} 
     */
    SupportsVideo {
        get => this.get_SupportsVideo()
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
    get_FriendlyName() {
        if (!this.HasProp("__IPlayToSourceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceSelectedEventArgs := IPlayToSourceSelectedEventArgs(outPtr)
        }

        return this.__IPlayToSourceSelectedEventArgs.get_FriendlyName()
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_Icon() {
        if (!this.HasProp("__IPlayToSourceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceSelectedEventArgs := IPlayToSourceSelectedEventArgs(outPtr)
        }

        return this.__IPlayToSourceSelectedEventArgs.get_Icon()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsImage() {
        if (!this.HasProp("__IPlayToSourceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceSelectedEventArgs := IPlayToSourceSelectedEventArgs(outPtr)
        }

        return this.__IPlayToSourceSelectedEventArgs.get_SupportsImage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsAudio() {
        if (!this.HasProp("__IPlayToSourceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceSelectedEventArgs := IPlayToSourceSelectedEventArgs(outPtr)
        }

        return this.__IPlayToSourceSelectedEventArgs.get_SupportsAudio()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVideo() {
        if (!this.HasProp("__IPlayToSourceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceSelectedEventArgs := IPlayToSourceSelectedEventArgs(outPtr)
        }

        return this.__IPlayToSourceSelectedEventArgs.get_SupportsVideo()
    }

;@endregion Instance Methods
}

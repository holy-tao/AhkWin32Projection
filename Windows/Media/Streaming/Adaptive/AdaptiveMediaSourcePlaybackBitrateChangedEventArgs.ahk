#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PlaybackBitrateChanged](adaptivemediasource_playbackbitratechanged.md) event.
 * @remarks
 * Obtain an instance of this class by implementing a handler for the [PlaybackBitrateChanged](adaptivemediasource_playbackbitratechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceplaybackbitratechangedeventargs
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourcePlaybackBitrateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the old playback bitrate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceplaybackbitratechangedeventargs.oldvalue
     * @type {Integer} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * Gets the new playback bitrate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceplaybackbitratechangedeventargs.newvalue
     * @type {Integer} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * Gets a value indicating whether the media source contains only audio data.
     * @remarks
     * Check the value of this property to determine if the media content is audio-only and adjust your UI accordingly.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceplaybackbitratechangedeventargs.audioonly
     * @type {Boolean} 
     */
    AudioOnly {
        get => this.get_AudioOnly()
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
    get_OldValue() {
        if (!this.HasProp("__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs := IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.get_OldValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewValue() {
        if (!this.HasProp("__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs := IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.get_NewValue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioOnly() {
        if (!this.HasProp("__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs := IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs.get_AudioOnly()
    }

;@endregion Instance Methods
}

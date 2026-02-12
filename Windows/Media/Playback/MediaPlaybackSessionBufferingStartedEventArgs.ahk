#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackSessionBufferingStartedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [BufferingStarted](/uwp/api/windows.media.playback.mediaplaybacksession.BufferingStarted) event of a [MediaPlaybackSession](/uwp/api/windows.media.playback.mediaplaybacksession).
 * @remarks
 * To maintain backwards compatibility, the **BufferingStarted** delegate signature receives the event args as a generic object. To get an instance of this class, use the [as](/dotnet/articles/csharp/language-reference/keywords/as) operator keyword (C#) or [dynamic_cast](/cpp/cpp/dynamic-cast-operator) (C++) to cast the *args* parameter to a **MediaPlaybackSessionBufferingStartedEventArgs**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksessionbufferingstartedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackSessionBufferingStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackSessionBufferingStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackSessionBufferingStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the buffering that triggered the event was expected by the system, such as when a new item begins playing or after the user seeks to a new position in the media item, or if it was an unexpected interruption, such as when buffering is caused by degradation of the network connection.
     * @remarks
     * Media playback apps that implement a custom UI typically update their UI when buffering occurs to inform the user. Checking the value of this property allows you to choose to only display buffering UI for unexpected buffering interruptions.
     * 
     * To maintain backwards compatibility, the **BufferingStarted** delegate signature receives the event args as a generic object. To get an instance of this class, use the [as](/dotnet/articles/csharp/language-reference/keywords/as) operator keyword (C#) or [dynamic_cast](/cpp/cpp/dynamic-cast-operator) (C++) to cast the *args* parameter to a **MediaPlaybackSessionBufferingStartedEventArgs**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksessionbufferingstartedeventargs.isplaybackinterruption
     * @type {Boolean} 
     */
    IsPlaybackInterruption {
        get => this.get_IsPlaybackInterruption()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackInterruption() {
        if (!this.HasProp("__IMediaPlaybackSessionBufferingStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSessionBufferingStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSessionBufferingStartedEventArgs := IMediaPlaybackSessionBufferingStartedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackSessionBufferingStartedEventArgs.get_IsPlaybackInterruption()
    }

;@endregion Instance Methods
}

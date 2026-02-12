#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaybackRateChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [PlaybackRateChangeRequested](playtoreceiver_playbackratechangerequested.md) event.
 * @remarks
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * 
 * 
 * [!code-csharp[PlaybackRateChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetPlaybackRateChangeRequested)]
 * 
 * [!code-vb[PlaybackRateChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetPlaybackRateChangeRequested)]
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playbackratechangerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlaybackRateChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackRateChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackRateChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new playback rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playbackratechangerequestedeventargs.rate
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rate() {
        if (!this.HasProp("__IPlaybackRateChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlaybackRateChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackRateChangeRequestedEventArgs := IPlaybackRateChangeRequestedEventArgs(outPtr)
        }

        return this.__IPlaybackRateChangeRequestedEventArgs.get_Rate()
    }

;@endregion Instance Methods
}

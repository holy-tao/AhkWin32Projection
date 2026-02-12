#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMuteChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [MuteChangeRequested](playtoreceiver_mutechangerequested.md) event.
 * @remarks
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * 
 * 
 * [!code-csharp[MuteChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetMuteChangeRequested)]
 * 
 * [!code-vb[MuteChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetMuteChangeRequested)]
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.mutechangerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class MuteChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMuteChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMuteChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether mute or unmute was requested.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.mutechangerequestedeventargs.mute
     * @type {Boolean} 
     */
    Mute {
        get => this.get_Mute()
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
    get_Mute() {
        if (!this.HasProp("__IMuteChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMuteChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMuteChangeRequestedEventArgs := IMuteChangeRequestedEventArgs(outPtr)
        }

        return this.__IMuteChangeRequestedEventArgs.get_Mute()
    }

;@endregion Instance Methods
}

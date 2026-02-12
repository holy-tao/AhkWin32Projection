#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrentTimeChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [CurrentTimeChangeRequested](playtoreceiver_currenttimechangerequested.md) event.
 * @remarks
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * 
 * 
 * [!code-csharp[CurrentTimeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetCurrentTimeChangeRequested)]
 * 
 * [!code-vb[CurrentTimeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetCurrentTimeChangeRequested)]
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.currenttimechangerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class CurrentTimeChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICurrentTimeChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICurrentTimeChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new time that the Play To source audio or video stream has been changed to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.currenttimechangerequestedeventargs.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        if (!this.HasProp("__ICurrentTimeChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentTimeChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentTimeChangeRequestedEventArgs := ICurrentTimeChangeRequestedEventArgs(outPtr)
        }

        return this.__ICurrentTimeChangeRequestedEventArgs.get_Time()
    }

;@endregion Instance Methods
}

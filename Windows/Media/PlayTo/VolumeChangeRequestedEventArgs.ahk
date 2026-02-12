#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVolumeChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [VolumeChangeRequested](playtoreceiver_volumechangerequested.md) event.
 * @remarks
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * [!code-csharp[VolumeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetVolumeChangeRequested)]
 * 
 * [!code-vb[VolumeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetVolumeChangeRequested)]
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.volumechangerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class VolumeChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVolumeChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVolumeChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new volume level.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.volumechangerequestedeventargs.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
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
    get_Volume() {
        if (!this.HasProp("__IVolumeChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVolumeChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVolumeChangeRequestedEventArgs := IVolumeChangeRequestedEventArgs(outPtr)
        }

        return this.__IVolumeChangeRequestedEventArgs.get_Volume()
    }

;@endregion Instance Methods
}

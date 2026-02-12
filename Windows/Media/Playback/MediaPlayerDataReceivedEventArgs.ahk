#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlayerDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MessageReceivedFromBackground](backgroundmediaplayer_messagereceivedfrombackground.md) and [MessageReceivedFromForeground](backgroundmediaplayer_messagereceivedfromforeground.md) events.
 * @remarks
 * Get an instance of this class by handling the [MessageReceivedFromBackground](backgroundmediaplayer_messagereceivedfrombackground.md) and [MessageReceivedFromForeground](backgroundmediaplayer_messagereceivedfromforeground.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerdatareceivedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data from the [MessageReceivedFromBackground](backgroundmediaplayer_messagereceivedfrombackground.md) or [MessageReceivedFromForeground](backgroundmediaplayer_messagereceivedfromforeground.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerdatareceivedeventargs.data
     * @type {ValueSet} 
     */
    Data {
        get => this.get_Data()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Data() {
        if (!this.HasProp("__IMediaPlayerDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerDataReceivedEventArgs := IMediaPlayerDataReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlayerDataReceivedEventArgs.get_Data()
    }

;@endregion Instance Methods
}

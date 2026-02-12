#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakEndedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaBreakManager.BreakEnded](mediabreakmanager_breakended.md) event, which occurs when the playback of a [MediaBreak](mediabreak.md) has ended.
 * @remarks
 * Get an instance of this class by handling the [MediaBreakManager.BreakEnded](mediabreakmanager_breakended.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakendedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakEndedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakEndedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakEndedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaBreak](mediabreak.md) for which playback has ended.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakendedeventargs.mediabreak
     * @type {MediaBreak} 
     */
    MediaBreak {
        get => this.get_MediaBreak()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_MediaBreak() {
        if (!this.HasProp("__IMediaBreakEndedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakEndedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakEndedEventArgs := IMediaBreakEndedEventArgs(outPtr)
        }

        return this.__IMediaBreakEndedEventArgs.get_MediaBreak()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakStartedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaBreakManager.BreakStarted](mediabreakmanager_breakstarted.md) event, which occurs when the playback of a [MediaBreak](mediabreak.md) starts.
 * @remarks
 * Get an instance of this class by handling the [MediaBreakManager.BreakStarted](mediabreakmanager_breakstarted.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakstartedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaBreak](mediabreak.md) that triggered the [MediaBreakManager.BreakStarted](mediabreakmanager_breakstarted.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakstartedeventargs.mediabreak
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
        if (!this.HasProp("__IMediaBreakStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakStartedEventArgs := IMediaBreakStartedEventArgs(outPtr)
        }

        return this.__IMediaBreakStartedEventArgs.get_MediaBreak()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakSkippedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaBreakManager.BreakSkipped](mediabreakmanager_breakskipped.md) event, which occurs when the playback of a [MediaBreak](mediabreak.md) is skipped.
 * @remarks
 * Get an instance of this class by handling the [MediaBreakManager.BreakSkipped](mediabreakmanager_breakskipped.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakskippedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakSkippedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakSkippedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakSkippedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaBreak](mediabreak.md) that was skipped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakskippedeventargs.mediabreak
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
        if (!this.HasProp("__IMediaBreakSkippedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSkippedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSkippedEventArgs := IMediaBreakSkippedEventArgs(outPtr)
        }

        return this.__IMediaBreakSkippedEventArgs.get_MediaBreak()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakSeekedOverEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaBreakManager.BreaksSeekedOver](mediabreakmanager_breaksseekedover.md) event, which occurs when the user seeks the media playback position past one or more pending media breaks.
 * @remarks
 * Get an instance of this class by handling the [MediaBreakManager.BreaksSeekedOver](mediabreakmanager_breaksseekedover.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakseekedovereventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakSeekedOverEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakSeekedOverEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakSeekedOverEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of [MediaBreak](mediabreak.md) objects that were seeked over, meaning that they were scheduled to play between the [OldPosition](mediabreakseekedovereventargs_oldposition.md) and [NewPosition](mediabreakseekedovereventargs_newposition.md) of the seek operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakseekedovereventargs.seekedoverbreaks
     * @type {IVectorView<MediaBreak>} 
     */
    SeekedOverBreaks {
        get => this.get_SeekedOverBreaks()
    }

    /**
     * Gets the previous position within the [MediaPlaybackItem](mediaplaybackitem.md) before the seek operation started.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakseekedovereventargs.oldposition
     * @type {TimeSpan} 
     */
    OldPosition {
        get => this.get_OldPosition()
    }

    /**
     * Gets the new current position within the [MediaPlaybackItem](mediaplaybackitem.md) after the seek operation has completed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakseekedovereventargs.newposition
     * @type {TimeSpan} 
     */
    NewPosition {
        get => this.get_NewPosition()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MediaBreak>} 
     */
    get_SeekedOverBreaks() {
        if (!this.HasProp("__IMediaBreakSeekedOverEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSeekedOverEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSeekedOverEventArgs := IMediaBreakSeekedOverEventArgs(outPtr)
        }

        return this.__IMediaBreakSeekedOverEventArgs.get_SeekedOverBreaks()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OldPosition() {
        if (!this.HasProp("__IMediaBreakSeekedOverEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSeekedOverEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSeekedOverEventArgs := IMediaBreakSeekedOverEventArgs(outPtr)
        }

        return this.__IMediaBreakSeekedOverEventArgs.get_OldPosition()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewPosition() {
        if (!this.HasProp("__IMediaBreakSeekedOverEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSeekedOverEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSeekedOverEventArgs := IMediaBreakSeekedOverEventArgs(outPtr)
        }

        return this.__IMediaBreakSeekedOverEventArgs.get_NewPosition()
    }

;@endregion Instance Methods
}

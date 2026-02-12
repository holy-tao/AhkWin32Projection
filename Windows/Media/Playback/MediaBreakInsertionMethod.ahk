#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the method that is used to insert the [MediaBreak](mediabreak.md) playback into the playback of the [MediaPlaybackItem](mediaplaybackitem.md) to which it belongs.
 * @remarks
 * In a typical implementation, **Interrupt** is used for on-demand content so that none of the content is obscured by the media break, and **Replace** is used for live content so that the content doesn't accumulate a delay while pausing during the media break.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakinsertionmethod
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakInsertionMethod extends Win32Enum{

    /**
     * The main content is paused while the content of the [MediaBreak](mediabreak.md) plays.
     * @type {Integer (Int32)}
     */
    static Interrupt => 0

    /**
     * The main content is not paused, but is replaced by the content of the [MediaBreak](mediabreak.md).
     * @type {Integer (Int32)}
     */
    static Replace => 1
}

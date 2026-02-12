#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the state of a [MediaTimelineController](mediatimelinecontroller.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontrollerstate
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaTimelineControllerState extends Win32Enum{

    /**
     * The **MediaTimelineController** is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 0

    /**
     * The **MediaTimelineController** is running.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The **MediaTimelineController** is stalled due to starvation of streaming data. Apps may choose to show a buffering indicator when the timeline controller is stalled.
     * @type {Integer (Int32)}
     */
    static Stalled => 2

    /**
     * The **MediaTimelineController** has encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 3
}

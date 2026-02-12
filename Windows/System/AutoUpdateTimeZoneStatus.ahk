#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * The status of the automatic time zone request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.autoupdatetimezonestatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AutoUpdateTimeZoneStatus extends Win32Enum{

    /**
     * Time zone detection attempted. 
     * The time zone may still be incorrect.
     * Confirm time zone selection with the user.
     * You can alternatively include a way for the user to set the time zone at a later time.
     * @type {Integer (Int32)}
     */
    static Attempted => 0

    /**
     * Request timed out. 
     * Try again with a longer timeout or prompt the user to select a time zone selection.
     * You can alternatively include a way for the user to set the time zone at a later time.
     * @type {Integer (Int32)}
     */
    static TimedOut => 1

    /**
     * The time zone could not be detected due to lack of hardware support, or catastrophic failure.
     * Avoid calling the [AutoUpdateTimeZoneAsync](timezonesettings_autoupdatetimezoneasync_2027519787.md) method again.
     * Prompt the user to select a time zone.
     * You can alternatively include a way for the user to set the time zone at a later time.
     * @type {Integer (Int32)}
     */
    static Failed => 2
}

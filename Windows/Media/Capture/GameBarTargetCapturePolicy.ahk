#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides information around the allowable actions for this application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebartargetcapturepolicy
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarTargetCapturePolicy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EnabledBySystem => 0

    /**
     * @type {Integer (Int32)}
     */
    static EnabledByUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static NotEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static ProhibitedBySystem => 3

    /**
     * @type {Integer (Int32)}
     */
    static ProhibitedByPublisher => 4
}

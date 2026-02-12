#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of Game Bar commands.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarcommand
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarCommand extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OpenGameBar => 0

    /**
     * @type {Integer (Int32)}
     */
    static RecordHistoricalBuffer => 1

    /**
     * @type {Integer (Int32)}
     */
    static ToggleStartStopRecord => 2

    /**
     * @type {Integer (Int32)}
     */
    static StartRecord => 3

    /**
     * @type {Integer (Int32)}
     */
    static StopRecord => 4

    /**
     * @type {Integer (Int32)}
     */
    static TakeScreenshot => 5

    /**
     * @type {Integer (Int32)}
     */
    static StartBroadcast => 6

    /**
     * @type {Integer (Int32)}
     */
    static StopBroadcast => 7

    /**
     * @type {Integer (Int32)}
     */
    static PauseBroadcast => 8

    /**
     * @type {Integer (Int32)}
     */
    static ResumeBroadcast => 9

    /**
     * @type {Integer (Int32)}
     */
    static ToggleStartStopBroadcast => 10

    /**
     * @type {Integer (Int32)}
     */
    static ToggleMicrophoneCapture => 11

    /**
     * @type {Integer (Int32)}
     */
    static ToggleCameraCapture => 12

    /**
     * @type {Integer (Int32)}
     */
    static ToggleRecordingIndicator => 13
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the display mode for the Game Bar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicesdisplaymode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServicesDisplayMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Windowed => 0

    /**
     * @type {Integer (Int32)}
     */
    static FullScreenExclusive => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the local power line frequency.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.powerlinefrequency
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class PowerlineFrequency extends Win32Enum{

    /**
     * Power-line frequency control is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * The power-line frequency is 50 Hz.
     * @type {Integer (Int32)}
     */
    static FiftyHertz => 1

    /**
     * The power-line frequency is 60 Hz.
     * @type {Integer (Int32)}
     */
    static SixtyHertz => 2

    /**
     * The power-line frequency is determined automatically by the system.
     * @type {Integer (Int32)}
     */
    static Auto => 3
}

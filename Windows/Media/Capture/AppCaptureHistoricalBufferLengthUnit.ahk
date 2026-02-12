#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units of the app capture historical buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturehistoricalbufferlengthunit
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureHistoricalBufferLengthUnit extends Win32Enum{

    /**
     * Megabytes
     * @type {Integer (Int32)}
     */
    static Megabytes => 0

    /**
     * Seconds
     * @type {Integer (Int32)}
     */
    static Seconds => 1
}

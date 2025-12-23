#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class CameraUIControlCaptureMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PhotoOrVideo => 0

    /**
     * @type {Integer (Int32)}
     */
    static Photo => 1

    /**
     * @type {Integer (Int32)}
     */
    static Video => 2
}

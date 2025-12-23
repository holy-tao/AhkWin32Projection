#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class CameraUIControlPhotoFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Jpeg => 0

    /**
     * @type {Integer (Int32)}
     */
    static Png => 1

    /**
     * @type {Integer (Int32)}
     */
    static JpegXR => 2
}

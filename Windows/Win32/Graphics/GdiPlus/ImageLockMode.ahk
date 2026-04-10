#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageLockMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ImageLockModeRead => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageLockModeWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImageLockModeUserInputBuf => 4
}

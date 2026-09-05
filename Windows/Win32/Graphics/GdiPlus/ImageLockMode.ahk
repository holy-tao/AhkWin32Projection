#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageLockMode extends Win32Enum {

    /**
     * Native name: ImageLockModeRead
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * Native name: ImageLockModeWrite
     * @type {Integer (Int32)}
     */
    static Write => 2

    /**
     * Native name: ImageLockModeUserInputBuf
     * @type {Integer (Int32)}
     */
    static UserInputBuf => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SET_WINDOW_POS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_ASYNCWINDOWPOS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_DEFERERASE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_DRAWFRAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_FRAMECHANGED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_HIDEWINDOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOACTIVATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOCOPYBITS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOOWNERZORDER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOREDRAW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOREPOSITION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOSENDCHANGING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOSIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOZORDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_SHOWWINDOW => 64
}

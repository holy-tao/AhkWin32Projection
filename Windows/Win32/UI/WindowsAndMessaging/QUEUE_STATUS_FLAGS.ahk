#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class QUEUE_STATUS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static QS_ALLEVENTS => 1215

    /**
     * @type {Integer (UInt32)}
     */
    static QS_ALLINPUT => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static QS_ALLPOSTMESSAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QS_HOTKEY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static QS_INPUT => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static QS_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSEBUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSEMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QS_PAINT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QS_POSTMESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static QS_RAWINPUT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static QS_SENDMESSAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static QS_TIMER => 16
}

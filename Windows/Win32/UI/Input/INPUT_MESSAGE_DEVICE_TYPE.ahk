#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of device that sent the input message.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ne-winuser-input_message_device_type
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class INPUT_MESSAGE_DEVICE_TYPE extends Win32Enum{

    /**
     * The device type isn't identified.
     * @type {Integer (Int32)}
     */
    static IMDT_UNAVAILABLE => 0

    /**
     * Keyboard input.
     * @type {Integer (Int32)}
     */
    static IMDT_KEYBOARD => 1

    /**
     * Mouse input.
     * @type {Integer (Int32)}
     */
    static IMDT_MOUSE => 2

    /**
     * Touch input.
     * @type {Integer (Int32)}
     */
    static IMDT_TOUCH => 4

    /**
     * Pen or stylus input.
     * @type {Integer (Int32)}
     */
    static IMDT_PEN => 8

    /**
     * Touchpad input (Windows 8.1 and later).
     * @type {Integer (Int32)}
     */
    static IMDT_TOUCHPAD => 16
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the pointer device types.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_device_type
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class POINTER_DEVICE_TYPE extends Win32Enum {

    /**
     * Direct pen digitizer (integrated into display).
     * Native name: POINTER_DEVICE_TYPE_INTEGRATED_PEN
     * @type {Integer (Int32)}
     */
    static INTEGRATED_PEN => 1

    /**
     * Indirect pen digitizer (not integrated into display).
     * Native name: POINTER_DEVICE_TYPE_EXTERNAL_PEN
     * @type {Integer (Int32)}
     */
    static EXTERNAL_PEN => 2

    /**
     * Touch digitizer.
     * Native name: POINTER_DEVICE_TYPE_TOUCH
     * @type {Integer (Int32)}
     */
    static TOUCH => 3

    /**
     * Touchpad digitizer (Windows 8.1 and later).
     * Native name: POINTER_DEVICE_TYPE_TOUCH_PAD
     * @type {Integer (Int32)}
     */
    static TOUCH_PAD => 4

    /**
     * Forces this enumeration to compile to 32 bits in size. Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits. You should not use this value.
     * Native name: POINTER_DEVICE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}

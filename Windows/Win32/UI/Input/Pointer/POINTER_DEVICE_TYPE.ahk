#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the pointer device types.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ne-winuser-pointer_device_type
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_DEVICE_TYPE{

    /**
     * Direct pen digitizer (integrated into display).
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_TYPE_INTEGRATED_PEN => 1

    /**
     * Indirect pen digitizer (not integrated into display).
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_TYPE_EXTERNAL_PEN => 2

    /**
     * Touch digitizer.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_TYPE_TOUCH => 3

    /**
     * Touchpad digitizer (Windows 8.1 and later).
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_TYPE_TOUCH_PAD => 4

    /**
     * Forces this enumeration to compile to 32 bits in size. Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits. You should not use this value.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_TYPE_MAX => -1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the pointer device cursor types.
 * @remarks
 * Cursor objects represent pointing and selecting devices used with digitizer devices, most commonly tactile contacts on touch digitizers and tablet pens on pen digitizers. Physical pens may have multiple tips (such as normal and eraser ends), with each pen tip representing a different cursor object. Each cursor object has an associated cursor identifier.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_device_cursor_type
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class POINTER_DEVICE_CURSOR_TYPE extends Win32Enum {

    /**
     * Unidentified cursor.
     * Native name: POINTER_DEVICE_CURSOR_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Pen tip.
     * Native name: POINTER_DEVICE_CURSOR_TYPE_TIP
     * @type {Integer (Int32)}
     */
    static TIP => 1

    /**
     * Pen eraser.
     * Native name: POINTER_DEVICE_CURSOR_TYPE_ERASER
     * @type {Integer (Int32)}
     */
    static ERASER => 2

    /**
     * Forces this enumeration to compile to 32 bits in size. Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits. You should not use this value.
     * Native name: POINTER_DEVICE_CURSOR_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}

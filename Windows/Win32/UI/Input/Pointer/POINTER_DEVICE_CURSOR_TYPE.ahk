#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the pointer device cursor types.
 * @remarks
 * 
 * Cursor objects represent pointing and selecting devices used with digitizer devices, most commonly tactile contacts on touch digitizers and tablet pens on pen digitizers. Physical pens may have multiple tips (such as normal and eraser ends), with each pen tip representing a different cursor object. Each cursor object has an associated cursor identifier.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ne-winuser-pointer_device_cursor_type
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_DEVICE_CURSOR_TYPE extends Win32Enum{

    /**
     * Unidentified cursor.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_CURSOR_TYPE_UNKNOWN => 0

    /**
     * Pen tip.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_CURSOR_TYPE_TIP => 1

    /**
     * Pen eraser.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_CURSOR_TYPE_ERASER => 2

    /**
     * Forces this enumeration to compile to 32 bits in size. Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits. You should not use this value.
     * @type {Integer (Int32)}
     */
    static POINTER_DEVICE_CURSOR_TYPE_MAX => -1
}

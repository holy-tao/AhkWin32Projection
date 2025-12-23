#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a cursor.
 * @remarks
 * When an application passes a cursor handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a> function, the function returns a pointer to a buffer containing information about the cursor. An application can use the <b>CURSORSHAPE</b> structure to access the information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cursorshape
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CURSORSHAPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * The horizontal position of the hot spot, relative to the upper-left corner of the cursor bitmap.
     * @type {Integer}
     */
    xHotSpot {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The vertical position of the hot spot, relative to the upper-left corner of the cursor bitmap.
     * @type {Integer}
     */
    yHotSpot {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width, in pixels, of the cursor.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height, in pixels, of the cursor.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width, in bytes, of the cursor bitmap.
     * @type {Integer}
     */
    cbWidth {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * The number of color planes.
     * @type {Integer}
     */
    Planes {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * The number of bits used to indicate the color of a single pixel in the cursor.
     * @type {Integer}
     */
    BitsPixel {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }
}

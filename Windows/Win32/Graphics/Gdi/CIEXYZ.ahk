#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CIEXYZ structure contains the x,y, and z coordinates of a specific color in a specified color space.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-ciexyz
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CIEXYZ extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The x coordinate in fix point (2.30).
     * @type {Integer}
     */
    ciexyzX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The y coordinate in fix point (2.30).
     * @type {Integer}
     */
    ciexyzY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The z coordinate in fix point (2.30).
     * @type {Integer}
     */
    ciexyzZ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

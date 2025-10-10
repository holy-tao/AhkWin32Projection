#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PWMFRect16 structure defines a rectangle that bounds a placeable metafile. The rectangle defines the size and position of the metafile.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusmetaheader/ns-gdiplusmetaheader-pwmfrect16
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PWMFRect16 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Type: <b>INT16</b>
     * 
     * Left coordinate of the rectangle that bounds the metafile.
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Top coordinate of the rectangle that bounds the metafile.
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Right coordinate of the rectangle that bounds the metafile.
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Bottom coordinate of the rectangle that bounds the metafile.
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }
}

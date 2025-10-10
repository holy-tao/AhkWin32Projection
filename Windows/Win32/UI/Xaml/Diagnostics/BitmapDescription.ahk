#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents information about the bitmap stored in IBitmapData.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ns-xamlom-bitmapdescription
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class BitmapDescription extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The width of the bitmap.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the bitmap.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The format of the bitmap.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The alpha mode of the bitmap.
     * @type {Integer}
     */
    AlphaMode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The COLORREF value is used to specify an RGB color.
 * @remarks
 * When specifying an explicit [RGB](/windows/desktop/api/Wingdi/nf-wingdi-rgb) color, the **COLORREF** value has the following hexadecimal form:
  * 
  * `0x00bbggrr`
  * 
  * The low-order byte contains a value for the relative intensity of red; the second byte contains a value for green; and the third byte contains a value for blue. The high-order byte must be zero. The maximum value for a single byte is 0xFF.
  * 
  * To create a **COLORREF** color value, use the [RGB](/windows/desktop/api/Wingdi/nf-wingdi-rgb) macro. To extract the individual values for the red, green, and blue components of a color value, use the [**GetRValue**](/windows/desktop/api/Wingdi/nf-wingdi-getrvalue), [GetGValue](/windows/desktop/api/Wingdi/nf-wingdi-getgvalue), and [GetBValue](/windows/desktop/api/Wingdi/nf-wingdi-getbvalue) macros, respectively.
 * @see https://learn.microsoft.com/windows/win32/gdi/colorref
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class COLORREF extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

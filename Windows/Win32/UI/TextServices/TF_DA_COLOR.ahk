#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_DA_COLOR structure contains color data used in the display attributes for a range of text.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_da_color
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_DA_COLOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the color type as defined in the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_colortype">TF_DA_COLORTYPE</a> enumeration.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    nIndex {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcgetfilenamedata
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_GET_FILENAME_DATA_T extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbOutput {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    wszData {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}

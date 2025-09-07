#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MXDC\_GET\_FILENAME\_DATA\_T structure holds the full path and file name of a Microsoft XPS Document Converter (MXDC) output file.
 * @remarks
 * This structure is returned by [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) when it is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape and the [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure that is passed in the *lpszInData* parameter has its **opCode** set to **MXDCOP\_GET\_FILENAME**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcgetfilenamedata
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_GET_FILENAME_DATA_T extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * The size of the output buffer, **wszData**.
     * @type {Integer}
     */
    cbOutput {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The fully qualified path and file name of the output file.
     * @type {String}
     */
    wszData {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}

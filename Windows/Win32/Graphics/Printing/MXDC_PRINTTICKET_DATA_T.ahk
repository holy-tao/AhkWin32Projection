#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MXDC\_PRINTTICKET\_DATA\_T structure holds an XPS document print ticket, which contains printer and print job settings, to pass to the Microsoft XPS Document Converter (MXDC) output file without any processing.
 * @remarks
 * This structure is appended to an [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure that has the **opCode** member set to **MXDCOP\_PRINTTICKET\_FIXED\_PAGE**, **MXDCOP\_PRINTTICKET\_FIXED\_DOC**, or **MXDCOP\_PRINTTICKET\_FIXED\_DOC\_SEQ** to make an [**MXDC\_PRINTTICKET\_ESCAPE\_T**](mxdcprintticketescape.md) structure. The **MXDC\_PRINTTICKET\_ESCAPE\_T** structure is then passed to the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function when it is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape. The effect is to write the print ticket to the XPS document file.
  * 
  * If the **opCode** is set to **MXDCOP\_PRINTTICKET\_FIXED\_PAGE**, the call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must occur between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage). If the **opCode** set to either **MXDCOP\_PRINTTICKET\_FIXED\_DOC** or **MXDCOP\_PRINTTICKET\_FIXED\_DOC\_SEQ**, the call to **ExtEscape** must occur between a call to [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) and a call to [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc).
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcprintticketpassthrough
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_PRINTTICKET_DATA_T extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * The size of the print ticket in bytes.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The XPS document print ticket.
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MXDC_ESCAPE_HEADER_T.ahk
#Include .\MXDC_PRINTTICKET_DATA_T.ahk

/**
 * The MXDC\_PRINTTICKET\_ESCAPE\_T structure is a MXDC\_ESCAPE\_HEADER\_T structure concatenated with a MXDC\_PRINTTICKET\_DATA\_T structure.
 * @remarks
 * This structure is passed in the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function when that function is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape and the **opCode** member of the [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure is **MXDCOP\_PRINTTICKET\_FIXED\_PAGE**, **MXDCOP\_PRINTTICKET\_FIXED\_DOC**, or **MXDCOP\_PRINTTICKET\_FIXED\_DOC\_SEQ**. The result is to write the print ticket to the XPS document file.
 * 
 * Allocate memory for the escape as shown below, set the fields as needed, and then call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape).
 * 
 * 
 * ```C++
 * // Compute size of buffer required adding the
 * //  size of the escape structure to the size
 * //  of the resource data buffer.
 * SIZE_T iTotalDataSize = sizeof(MXDC_PRINTTICKET_ESCAPE_T) + 
 *                         iS0PageDataSize - 1;
 * 
 * // Allocate the memory buffer.
 * P_MXDC_PRINTTICKET_ESCAPE_T pS0PageEscapeData = 
 *                         (P_MXDC_PRINTTICKET_ESCAPE_T)HeapAlloc(
 *                             GetProcessHeap(),
 *                             0,
 *                             iTotalDataSize);
 * ```
 * 
 * 
 * 
 * If the **opCode** is set to **MXDCOP\_PRINTTICKET\_FIXED\_PAGE**, the call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must occur between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage). If the **opCode** set to either **MXDCOP\_PRINTTICKET\_FIXED\_DOC** or **MXDCOP\_PRINTTICKET\_FIXED\_DOC\_SEQ**, the call to **ExtEscape** must occur between a call to [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) and a call to [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc).
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcprintticketescape
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_PRINTTICKET_ESCAPE_T extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure with its **opCode** member set to MXDCOP\_PRINTTICKET\_FIXED\_PAGE, MXDCOP\_PRINTTICKET\_FIXED\_DOC, or MXDCOP\_PRINTTICKET\_FIXED\_DOC\_SEQ.
     * @type {MXDC_ESCAPE_HEADER_T}
     */
    mxdcEscape{
        get {
            if(!this.HasProp("__mxdcEscape"))
                this.__mxdcEscape := MXDC_ESCAPE_HEADER_T(0, this)
            return this.__mxdcEscape
        }
    }

    /**
     * A [**MXDC\_PRINTTICKET\_DATA\_T**](mxdcprintticketpassthrough.md) structure containing the print ticket.
     * @type {MXDC_PRINTTICKET_DATA_T}
     */
    printTicketData{
        get {
            if(!this.HasProp("__printTicketData"))
                this.__printTicketData := MXDC_PRINTTICKET_DATA_T(12, this)
            return this.__printTicketData
        }
    }
}

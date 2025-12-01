#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MXDC_ESCAPE_HEADER_T.ahk
#Include .\MXDC_S0PAGE_DATA_T.ahk

/**
 * The MXDC\_S0PAGE\_PASSTHROUGH\_ESCAPE\_T structure is an MXDC\_ESCAPE\_HEADER\_T structure concatenated with an MXDC\_S0PAGE\_DATA\_T structure.
 * @remarks
 * This structure is passed in the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function when it is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape and the **opCode** member of the [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure is **MXDCOP\_SET\_S0PAGE**. The result is that the Microsoft XML Document Converter (MXDC) passes the page through to the printer without processing it.
 * 
 * Allocate memory for the escape as shown below, set the fields as needed, and then call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape).
 * 
 * 
 * ```C++
 * // Compute size of buffer required adding the
 * //  size of the escape structure to the size
 * //  of the resource data buffer.
 * SIZE_T iTotalDataSize = sizeof(MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T) + 
 *                         iS0PageDataSize - 1;
 * 
 * // Allocate the memory buffer.
 * P_MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T pS0PageEscapeData = 
 *                         (P_MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T)HeapAlloc(
 *                             GetProcessHeap(),
 *                             0,
 *                             iTotalDataSize);
 * ```
 * 
 * 
 * 
 * The call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must be between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage).
 * 
 * The calling application is responsible for validating the XML of the XPS document page.
 * 
 * Streaming consumption is more efficient if you call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) with **MXDCOP\_SET\_S0PAGE\_RESOURCE** as **opCode** for each resource on the page before you call it with **MXDCOP\_SET\_S0PAGE**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pagepassthroughescape
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure with its **opCode** member set to **MXDCOP\_SET\_S0PAGE**.
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
     * An [**MxdcS0PageData**](mxdcs0pagedata.md) structure that represents an XPS-document page.
     * @type {MXDC_S0PAGE_DATA_T}
     */
    xpsS0PageData{
        get {
            if(!this.HasProp("__xpsS0PageData"))
                this.__xpsS0PageData := MXDC_S0PAGE_DATA_T(16, this)
            return this.__xpsS0PageData
        }
    }
}

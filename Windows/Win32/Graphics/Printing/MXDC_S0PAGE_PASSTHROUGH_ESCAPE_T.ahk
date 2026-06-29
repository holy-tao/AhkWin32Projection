#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MXDC_ESCAPE_HEADER_T.ahk" { MXDC_ESCAPE_HEADER_T }
#Import ".\MXDC_S0PAGE_DATA_T.ahk" { MXDC_S0PAGE_DATA_T }

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
 */
export default struct MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T {
    #StructPack 4

    /**
     * An [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure with its **opCode** member set to **MXDCOP\_SET\_S0PAGE**.
     */
    mxdcEscape : MXDC_ESCAPE_HEADER_T

    /**
     * An [**MxdcS0PageData**](mxdcs0pagedata.md) structure that represents an XPS-document page.
     */
    xpsS0PageData : MXDC_S0PAGE_DATA_T

}

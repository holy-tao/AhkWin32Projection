#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MXDC\_S0PAGE\_DATA\_T structure holds an XPS document page to be passed to the Microsoft XPS Document Converter (MXDC) output file without any processing.
 * @remarks
 * This structure is appended to an [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure (which has its **opCode** set to MXDCOP\_SET\_S0PAGE) to make an [**MXDC\_S0PAGE\_PASSTHROUGH\_ESCAPE\_T**](mxdcs0pagepassthroughescape.md) structure. That structure is then passed to the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function when it is called with [**MXDC\_ESCAPE**](mxdc-escape.md) as the escape. The result is that the MXDC passes the page through to the output without processing it.
 * 
 * The call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must be between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage).
 * 
 * The calling application is responsible for validating the XML of the XPS document page.
 * 
 * Streaming consumption is more efficient if you call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) with **MXDCOP\_SET\_S0PAGE\_RESOURCE** as **opCode** for each resource on the page before you call it with **MXDCOP\_SET\_S0PAGE**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pagedata
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MXDC_S0PAGE_DATA_T {
    #StructPack 4

    /**
     * The size of the output buffer, **bData**.
     */
    dwSize : UInt32

    /**
     * The XPS document page.
     */
    bData : Int8[1]

}

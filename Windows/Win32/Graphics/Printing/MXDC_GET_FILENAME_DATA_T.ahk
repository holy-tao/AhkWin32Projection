#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MXDC\_GET\_FILENAME\_DATA\_T structure holds the full path and file name of a Microsoft XPS Document Converter (MXDC) output file.
 * @remarks
 * This structure is returned by [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) when it is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape and the [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure that is passed in the *lpszInData* parameter has its **opCode** set to **MXDCOP\_GET\_FILENAME**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcgetfilenamedata
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MXDC_GET_FILENAME_DATA_T {
    #StructPack 4

    /**
     * The size of the output buffer, **wszData**.
     */
    cbOutput : UInt32

    /**
     * The fully qualified path and file name of the output file.
     */
    wszData : WCHAR[1]

}

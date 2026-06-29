#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The TYPE1_FONT structure contains the information necessary for a PostScript driver to access a Type1 font through GDI.
 * @remarks
 * A PostScript driver can obtain a list of installed Type1 fonts by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-enggettype1fontlist">EngGetType1FontList</a>.
 * 
 * Each PostScript Type1 font comes with two separate files: a .<i>pfm</i> file and a .<i>pfb</i> file. The .<i>pfm</i> file contains font metrics information; the .<i>pfb</i> file contains the PostScript Type1 binary font data.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-type1_font
 * @namespace Windows.Win32.Devices.Display
 */
export default struct TYPE1_FONT {
    #StructPack 8

    /**
     * Handle to the PostScript Type1 .<a href="https://docs.microsoft.com/windows-hardware/drivers/">pfm</a> file.
     */
    hPFM : HANDLE

    /**
     * Handle to the PostScript Type1 .<i>pfb</i> file.
     */
    hPFB : HANDLE

    /**
     * Is an identifier that is generated and used by GDI. The driver stores <b>ulIdentifier</b> in the <b>dpCharSets</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure.
     */
    ulIdentifier : UInt32

}

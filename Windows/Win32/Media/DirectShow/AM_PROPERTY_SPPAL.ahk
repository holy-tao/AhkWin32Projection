#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AM_DVD_YUV.ahk" { AM_DVD_YUV }

/**
 * Specifies the DVD subpicture palette.
 * @remarks
 * The AM_PROPERTY_DVDSUBPIC_PALETTE property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_property_sppal
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_PROPERTY_SPPAL {
    #StructPack 1

    /**
     * Array of 16 YUV elements that correspond to the 4-bit color numbers requested within the subpicture command stream. The YUV elements are of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_dvd_yuv">AM_DVD_YUV</a>.
     */
    sppal : AM_DVD_YUV[16]

}

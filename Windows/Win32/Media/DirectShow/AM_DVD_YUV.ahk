#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains DVD YUV subpicture data.
 * @remarks
 * This structure is contained within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_property_sppal">AM_PROPERTY_SPPAL</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvd_yuv
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVD_YUV {
    #StructPack 1

    /**
     * Reserved.
     */
    Reserved : Int8

    /**
     * Y color data.
     */
    Y : Int8

    /**
     * U color data.
     */
    U : Int8

    /**
     * V color data.
     */
    V : Int8

}

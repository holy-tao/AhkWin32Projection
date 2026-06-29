#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * The COLORKEY structure communicates color key information between the renderer and another filter.
 * @remarks
 * The video renderer supports a data transport accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> interface. This will typically be used by hardware decoder filters that need the renderer to communicate where to put the data rather than requiring the renderer to draw the data. One mechanism for communicating where to put the images is by using a color key. This structure is used by a filter (typically a hardware decoder) to describe color key requirements to the video renderer.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-colorkey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct COLORKEY {
    #StructPack 4

    /**
     * Key type. Can be <b>CK_NOCOLORKEY</b>, <b>CK_INDEX</b>, or <b>CK_RGB</b>. The <b>CK_INDEX</b> and <b>CK_RGB</b> can be combined with a bitwise <b>OR</b>.
     */
    KeyType : UInt32

    /**
     * Palette index.
     */
    PaletteIndex : UInt32

    /**
     * Lowest RGB color value.
     */
    LowColorValue : COLORREF

    /**
     * Highest RGB color value.
     */
    HighColorValue : COLORREF

}

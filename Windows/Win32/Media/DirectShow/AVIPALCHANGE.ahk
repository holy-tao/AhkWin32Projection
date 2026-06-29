#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The AVIPALCHANGE structure defines a palette change in an AVI file.
 * @see https://learn.microsoft.com/windows/win32/api/avifmt/ns-avifmt-avipalchange
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVIPALCHANGE {
    #StructPack 2

    /**
     * Specifies the index of the first palette entry to change.
     */
    bFirstEntry : Int8

    /**
     * Specifies the number of palette entries to change, or zero to change all 256 palette entries.
     */
    bNumEntries : Int8

    /**
     * Reserved.
     */
    wFlags : UInt16

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures, of size <b>bNumEntries</b>.
     */
    peNew : PALETTEENTRY[1]

}

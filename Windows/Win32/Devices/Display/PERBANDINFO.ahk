#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The PERBANDINFO structure is used as input to a printer graphics DLL's DrvQueryPerBandInfo function.
 * @remarks
 * If the result of <b>ulHorzRes</b> divided by <b>ulVertRes</b> is smaller than the result obtained by dividing the same members of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure, the band is rendered smaller by the graphics engine. If the values are the same, no scaling is done. The resultant scale factor obtained from this structure cannot be larger than the one stored in GDIINFO.
 * 
 * When the band is scaled, the graphics engine anchors the smaller band to the upper-left corner of the original band.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-perbandinfo
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PERBANDINFO {
    #StructPack 4

    /**
     * If <b>TRUE</b>, GDI redraws the previous band. If <b>FALSE</b>, GDI draws the next band.
     */
    bRepeatThisBand : BOOL

    /**
     * Specifies a SIZEL structure that contains the width and height, in pixels, of the rectangle in which GDI can draw the band. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
     */
    szlBand : SIZE

    /**
     * Specifies the horizontal resolution GDI should use when scaling the band.
     */
    ulHorzRes : UInt32

    /**
     * Specifies the vertical resolution GDI should use when scaling the band.
     */
    ulVertRes : UInt32

}

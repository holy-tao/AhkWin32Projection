#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The ENUMRECTS structure is used by the CLIPOBJ_cEnumStart function to provide information about rectangles in a clip region for the CLIPOBJ_bEnum function.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-enumrects
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ENUMRECTS {
    #StructPack 4

    /**
     * Specifies the number of RECTL structures in the <b>arcl</b> array.
     */
    c : UInt32

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structures that specify the coordinates of rectangles in the clip region.
     */
    arcl : RECTL[1]

}

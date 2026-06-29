#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\EMRTEXT.ahk" { EMRTEXT }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRPOLYTEXTOUTA and EMRPOLYTEXTOUTW structures contain members for the PolyTextOut enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolytextouta
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRPOLYTEXTOUTA {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle, in device units.
     */
    rclBounds : RECTL

    /**
     * Current graphics mode. This member can be either the GM_COMPATIBLE or GM_ADVANCED value.
     */
    iGraphicsMode : UInt32

    /**
     * X-scaling factor from page units to .01mm units if the graphics mode is the GM_COMPATIBLE value.
     */
    exScale : Float32

    /**
     * Y-scaling factor from page units to .01mm units if the graphics mode is the GM_COMPATIBLE value.
     */
    eyScale : Float32

    /**
     * Number of strings.
     */
    cStrings : Int32

    /**
     * <b>EMRTEXT</b> structure, which is followed by the string and the intercharacter spacing array.
     */
    aemrtext : EMRTEXT[1]

}

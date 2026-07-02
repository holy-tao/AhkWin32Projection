#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }

/**
 * The EMRSCALEVIEWPORTEXTEX and EMRSCALEWINDOWEXTEX structures contain members for the ScaleViewportExtEx and ScaleWindowExtEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrscaleviewportextex
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSCALEVIEWPORTEXTEX {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Horizontal multiplicand.
     */
    xNum : Int32

    /**
     * Horizontal divisor.
     */
    xDenom : Int32

    /**
     * Vertical multiplicand.
     */
    yNum : Int32

    /**
     * Vertical divisor.
     */
    yDenom : Int32

}

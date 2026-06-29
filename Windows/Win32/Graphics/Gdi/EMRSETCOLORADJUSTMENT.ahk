#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\COLORADJUSTMENT.ahk" { COLORADJUSTMENT }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETCOLORADJUSTMENT structure contains members for the SetColorAdjustment enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetcoloradjustment
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETCOLORADJUSTMENT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-coloradjustment">COLORADJUSTMENT</a> structure.
     */
    ColorAdjustment : COLORADJUSTMENT

}

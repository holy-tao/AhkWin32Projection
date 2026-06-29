#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETARCDIRECTION structure contains members for the SetArcDirection enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetarcdirection
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETARCDIRECTION {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Arc direction. This member can be either the AD_CLOCKWISE or AD_COUNTERCLOCKWISE value.
     */
    iArcDirection : UInt32

}

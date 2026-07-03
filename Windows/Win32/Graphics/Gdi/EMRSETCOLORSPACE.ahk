#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETCOLORSPACE, EMRSELECTCOLORSPACE, and EMRDELETECOLORSPACE structures contain members for the SetColorSpace and DeleteColorSpace enhanced metafile records.
 * @remarks
 * There is no function that generates an enhanced metafile record with the <b>EMRSELECTCOLORSPACE</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetcolorspace
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETCOLORSPACE {
    #StructPack 4

    /**
     * Base structure for all record types.
     */
    emr : EMR

    /**
     * Color space handle index.
     */
    ihCS : UInt32

}

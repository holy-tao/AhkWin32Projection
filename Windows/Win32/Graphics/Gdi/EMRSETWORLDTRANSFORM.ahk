#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XFORM.ahk" { XFORM }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETWORLDTRANSFORM structure contains members for the SetWorldTransform enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetworldtransform
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETWORLDTRANSFORM {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * World-space to page-space transformation data.
     */
    xform : XFORM

}

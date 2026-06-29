#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETMITERLIMIT structure contains members for the SetMiterLimit enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetmiterlimit
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETMITERLIMIT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * New miter limit.
     */
    eMiterLimit : Float32

}

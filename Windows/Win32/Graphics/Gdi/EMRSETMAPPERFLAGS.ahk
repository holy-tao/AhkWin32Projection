#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }

/**
 * The EMRSETMAPPERFLAGS structure contains members for the SetMapperFlags enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetmapperflags
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETMAPPERFLAGS {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Font mapper flag.
     */
    dwFlags : UInt32

}

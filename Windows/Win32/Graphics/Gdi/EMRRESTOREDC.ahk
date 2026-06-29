#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRRESTOREDC structure contains members for the RestoreDC enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrrestoredc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRRESTOREDC {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Relative instance to restore.
     */
    iRelative : Int32

}

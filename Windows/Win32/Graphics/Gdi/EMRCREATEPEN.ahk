#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LOGPEN.ahk" { LOGPEN }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRCREATEPEN structure contains members for the CreatePen enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatepen
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRCREATEPEN {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index to pen in handle table.
     */
    ihPen : UInt32

    /**
     * Logical pen.
     */
    lopn : LOGPEN

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETTEXTCOLOR {
    #StructPack 4

    emr : EMR

    crColor : COLORREF

}

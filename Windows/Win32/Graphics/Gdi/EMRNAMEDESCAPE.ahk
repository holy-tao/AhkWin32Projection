#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRNAMEDESCAPE {
    #StructPack 4

    emr : EMR

    iEscape : Int32

    cbDriver : Int32

    cbEscData : Int32

    EscData : Int8[1]

}

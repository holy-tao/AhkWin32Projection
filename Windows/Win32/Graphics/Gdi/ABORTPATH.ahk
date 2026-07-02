#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EMR.ahk" { EMR }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ABORTPATH {
    #StructPack 4

    emr : EMR

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEDIA_SAMPLE_CONTENT.ahk" { MEDIA_SAMPLE_CONTENT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_PID_MAP {
    #StructPack 4

    MediaSampleContent : MEDIA_SAMPLE_CONTENT

    ulcPIDs : UInt32

    aulPIDs : UInt32[1]

}

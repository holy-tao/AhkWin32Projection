#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NABTS_BUFFER_LINE.ahk" { NABTS_BUFFER_LINE }
#Import ".\VBICODECFILTERING_SCANLINES.ahk" { VBICODECFILTERING_SCANLINES }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct NABTS_BUFFER {
    #StructPack 8

    ScanlinesRequested : VBICODECFILTERING_SCANLINES

    PictureNumber : Int64

    NabtsLines : NABTS_BUFFER_LINE[11]

}

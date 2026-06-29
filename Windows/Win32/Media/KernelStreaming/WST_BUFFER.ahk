#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_SCANLINES.ahk" { VBICODECFILTERING_SCANLINES }
#Import ".\WST_BUFFER_LINE.ahk" { WST_BUFFER_LINE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct WST_BUFFER {
    #StructPack 4

    ScanlinesRequested : VBICODECFILTERING_SCANLINES

    WstLines : WST_BUFFER_LINE[17]

}

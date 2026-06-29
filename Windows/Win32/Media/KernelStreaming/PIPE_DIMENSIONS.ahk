#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_COMPRESSION.ahk" { KS_COMPRESSION }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct PIPE_DIMENSIONS {
    #StructPack 4

    AllocatorPin : KS_COMPRESSION

    MaxExpansionPin : KS_COMPRESSION

    EndPin : KS_COMPRESSION

}

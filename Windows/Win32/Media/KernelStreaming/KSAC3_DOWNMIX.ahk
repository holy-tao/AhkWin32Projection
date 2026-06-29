#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAC3_DOWNMIX {
    #StructPack 4

    fDownMix : BOOL

    fDolbySurround : BOOL

}

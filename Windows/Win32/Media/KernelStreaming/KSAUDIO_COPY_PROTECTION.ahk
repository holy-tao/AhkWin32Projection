#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_COPY_PROTECTION {
    #StructPack 4

    fCopyrighted : BOOL

    fOriginal : BOOL

}

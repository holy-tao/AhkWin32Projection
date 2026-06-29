#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMIDILOOPED_EVENT2 {
    #StructPack 8

    WriteEvent : HANDLE

    ReadEvent : HANDLE

}

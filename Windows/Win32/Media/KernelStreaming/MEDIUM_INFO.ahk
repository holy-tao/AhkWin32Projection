#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct MEDIUM_INFO {
    #StructPack 4

    MediaPresent : BOOL

    MediaType : UInt32

    RecordInhibit : BOOL

}

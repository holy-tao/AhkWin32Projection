#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import ".\KS_ANALOGVIDEOINFO.ahk" { KS_ANALOGVIDEOINFO }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATARANGE_ANALOGVIDEO {
    #StructPack 8

    DataRange : KSDATAFORMAT

    AnalogVideoInfo : KS_ANALOGVIDEOINFO

}

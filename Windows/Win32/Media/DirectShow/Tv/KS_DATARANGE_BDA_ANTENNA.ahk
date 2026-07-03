#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSDATAFORMAT.ahk" { KSDATAFORMAT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KS_DATARANGE_BDA_ANTENNA {
    #StructPack 8

    DataRange : KSDATAFORMAT

}

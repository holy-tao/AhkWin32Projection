#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDA_TRANSPORT_INFO.ahk" { BDA_TRANSPORT_INFO }
#Import "..\..\KernelStreaming\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KS_DATARANGE_BDA_TRANSPORT {
    #StructPack 8

    DataRange : KSDATAFORMAT

    BdaTransportInfo : BDA_TRANSPORT_INFO

}

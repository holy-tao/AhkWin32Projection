#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_H264VIDEOINFO.ahk" { KS_H264VIDEOINFO }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_H264VIDEOINFO {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    H264VideoInfoHeader : KS_H264VIDEOINFO

}

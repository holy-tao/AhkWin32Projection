#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDATARANGE_MUSIC {
    #StructPack 8

    DataRange : KSDATAFORMAT

    Technology : Guid

    Channels : UInt32

    Notes : UInt32

    ChannelMask : UInt32

}

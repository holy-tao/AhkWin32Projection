#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDATARANGE_AUDIO {
    #StructPack 8

    DataRange : KSDATAFORMAT

    MaximumChannels : UInt32

    MinimumBitsPerSample : UInt32

    MaximumBitsPerSample : UInt32

    MinimumSampleFrequency : UInt32

    MaximumSampleFrequency : UInt32

}

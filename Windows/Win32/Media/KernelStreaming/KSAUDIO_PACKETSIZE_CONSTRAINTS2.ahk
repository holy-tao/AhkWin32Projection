#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT.ahk" { KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_PACKETSIZE_CONSTRAINTS2 {
    #StructPack 4

    MinPacketPeriodInHns : UInt32

    PacketSizeFileAlignment : UInt32

    MaxPacketSizeInBytes : UInt32

    NumProcessingModeConstraints : UInt32

    ProcessingModeConstraints : KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT[1]

}

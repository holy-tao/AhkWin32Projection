#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT {
    #StructPack 4

    ProcessingMode : Guid

    SamplesPerProcessingPacket : UInt32

    ProcessingPacketDurationInHns : UInt32

}

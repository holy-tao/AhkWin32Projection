#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_SETWRITEPACKET_INFO {
    #StructPack 4

    PacketNumber : UInt32

    Flags : UInt32

    EosPacketLength : UInt32

}

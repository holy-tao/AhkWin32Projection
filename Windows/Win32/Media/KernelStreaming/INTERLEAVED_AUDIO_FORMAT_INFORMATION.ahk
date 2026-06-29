#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct INTERLEAVED_AUDIO_FORMAT_INFORMATION {
    #StructPack 4

    Size : UInt32

    PrimaryChannelCount : UInt32

    PrimaryChannelStartPosition : UInt32

    PrimaryChannelMask : UInt32

    InterleavedChannelCount : UInt32

    InterleavedChannelStartPosition : UInt32

    InterleavedChannelMask : UInt32

}

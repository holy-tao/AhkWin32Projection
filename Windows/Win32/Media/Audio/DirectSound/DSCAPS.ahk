#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSCAPS {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwMinSecondarySampleRate : UInt32

    dwMaxSecondarySampleRate : UInt32

    dwPrimaryBuffers : UInt32

    dwMaxHwMixingAllBuffers : UInt32

    dwMaxHwMixingStaticBuffers : UInt32

    dwMaxHwMixingStreamingBuffers : UInt32

    dwFreeHwMixingAllBuffers : UInt32

    dwFreeHwMixingStaticBuffers : UInt32

    dwFreeHwMixingStreamingBuffers : UInt32

    dwMaxHw3DAllBuffers : UInt32

    dwMaxHw3DStaticBuffers : UInt32

    dwMaxHw3DStreamingBuffers : UInt32

    dwFreeHw3DAllBuffers : UInt32

    dwFreeHw3DStaticBuffers : UInt32

    dwFreeHw3DStreamingBuffers : UInt32

    dwTotalHwMemBytes : UInt32

    dwFreeHwMemBytes : UInt32

    dwMaxContigFreeHwMemBytes : UInt32

    dwUnlockTransferRateHwBuffers : UInt32

    dwPlayCpuOverheadSwBuffers : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}

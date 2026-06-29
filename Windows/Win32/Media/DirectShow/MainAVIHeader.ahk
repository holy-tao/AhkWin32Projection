#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MainAVIHeader {
    #StructPack 4

    dwMicroSecPerFrame : UInt32

    dwMaxBytesPerSec : UInt32

    dwPaddingGranularity : UInt32

    dwFlags : UInt32

    dwTotalFrames : UInt32

    dwInitialFrames : UInt32

    dwStreams : UInt32

    dwSuggestedBufferSize : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dwReserved : UInt32[4]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIAS_DOWN_SAMPLE_INFO {
    #StructPack 8

    ulOriginalWidth : UInt32

    ulOriginalHeight : UInt32

    ulBitsPerPixel : UInt32

    ulXRes : UInt32

    ulYRes : UInt32

    ulDownSampledWidth : UInt32

    ulDownSampledHeight : UInt32

    ulActualSize : UInt32

    ulDestBufSize : UInt32

    ulSrcBufSize : UInt32

    pSrcBuffer : IntPtr

    pDestBuffer : IntPtr

}

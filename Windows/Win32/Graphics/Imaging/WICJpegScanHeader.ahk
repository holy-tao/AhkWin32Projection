#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a JPEG frame header. (WICJpegScanHeader)
 * @remarks
 * Get the scan header for an image by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader">IWICJpegFrameDecode::GetScanHeader</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicjpegscanheader
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegScanHeader {
    #StructPack 4

    /**
     * The number of components in the scan.
     */
    cComponents : UInt32

    /**
     * The interval of reset markers within the scan.
     */
    RestartInterval : UInt32

    /**
     * The component identifiers.
     */
    ComponentSelectors : UInt32

    /**
     * The format of the quantization table indices. Use one of the following constants, described in <a href="https://docs.microsoft.com/windows/desktop/wic/iwicjpegframedecode-constants">IWICJpegFrameDecode Constants</a>.
     * 
     * <ul>
     * <li>WIC_JPEG_HUFFMAN_BASELINE_ONE</li>
     * <li>WIC_JPEG_HUFFMAN_BASELINE_THREE </li>
     * </ul>
     */
    HuffmanTableIndices : UInt32

    /**
     * The start of the spectral selection.
     */
    StartSpectralSelection : Int8

    /**
     * The end of the spectral selection.
     */
    EndSpectralSelection : Int8

    /**
     * The successive approximation high.
     */
    SuccessiveApproximationHigh : Int8

    /**
     * The successive approximation low.
     */
    SuccessiveApproximationLow : Int8

}

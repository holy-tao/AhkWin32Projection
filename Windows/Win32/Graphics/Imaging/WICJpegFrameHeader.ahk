#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WICJpegTransferMatrix.ahk" { WICJpegTransferMatrix }
#Import ".\WICJpegScanType.ahk" { WICJpegScanType }

/**
 * Represents a JPEG frame header. (WICJpegFrameHeader)
 * @remarks
 * Get the frame header for an image by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getframeheader">IWICJpegFrameDecode::GetFrameHeader</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicjpegframeheader
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegFrameHeader {
    #StructPack 4

    /**
     * The width of the JPEG frame.
     */
    Width : UInt32

    /**
     * The height of the JPEG frame.
     */
    Height : UInt32

    /**
     * The transfer matrix of the JPEG frame.
     */
    TransferMatrix : WICJpegTransferMatrix

    /**
     * The scan type of the JPEG frame.
     */
    ScanType : WICJpegScanType

    /**
     * The number of components in the frame.
     */
    cComponents : UInt32

    /**
     * The component identifiers.
     */
    ComponentIdentifiers : UInt32

    /**
     * The sample factors. Use one of the following constants, described in <a href="https://docs.microsoft.com/windows/desktop/wic/iwicjpegframedecode-constants">IWICJpegFrameDecode Constants</a>.
     * 
     * <ul>
     * <li>WIC_JPEG_SAMPLE_FACTORS_ONE</li>
     * <li>WIC_JPEG_SAMPLE_FACTORS_THREE_420</li>
     * <li>WIC_JPEG_SAMPLE_FACTORS_THREE_422</li>
     * <li>WIC_JPEG_SAMPLE_FACTORS_THREE_440</li>
     * <li>WIC_JPEG_SAMPLE_FACTORS_THREE_444</li>
     * </ul>
     */
    SampleFactors : UInt32

    /**
     * The format of the quantization table indices. Use one of the following constants, described in <a href="https://docs.microsoft.com/windows/desktop/wic/iwicjpegframedecode-constants">IWICJpegFrameDecode Constants</a>.
     * 
     * <ul>
     * <li>WIC_JPEG_QUANTIZATION_BASELINE_ONE</li>
     * <li>WIC_JPEG_QUANTIZATION_BASELINE_THREE </li>
     * </ul>
     */
    QuantizationTableIndices : UInt32

}

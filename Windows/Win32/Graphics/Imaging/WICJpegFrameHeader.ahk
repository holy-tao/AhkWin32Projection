#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a JPEG frame header. (WICJpegFrameHeader)
 * @remarks
 * Get the frame header for an image by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getframeheader">IWICJpegFrameDecode::GetFrameHeader</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicjpegframeheader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegFrameHeader extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The width of the JPEG frame.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the JPEG frame.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The transfer matrix of the JPEG frame.
     * @type {Integer}
     */
    TransferMatrix {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The scan type of the JPEG frame.
     * @type {Integer}
     */
    ScanType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The number of components in the frame.
     * @type {Integer}
     */
    cComponents {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The component identifiers.
     * @type {Integer}
     */
    ComponentIdentifiers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

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
     * @type {Integer}
     */
    SampleFactors {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The format of the quantization table indices. Use one of the following constants, described in <a href="https://docs.microsoft.com/windows/desktop/wic/iwicjpegframedecode-constants">IWICJpegFrameDecode Constants</a>.
     * 
     * <ul>
     * <li>WIC_JPEG_QUANTIZATION_BASELINE_ONE</li>
     * <li>WIC_JPEG_QUANTIZATION_BASELINE_THREE </li>
     * </ul>
     * @type {Integer}
     */
    QuantizationTableIndices {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

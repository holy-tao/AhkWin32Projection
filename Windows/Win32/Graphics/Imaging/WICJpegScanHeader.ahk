#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a JPEG frame header.
 * @remarks
 * 
 * Get the scan header for an image by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader">IWICJpegFrameDecode::GetScanHeader</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ns-wincodec-wicjpegscanheader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegScanHeader extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The number of components in the scan.
     * @type {Integer}
     */
    cComponents {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The interval of reset markers within the scan.
     * @type {Integer}
     */
    RestartInterval {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The component identifiers.
     * @type {Integer}
     */
    ComponentSelectors {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The format of the quantization table indices. Use one of the following constants, described in <a href="https://docs.microsoft.com/windows/desktop/wic/iwicjpegframedecode-constants">IWICJpegFrameDecode Constants</a>.
     * 
     * <ul>
     * <li>WIC_JPEG_HUFFMAN_BASELINE_ONE</li>
     * <li>WIC_JPEG_HUFFMAN_BASELINE_THREE </li>
     * </ul>
     * @type {Integer}
     */
    HuffmanTableIndices {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The start of the spectral selection.
     * @type {Integer}
     */
    StartSpectralSelection {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * The end of the spectral selection.
     * @type {Integer}
     */
    EndSpectralSelection {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * The successive approximation high.
     * @type {Integer}
     */
    SuccessiveApproximationHigh {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * The successive approximation low.
     * @type {Integer}
     */
    SuccessiveApproximationLow {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }
}

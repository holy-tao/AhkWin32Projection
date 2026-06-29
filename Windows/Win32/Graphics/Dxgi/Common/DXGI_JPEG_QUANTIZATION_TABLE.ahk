#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a JPEG quantization table.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-quantization-table
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_JPEG_QUANTIZATION_TABLE {
    #StructPack 1

    /**
     * An array of bytes containing the elements of the quantization table.
     */
    Elements : Int8[64]

}

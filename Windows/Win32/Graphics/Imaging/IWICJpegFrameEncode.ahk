#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\Common\DXGI_JPEG_AC_HUFFMAN_TABLE.ahk
#Include ..\Dxgi\Common\DXGI_JPEG_DC_HUFFMAN_TABLE.ahk
#Include ..\Dxgi\Common\DXGI_JPEG_QUANTIZATION_TABLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for writing compressed JPEG scan data directly to the WIC encoder's output stream. Also provides access to the Huffman and quantization tables.
 * @remarks
 * 
  * Obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on the Windows-provided <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncoder</a> interface for the JPEG encoder.
  * 
  * The WIC JPEG encoder supports a smaller subset of JPEG features than the decoder does.
  * 
  * <ul>
  * <li>The encoder is limited to a single scan. It does not support encoding images that are multi-scan, either for progressive encoding or planar component data.</li>
  * <li>The encoder supports two quantization tables, two AC Huffman tables, and two DC Huffman tables. The luma tables are used for the Y channel and, in the case of YCCK, the black channel.  The chroma tables are used for the CbCr channels. </li>
  * <li>The encoder supports encoding gray, YCbCr (RGB), and YCCK (CMYK).</li>
  * <li>The encoder supports 4 fixed compontent subsampling, 4:2:0, 4:2:2, 4:4:0, and 4:4:4.  This subsamples chroma only.</li>
  * <li>The encoder does not support  restart markers.</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicjpegframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICJpegFrameEncode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICJpegFrameEncode
     * @type {Guid}
     */
    static IID => Guid("{2f0c601f-d2c6-468c-abfa-49495d983ed1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAcHuffmanTable", "GetDcHuffmanTable", "GetQuantizationTable", "WriteScan"]

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @returns {DXGI_JPEG_AC_HUFFMAN_TABLE} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getachuffmantable
     */
    GetAcHuffmanTable(scanIndex, tableIndex) {
        pAcHuffmanTable := DXGI_JPEG_AC_HUFFMAN_TABLE()
        result := ComCall(3, this, "uint", scanIndex, "uint", tableIndex, "ptr", pAcHuffmanTable, "HRESULT")
        return pAcHuffmanTable
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @returns {DXGI_JPEG_DC_HUFFMAN_TABLE} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getdchuffmantable
     */
    GetDcHuffmanTable(scanIndex, tableIndex) {
        pDcHuffmanTable := DXGI_JPEG_DC_HUFFMAN_TABLE()
        result := ComCall(4, this, "uint", scanIndex, "uint", tableIndex, "ptr", pDcHuffmanTable, "HRESULT")
        return pDcHuffmanTable
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @returns {DXGI_JPEG_QUANTIZATION_TABLE} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getquantizationtable
     */
    GetQuantizationTable(scanIndex, tableIndex) {
        pQuantizationTable := DXGI_JPEG_QUANTIZATION_TABLE()
        result := ComCall(5, this, "uint", scanIndex, "uint", tableIndex, "ptr", pQuantizationTable, "HRESULT")
        return pQuantizationTable
    }

    /**
     * 
     * @param {Integer} cbScanData 
     * @param {Pointer<Integer>} pbScanData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-writescan
     */
    WriteScan(cbScanData, pbScanData) {
        pbScanDataMarshal := pbScanData is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbScanData, pbScanDataMarshal, pbScanData, "HRESULT")
        return result
    }
}

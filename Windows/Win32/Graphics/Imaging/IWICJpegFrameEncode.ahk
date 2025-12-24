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
     * Retrieves a copy of the AC Huffman table for the specified scan and table.
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the AC Huffman table to retrieve.
     * @returns {DXGI_JPEG_AC_HUFFMAN_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-ac-huffman-table">DXGI_JPEG_AC_HUFFMAN_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicjpegframeencode-getachuffmantable
     */
    GetAcHuffmanTable(scanIndex, tableIndex) {
        pAcHuffmanTable := DXGI_JPEG_AC_HUFFMAN_TABLE()
        result := ComCall(3, this, "uint", scanIndex, "uint", tableIndex, "ptr", pAcHuffmanTable, "HRESULT")
        return pAcHuffmanTable
    }

    /**
     * Retrieves a copy of the DC Huffman table for the specified scan and table.
     * @param {Integer} scanIndex The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex The index of the DC Huffman table to retrieve.
     * @returns {DXGI_JPEG_DC_HUFFMAN_TABLE} A pointer that receives the table data. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicjpegframeencode-getdchuffmantable
     */
    GetDcHuffmanTable(scanIndex, tableIndex) {
        pDcHuffmanTable := DXGI_JPEG_DC_HUFFMAN_TABLE()
        result := ComCall(4, this, "uint", scanIndex, "uint", tableIndex, "ptr", pDcHuffmanTable, "HRESULT")
        return pDcHuffmanTable
    }

    /**
     * Retrieves a copy of the quantization table.
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the quantization table to retrieve.
     * @returns {DXGI_JPEG_QUANTIZATION_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-quantization-table">DXGI_JPEG_QUANTIZATION_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicjpegframeencode-getquantizationtable
     */
    GetQuantizationTable(scanIndex, tableIndex) {
        pQuantizationTable := DXGI_JPEG_QUANTIZATION_TABLE()
        result := ComCall(5, this, "uint", scanIndex, "uint", tableIndex, "ptr", pQuantizationTable, "HRESULT")
        return pQuantizationTable
    }

    /**
     * Writes scan data to a JPEG frame.
     * @param {Integer} cbScanData Type: <b>UINT</b>
     * 
     * The size of the data in the <i>pbScanData</i> parameter.
     * @param {Pointer<Integer>} pbScanData Type: <b>BYTE*</b>
     * 
     * The scan data to write.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicjpegframeencode-writescan
     */
    WriteScan(cbScanData, pbScanData) {
        pbScanDataMarshal := pbScanData is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbScanData, pbScanDataMarshal, pbScanData, "HRESULT")
        return result
    }
}

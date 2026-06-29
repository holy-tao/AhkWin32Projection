#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Dxgi\Common\DXGI_JPEG_AC_HUFFMAN_TABLE.ahk" { DXGI_JPEG_AC_HUFFMAN_TABLE }
#Import "..\Dxgi\Common\DXGI_JPEG_DC_HUFFMAN_TABLE.ahk" { DXGI_JPEG_DC_HUFFMAN_TABLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Dxgi\Common\DXGI_JPEG_QUANTIZATION_TABLE.ahk" { DXGI_JPEG_QUANTIZATION_TABLE }

/**
 * Exposes methods for writing compressed JPEG scan data directly to the WIC encoder's output stream. Also provides access to the Huffman and quantization tables.
 * @remarks
 * Obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on the Windows-provided <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncoder</a> interface for the JPEG encoder.
 * 
 * The WIC JPEG encoder supports a smaller subset of JPEG features than the decoder does.
 * 
 * <ul>
 * <li>The encoder is limited to a single scan. It does not support encoding images that are multi-scan, either for progressive encoding or planar component data.</li>
 * <li>The encoder supports two quantization tables, two AC Huffman tables, and two DC Huffman tables. The luma tables are used for the Y channel and, in the case of YCCK, the black channel.  The chroma tables are used for the CbCr channels. </li>
 * <li>The encoder supports encoding gray, YCbCr (RGB), and YCCK (CMYK).</li>
 * <li>The encoder supports 4 fixed component subsampling, 4:2:0, 4:2:2, 4:4:0, and 4:4:4.  This subsamples chroma only.</li>
 * <li>The encoder does not support restart markers.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicjpegframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICJpegFrameEncode extends IUnknown {
    /**
     * The interface identifier for IWICJpegFrameEncode
     * @type {Guid}
     */
    static IID := Guid("{2f0c601f-d2c6-468c-abfa-49495d983ed1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICJpegFrameEncode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAcHuffmanTable    : IntPtr
        GetDcHuffmanTable    : IntPtr
        GetQuantizationTable : IntPtr
        WriteScan            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICJpegFrameEncode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a copy of the AC Huffman table for the specified scan and table. (IWICJpegFrameEncode.GetAcHuffmanTable)
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the AC Huffman table to retrieve.
     * @returns {DXGI_JPEG_AC_HUFFMAN_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-ac-huffman-table">DXGI_JPEG_AC_HUFFMAN_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getachuffmantable
     */
    GetAcHuffmanTable(scanIndex, tableIndex) {
        pAcHuffmanTable := DXGI_JPEG_AC_HUFFMAN_TABLE()
        result := ComCall(3, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_AC_HUFFMAN_TABLE.Ptr, pAcHuffmanTable, "HRESULT")
        return pAcHuffmanTable
    }

    /**
     * Retrieves a copy of the DC Huffman table for the specified scan and table. (IWICJpegFrameEncode.GetDcHuffmanTable)
     * @param {Integer} scanIndex The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex The index of the DC Huffman table to retrieve.
     * @returns {DXGI_JPEG_DC_HUFFMAN_TABLE} A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getdchuffmantable
     */
    GetDcHuffmanTable(scanIndex, tableIndex) {
        pDcHuffmanTable := DXGI_JPEG_DC_HUFFMAN_TABLE()
        result := ComCall(4, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_DC_HUFFMAN_TABLE.Ptr, pDcHuffmanTable, "HRESULT")
        return pDcHuffmanTable
    }

    /**
     * Retrieves a copy of the quantization table. (IWICJpegFrameEncode.GetQuantizationTable)
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the quantization table to retrieve.
     * @returns {DXGI_JPEG_QUANTIZATION_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-quantization-table">DXGI_JPEG_QUANTIZATION_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-getquantizationtable
     */
    GetQuantizationTable(scanIndex, tableIndex) {
        pQuantizationTable := DXGI_JPEG_QUANTIZATION_TABLE()
        result := ComCall(5, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_QUANTIZATION_TABLE.Ptr, pQuantizationTable, "HRESULT")
        return pQuantizationTable
    }

    /**
     * Writes scan data to a JPEG frame.
     * @remarks
     * <b>WriteScan</b> may be called multiple times.  Each call appends the scan data specified to any previous scan data.  Complete the scan by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-commit">IWICBitmapFrameEncode::Commit</a>.
     * 
     * 
     * 
     * Any calls to set encoder parameters or image metadata that will appear before the scan data in the resulting JPEG file must be completed before the first call to this method.  This includes calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setcolorcontexts">IWICBitmapFrameEncode::SetColorContexts</a> , <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpalette">IWICBitmapFrameEncode::SetPalette</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setresolution">IWICBitmapFrameEncode::SetResolution</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setthumbnail">IWICBitmapFrameEncode::SetThumbnail</a>.  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">IWICBitmapFrameEncode::SetSize</a> is required as it has no default value for encoded image size.
     * @param {Integer} cbScanData Type: <b>UINT</b>
     * 
     * The size of the data in the <i>pbScanData</i> parameter.
     * @param {Pointer<Integer>} pbScanData Type: <b>BYTE*</b>
     * 
     * The scan data to write.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK on successful completion.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframeencode-writescan
     */
    WriteScan(cbScanData, pbScanData) {
        pbScanDataMarshal := pbScanData is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbScanData, pbScanDataMarshal, pbScanData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICJpegFrameEncode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAcHuffmanTable := CallbackCreate(GetMethod(implObj, "GetAcHuffmanTable"), flags, 4)
        this.vtbl.GetDcHuffmanTable := CallbackCreate(GetMethod(implObj, "GetDcHuffmanTable"), flags, 4)
        this.vtbl.GetQuantizationTable := CallbackCreate(GetMethod(implObj, "GetQuantizationTable"), flags, 4)
        this.vtbl.WriteScan := CallbackCreate(GetMethod(implObj, "WriteScan"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAcHuffmanTable)
        CallbackFree(this.vtbl.GetDcHuffmanTable)
        CallbackFree(this.vtbl.GetQuantizationTable)
        CallbackFree(this.vtbl.WriteScan)
    }
}

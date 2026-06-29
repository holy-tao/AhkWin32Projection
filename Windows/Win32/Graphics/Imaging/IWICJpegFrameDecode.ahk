#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICJpegFrameHeader.ahk" { WICJpegFrameHeader }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICJpegScanHeader.ahk" { WICJpegScanHeader }
#Import ".\WICJpegIndexingOptions.ahk" { WICJpegIndexingOptions }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Dxgi\Common\DXGI_JPEG_AC_HUFFMAN_TABLE.ahk" { DXGI_JPEG_AC_HUFFMAN_TABLE }
#Import "..\Dxgi\Common\DXGI_JPEG_DC_HUFFMAN_TABLE.ahk" { DXGI_JPEG_DC_HUFFMAN_TABLE }
#Import "..\Dxgi\Common\DXGI_JPEG_QUANTIZATION_TABLE.ahk" { DXGI_JPEG_QUANTIZATION_TABLE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for decoding JPEG images. Provides access to the Start Of Frame (SOF) header, Start of Scan (SOS) header, the Huffman and Quantization tables, and the compressed JPEG JPEG data. Also enables indexing for efficient random access.
 * @remarks
 * Obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on the Windows-provided <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecoder</a> interface for the JPEG decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicjpegframedecode
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICJpegFrameDecode extends IUnknown {
    /**
     * The interface identifier for IWICJpegFrameDecode
     * @type {Guid}
     */
    static IID := Guid("{8939f66e-c46a-4c21-a9d1-98b327ce1679}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICJpegFrameDecode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoesSupportIndexing  : IntPtr
        SetIndexing          : IntPtr
        ClearIndexing        : IntPtr
        GetAcHuffmanTable    : IntPtr
        GetDcHuffmanTable    : IntPtr
        GetQuantizationTable : IntPtr
        GetFrameHeader       : IntPtr
        GetScanHeader        : IntPtr
        CopyScan             : IntPtr
        CopyMinimalStream    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICJpegFrameDecode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a value indicating whether this decoder supports indexing for efficient random access.
     * @remarks
     * Indexing is only supported for some JPEG types. Call this method
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * True if indexing is supported; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-doessupportindexing
     */
    DoesSupportIndexing() {
        result := ComCall(3, this, BOOL.Ptr, &pfIndexingSupported := 0, "HRESULT")
        return pfIndexingSupported
    }

    /**
     * Enables indexing of the JPEG for efficient random access.
     * @remarks
     * This method enables efficient random-access to the image pixels at the expense of memory usage.  The amount of memory required for indexing depends on the requested index granularity.   Unless <b>SetIndexing</b> is called, it is much more efficient to access a JPEG by progressing through its pixels top-down during calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a>.
     * 
     * 
     * This method will fail if indexing is unsupported on the file.  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-doessupportindexing">IWICJpegFrameDecode::DoesSupportIndexing</a> should be called to first determine whether indexing is supported.  If this method is called multiple times, the final call changes the index granularity to the requested size.
     * 
     * 
     * The provided interval size controls horizontal spacing of index entries.  This value is internally rounded up according to the JPEG’s MCU (minimum coded unit) size, which is typically either 8 or 16 unscaled pixels.  The vertical size of the index interval is always equal to one MCU size.
     * 
     * Indexes can be generated immediately, or during future calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a> to reduce redundant decompression work.
     * @param {WICJpegIndexingOptions} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicjpegindexingoptions">WICJpegIndexingOptions</a></b>
     * 
     * A value specifying whether indexes should be generated immediately or deferred until a future call to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a>.
     * @param {Integer} horizontalIntervalSize Type: <b>UINT</b>
     * 
     * The granularity of the indexing, in pixels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK upon successful completion.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-setindexing
     */
    SetIndexing(options, horizontalIntervalSize) {
        result := ComCall(4, this, WICJpegIndexingOptions, options, "uint", horizontalIntervalSize, "HRESULT")
        return result
    }

    /**
     * Removes the indexing from a JPEG that has been indexed using IWICJpegFrameDecode::SetIndexing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK upon successful completion.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-clearindexing
     */
    ClearIndexing() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the AC Huffman table for the specified scan and table. (IWICJpegFrameDecode.GetAcHuffmanTable)
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the AC Huffman table to retrieve. Valid indices for a given scan can be determined by retrieving the scan header with <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader">IWICJpegFrameDecode::GetScanHeader</a>.
     * @returns {DXGI_JPEG_AC_HUFFMAN_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-ac-huffman-table">DXGI_JPEG_AC_HUFFMAN_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getachuffmantable
     */
    GetAcHuffmanTable(scanIndex, tableIndex) {
        pAcHuffmanTable := DXGI_JPEG_AC_HUFFMAN_TABLE()
        result := ComCall(6, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_AC_HUFFMAN_TABLE.Ptr, pAcHuffmanTable, "HRESULT")
        return pAcHuffmanTable
    }

    /**
     * Retrieves a copy of the DC Huffman table for the specified scan and table. (IWICJpegFrameDecode.GetDcHuffmanTable)
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the DC Huffman table to retrieve. Valid indices for a given scan can be determined by retrieving the scan header with <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader">IWICJpegFrameDecode::GetScanHeader</a>.
     * @returns {DXGI_JPEG_DC_HUFFMAN_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-ac-huffman-table">DXGI_JPEG_AC_HUFFMAN_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getdchuffmantable
     */
    GetDcHuffmanTable(scanIndex, tableIndex) {
        pDcHuffmanTable := DXGI_JPEG_DC_HUFFMAN_TABLE()
        result := ComCall(7, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_DC_HUFFMAN_TABLE.Ptr, pDcHuffmanTable, "HRESULT")
        return pDcHuffmanTable
    }

    /**
     * Retrieves a copy of the quantization table. (IWICJpegFrameDecode.GetQuantizationTable)
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} tableIndex Type: <b>UINT</b>
     * 
     * The index of the quantization table to retrieve. Valid indices for a given scan can be determined by retrieving the scan header with <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader">IWICJpegFrameDecode::GetScanHeader</a>.
     * @returns {DXGI_JPEG_QUANTIZATION_TABLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-jpeg-quantization-table">DXGI_JPEG_QUANTIZATION_TABLE</a>*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getquantizationtable
     */
    GetQuantizationTable(scanIndex, tableIndex) {
        pQuantizationTable := DXGI_JPEG_QUANTIZATION_TABLE()
        result := ComCall(8, this, "uint", scanIndex, "uint", tableIndex, DXGI_JPEG_QUANTIZATION_TABLE.Ptr, pQuantizationTable, "HRESULT")
        return pQuantizationTable
    }

    /**
     * Retrieves header data from the entire frame.
     * @returns {WICJpegFrameHeader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicjpegframeheader">WICJpegFrameHeader</a>*</b>
     * 
     * A pointer that receives the frame header data.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getframeheader
     */
    GetFrameHeader() {
        pFrameHeader := WICJpegFrameHeader()
        result := ComCall(9, this, WICJpegFrameHeader.Ptr, pFrameHeader, "HRESULT")
        return pFrameHeader
    }

    /**
     * Retrieves parameters from the Start Of Scan (SOS) marker for the scan with the specified index.
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The index of the scan for which header data is retrieved.
     * @returns {WICJpegScanHeader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicjpegscanheader">WICJpegScanHeader</a>*</b>
     * 
     * A pointer that receives the frame header data.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader
     */
    GetScanHeader(scanIndex) {
        pScanHeader := WICJpegScanHeader()
        result := ComCall(10, this, "uint", scanIndex, WICJpegScanHeader.Ptr, pScanHeader, "HRESULT")
        return pScanHeader
    }

    /**
     * Retrieves a copy of the compressed JPEG scan directly from the WIC decoder frame's output stream.
     * @param {Integer} scanIndex Type: <b>UINT</b>
     * 
     * The zero-based index of the scan for which data is retrieved.
     * @param {Integer} scanOffset Type: <b>UINT</b>
     * 
     * The byte position in the scan data to begin copying.  Use 0 on the first call.  If the output buffer size is insufficient to store the entire scan, this offset allows you to resume copying from the end of the previous copy operation.
     * @param {Integer} cbScanData Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <i>pbScanData</i> array.
     * @param {Pointer<Integer>} pbScanData Type: <b>BYTE*</b>
     * 
     * A pointer that receives the table data. This parameter must not be NULL.
     * @param {Pointer<Integer>} pcbScanDataActual Type: <b>UINT*</b>
     * 
     * A pointer that receives the size of the scan data actually copied into <i>pbScanData</i>. The size returned may be smaller that the size of <i>cbScanData</i>. This  parameter may be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WINCODEC_ERR_INVALIDJPEGSCANINDEX </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified scan index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-copyscan
     */
    CopyScan(scanIndex, scanOffset, cbScanData, pbScanData, pcbScanDataActual) {
        pbScanDataMarshal := pbScanData is VarRef ? "char*" : "ptr"
        pcbScanDataActualMarshal := pcbScanDataActual is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", scanIndex, "uint", scanOffset, "uint", cbScanData, pbScanDataMarshal, pbScanData, pcbScanDataActualMarshal, pcbScanDataActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} streamOffset 
     * @param {Integer} cbStreamData 
     * @param {Pointer<Integer>} pbStreamData 
     * @param {Pointer<Integer>} pcbStreamDataActual 
     * @returns {HRESULT} 
     */
    CopyMinimalStream(streamOffset, cbStreamData, pbStreamData, pcbStreamDataActual) {
        pbStreamDataMarshal := pbStreamData is VarRef ? "char*" : "ptr"
        pcbStreamDataActualMarshal := pcbStreamDataActual is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", streamOffset, "uint", cbStreamData, pbStreamDataMarshal, pbStreamData, pcbStreamDataActualMarshal, pcbStreamDataActual, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICJpegFrameDecode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoesSupportIndexing := CallbackCreate(GetMethod(implObj, "DoesSupportIndexing"), flags, 2)
        this.vtbl.SetIndexing := CallbackCreate(GetMethod(implObj, "SetIndexing"), flags, 3)
        this.vtbl.ClearIndexing := CallbackCreate(GetMethod(implObj, "ClearIndexing"), flags, 1)
        this.vtbl.GetAcHuffmanTable := CallbackCreate(GetMethod(implObj, "GetAcHuffmanTable"), flags, 4)
        this.vtbl.GetDcHuffmanTable := CallbackCreate(GetMethod(implObj, "GetDcHuffmanTable"), flags, 4)
        this.vtbl.GetQuantizationTable := CallbackCreate(GetMethod(implObj, "GetQuantizationTable"), flags, 4)
        this.vtbl.GetFrameHeader := CallbackCreate(GetMethod(implObj, "GetFrameHeader"), flags, 2)
        this.vtbl.GetScanHeader := CallbackCreate(GetMethod(implObj, "GetScanHeader"), flags, 3)
        this.vtbl.CopyScan := CallbackCreate(GetMethod(implObj, "CopyScan"), flags, 6)
        this.vtbl.CopyMinimalStream := CallbackCreate(GetMethod(implObj, "CopyMinimalStream"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoesSupportIndexing)
        CallbackFree(this.vtbl.SetIndexing)
        CallbackFree(this.vtbl.ClearIndexing)
        CallbackFree(this.vtbl.GetAcHuffmanTable)
        CallbackFree(this.vtbl.GetDcHuffmanTable)
        CallbackFree(this.vtbl.GetQuantizationTable)
        CallbackFree(this.vtbl.GetFrameHeader)
        CallbackFree(this.vtbl.GetScanHeader)
        CallbackFree(this.vtbl.CopyScan)
        CallbackFree(this.vtbl.CopyMinimalStream)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for decoding JPEG images. Provides access to the Start Of Frame (SOF) header, Start of Scan (SOS) header, the Huffman and Quantization tables, and the compressed JPEG JPEG data. Also enables indexing for efficient random access.
 * @remarks
 * 
  * Obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on the Windows-provided <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecoder</a> interface for the JPEG decoder.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicjpegframedecode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICJpegFrameDecode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICJpegFrameDecode
     * @type {Guid}
     */
    static IID => Guid("{8939f66e-c46a-4c21-a9d1-98b327ce1679}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoesSupportIndexing", "SetIndexing", "ClearIndexing", "GetAcHuffmanTable", "GetDcHuffmanTable", "GetQuantizationTable", "GetFrameHeader", "GetScanHeader", "CopyScan", "CopyMinimalStream"]

    /**
     * 
     * @param {Pointer<BOOL>} pfIndexingSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-doessupportindexing
     */
    DoesSupportIndexing(pfIndexingSupported) {
        result := ComCall(3, this, "ptr", pfIndexingSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Integer} horizontalIntervalSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-setindexing
     */
    SetIndexing(options, horizontalIntervalSize) {
        result := ComCall(4, this, "int", options, "uint", horizontalIntervalSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-clearindexing
     */
    ClearIndexing() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_AC_HUFFMAN_TABLE>} pAcHuffmanTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getachuffmantable
     */
    GetAcHuffmanTable(scanIndex, tableIndex, pAcHuffmanTable) {
        result := ComCall(6, this, "uint", scanIndex, "uint", tableIndex, "ptr", pAcHuffmanTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_DC_HUFFMAN_TABLE>} pDcHuffmanTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getdchuffmantable
     */
    GetDcHuffmanTable(scanIndex, tableIndex, pDcHuffmanTable) {
        result := ComCall(7, this, "uint", scanIndex, "uint", tableIndex, "ptr", pDcHuffmanTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_QUANTIZATION_TABLE>} pQuantizationTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getquantizationtable
     */
    GetQuantizationTable(scanIndex, tableIndex, pQuantizationTable) {
        result := ComCall(8, this, "uint", scanIndex, "uint", tableIndex, "ptr", pQuantizationTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WICJpegFrameHeader>} pFrameHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getframeheader
     */
    GetFrameHeader(pFrameHeader) {
        result := ComCall(9, this, "ptr", pFrameHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Pointer<WICJpegScanHeader>} pScanHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicjpegframedecode-getscanheader
     */
    GetScanHeader(scanIndex, pScanHeader) {
        result := ComCall(10, this, "uint", scanIndex, "ptr", pScanHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} scanOffset 
     * @param {Integer} cbScanData 
     * @param {Pointer<Integer>} pbScanData 
     * @param {Pointer<Integer>} pcbScanDataActual 
     * @returns {HRESULT} 
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
}

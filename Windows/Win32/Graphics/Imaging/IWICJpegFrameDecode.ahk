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
     * 
     * @param {Pointer<BOOL>} pfIndexingSupported 
     * @returns {HRESULT} 
     */
    DoesSupportIndexing(pfIndexingSupported) {
        result := ComCall(3, this, "ptr", pfIndexingSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Integer} horizontalIntervalSize 
     * @returns {HRESULT} 
     */
    SetIndexing(options, horizontalIntervalSize) {
        result := ComCall(4, this, "int", options, "uint", horizontalIntervalSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearIndexing() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_AC_HUFFMAN_TABLE>} pAcHuffmanTable 
     * @returns {HRESULT} 
     */
    GetAcHuffmanTable(scanIndex, tableIndex, pAcHuffmanTable) {
        result := ComCall(6, this, "uint", scanIndex, "uint", tableIndex, "ptr", pAcHuffmanTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_DC_HUFFMAN_TABLE>} pDcHuffmanTable 
     * @returns {HRESULT} 
     */
    GetDcHuffmanTable(scanIndex, tableIndex, pDcHuffmanTable) {
        result := ComCall(7, this, "uint", scanIndex, "uint", tableIndex, "ptr", pDcHuffmanTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} tableIndex 
     * @param {Pointer<DXGI_JPEG_QUANTIZATION_TABLE>} pQuantizationTable 
     * @returns {HRESULT} 
     */
    GetQuantizationTable(scanIndex, tableIndex, pQuantizationTable) {
        result := ComCall(8, this, "uint", scanIndex, "uint", tableIndex, "ptr", pQuantizationTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WICJpegFrameHeader>} pFrameHeader 
     * @returns {HRESULT} 
     */
    GetFrameHeader(pFrameHeader) {
        result := ComCall(9, this, "ptr", pFrameHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Pointer<WICJpegScanHeader>} pScanHeader 
     * @returns {HRESULT} 
     */
    GetScanHeader(scanIndex, pScanHeader) {
        result := ComCall(10, this, "uint", scanIndex, "ptr", pScanHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scanIndex 
     * @param {Integer} scanOffset 
     * @param {Integer} cbScanData 
     * @param {Pointer<Byte>} pbScanData 
     * @param {Pointer<UInt32>} pcbScanDataActual 
     * @returns {HRESULT} 
     */
    CopyScan(scanIndex, scanOffset, cbScanData, pbScanData, pcbScanDataActual) {
        result := ComCall(11, this, "uint", scanIndex, "uint", scanOffset, "uint", cbScanData, "char*", pbScanData, "uint*", pcbScanDataActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} streamOffset 
     * @param {Integer} cbStreamData 
     * @param {Pointer<Byte>} pbStreamData 
     * @param {Pointer<UInt32>} pcbStreamDataActual 
     * @returns {HRESULT} 
     */
    CopyMinimalStream(streamOffset, cbStreamData, pbStreamData, pcbStreamDataActual) {
        result := ComCall(12, this, "uint", streamOffset, "uint", cbStreamData, "char*", pbStreamData, "uint*", pcbStreamDataActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

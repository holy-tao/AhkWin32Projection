#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WICDdsFormatInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a single frame of DDS image data in its native DXGI_FORMAT form, as well as information about the image data.
 * @remarks
 * 
 * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> using the DDS codec and QueryInterface for IID_IWICDdsFrameDecode.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicddsframedecode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDdsFrameDecode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDdsFrameDecode
     * @type {Guid}
     */
    static IID => Guid("{3d4c0c61-18a4-41e4-bd80-481a4fc9f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSizeInBlocks", "GetFormatInfo", "CopyBlocks"]

    /**
     * Gets the width and height, in blocks, of the DDS image.
     * @param {Pointer<Integer>} pWidthInBlocks Type: <b>UINT*</b>
     * 
     * The width of the DDS image in blocks.
     * @param {Pointer<Integer>} pHeightInBlocks Type: <b>UINT*</b>
     * 
     * The height of the DDS image in blocks.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicddsframedecode-getsizeinblocks
     */
    GetSizeInBlocks(pWidthInBlocks, pHeightInBlocks) {
        pWidthInBlocksMarshal := pWidthInBlocks is VarRef ? "uint*" : "ptr"
        pHeightInBlocksMarshal := pHeightInBlocks is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pWidthInBlocksMarshal, pWidthInBlocks, pHeightInBlocksMarshal, pHeightInBlocks, "HRESULT")
        return result
    }

    /**
     * Gets information about the format in which the DDS image is stored.
     * @returns {WICDdsFormatInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsformatinfo">WICDdsFormatInfo</a>*</b>
     * 
     * Information about the DDS format.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicddsframedecode-getformatinfo
     */
    GetFormatInfo() {
        pFormatInfo := WICDdsFormatInfo()
        result := ComCall(4, this, "ptr", pFormatInfo, "HRESULT")
        return pFormatInfo
    }

    /**
     * Requests pixel data as it is natively stored within the DDS file.
     * @param {Pointer<WICRect>} prcBoundsInBlocks Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle to copy from the source. A NULL value specifies the entire texture.
     * 
     * If the texture uses a block-compressed <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, all values of the rectangle are expressed in number of blocks, not pixels.
     * @param {Integer} cbStride Type: <b>UINT</b>
     * 
     * The stride, in bytes, of the destination buffer. This represents the number of bytes from the buffer pointer to the next row of data. If the texture uses a block-compressed <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, a "row of data" is defined as a row of blocks which contains multiple pixel scanlines.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of the destination buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * A pointer to the destination buffer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicddsframedecode-copyblocks
     */
    CopyBlocks(prcBoundsInBlocks, cbStride, cbBufferSize) {
        result := ComCall(5, this, "ptr", prcBoundsInBlocks, "uint", cbStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}

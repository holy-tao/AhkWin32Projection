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
     * 
     * @param {Pointer<Integer>} pWidthInBlocks 
     * @param {Pointer<Integer>} pHeightInBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-getsizeinblocks
     */
    GetSizeInBlocks(pWidthInBlocks, pHeightInBlocks) {
        pWidthInBlocksMarshal := pWidthInBlocks is VarRef ? "uint*" : "ptr"
        pHeightInBlocksMarshal := pHeightInBlocks is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pWidthInBlocksMarshal, pWidthInBlocks, pHeightInBlocksMarshal, pHeightInBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WICDdsFormatInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-getformatinfo
     */
    GetFormatInfo() {
        pFormatInfo := WICDdsFormatInfo()
        result := ComCall(4, this, "ptr", pFormatInfo, "HRESULT")
        return pFormatInfo
    }

    /**
     * 
     * @param {Pointer<WICRect>} prcBoundsInBlocks 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-copyblocks
     */
    CopyBlocks(prcBoundsInBlocks, cbStride, cbBufferSize) {
        result := ComCall(5, this, "ptr", prcBoundsInBlocks, "uint", cbStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}

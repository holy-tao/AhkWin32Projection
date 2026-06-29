#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICRect.ahk" { WICRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICDdsFormatInfo.ahk" { WICDdsFormatInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a single frame of DDS image data in its native DXGI_FORMAT form, as well as information about the image data.
 * @remarks
 * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> using the DDS codec and QueryInterface for IID_IWICDdsFrameDecode.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicddsframedecode
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICDdsFrameDecode extends IUnknown {
    /**
     * The interface identifier for IWICDdsFrameDecode
     * @type {Guid}
     */
    static IID := Guid("{3d4c0c61-18a4-41e4-bd80-481a4fc9f464}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICDdsFrameDecode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSizeInBlocks : IntPtr
        GetFormatInfo   : IntPtr
        CopyBlocks      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICDdsFrameDecode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the width and height, in blocks, of the DDS image.
     * @remarks
     * For block compressed textures, the returned width and height values do not completely define the texture size because the image is padded to fit the closest whole block size. For example, three BC1 textures with pixel dimensions of 1x1, 2x2 and 4x4 will all report <i>pWidthInBlocks</i> = 1 and <i>pHeightInBlocks</i> = 1.
     * 
     * 
     * 
     * If the texture does not use a block-compressed <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, this method returns the texture size in pixels; for these formats the block size returned by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicddsframedecode-getformatinfo">IWICDdsFrameDecoder::GetFormatInfo</a> is 1x1.
     * @param {Pointer<Integer>} pWidthInBlocks Type: <b>UINT*</b>
     * 
     * The width of the DDS image in blocks.
     * @param {Pointer<Integer>} pHeightInBlocks Type: <b>UINT*</b>
     * 
     * The height of the DDS image in blocks.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-getsizeinblocks
     */
    GetSizeInBlocks(pWidthInBlocks, pHeightInBlocks) {
        pWidthInBlocksMarshal := pWidthInBlocks is VarRef ? "uint*" : "ptr"
        pHeightInBlocksMarshal := pHeightInBlocks is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pWidthInBlocksMarshal, pWidthInBlocks, pHeightInBlocksMarshal, pHeightInBlocks, "HRESULT")
        return result
    }

    /**
     * Gets information about the format in which the DDS image is stored.
     * @remarks
     * This information can be used for allocating memory or constructing Direct3D or Direct2D resources, for example by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/Direct2D/id2d1devicecontext-createbitmap-overload">ID2D1DeviceContext::CreateBitmap</a>.
     * @returns {WICDdsFormatInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsformatinfo">WICDdsFormatInfo</a>*</b>
     * 
     * Information about the DDS format.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-getformatinfo
     */
    GetFormatInfo() {
        pFormatInfo := WICDdsFormatInfo()
        result := ComCall(4, this, WICDdsFormatInfo.Ptr, pFormatInfo, "HRESULT")
        return pFormatInfo
    }

    /**
     * Requests pixel data as it is natively stored within the DDS file.
     * @remarks
     * If the texture does not use a block-compressed <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, this method behaves similarly to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a>. However, it does not perform any pixel format conversion, and instead produces the raw data from the DDS file.
     * 
     * If the texture uses a block-compressed <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, this method copies the block data directly into the provided buffer. In this case, the <i>prcBoundsInBlocks</i> parameter is defined in blocks, not pixels. To determine if this is the case, call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicddsframedecode-getformatinfo">GetFormatInfo</a> and read the <b>DxgiFormat</b> member of the returned <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsformatinfo">WICDdsFormatInfo</a> structure.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsframedecode-copyblocks
     */
    CopyBlocks(prcBoundsInBlocks, cbStride, cbBufferSize) {
        result := ComCall(5, this, WICRect.Ptr, prcBoundsInBlocks, "uint", cbStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    Query(iid) {
        if (IWICDdsFrameDecode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSizeInBlocks := CallbackCreate(GetMethod(implObj, "GetSizeInBlocks"), flags, 3)
        this.vtbl.GetFormatInfo := CallbackCreate(GetMethod(implObj, "GetFormatInfo"), flags, 2)
        this.vtbl.CopyBlocks := CallbackCreate(GetMethod(implObj, "CopyBlocks"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSizeInBlocks)
        CallbackFree(this.vtbl.GetFormatInfo)
        CallbackFree(this.vtbl.CopyBlocks)
    }
}

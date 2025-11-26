#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICColorContext.ahk
#Include .\IWICComponentInfo.ahk

/**
 * Exposes methods that provide information about a pixel format.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicpixelformatinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPixelFormatInfo extends IWICComponentInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPixelFormatInfo
     * @type {Guid}
     */
    static IID => Guid("{e8eda601-3d48-431a-ab44-69059be88bbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormatGUID", "GetColorContext", "GetBitsPerPixel", "GetChannelCount", "GetChannelMask"]

    /**
     * Gets the pixel format GUID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the pixel format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo-getformatguid
     */
    GetFormatGUID() {
        pFormat := Guid()
        result := ComCall(11, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Gets the pixel format's IWICColorContext.
     * @returns {IWICColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * Pointer that receives the pixel format's color context.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo-getcolorcontext
     */
    GetColorContext() {
        result := ComCall(12, this, "ptr*", &ppIColorContext := 0, "HRESULT")
        return IWICColorContext(ppIColorContext)
    }

    /**
     * Gets the bits per pixel (BPP) of the pixel format.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the BPP of the pixel format.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo-getbitsperpixel
     */
    GetBitsPerPixel() {
        result := ComCall(13, this, "uint*", &puiBitsPerPixel := 0, "HRESULT")
        return puiBitsPerPixel
    }

    /**
     * Gets the number of channels the pixel format contains.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the channel count.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(14, this, "uint*", &puiChannelCount := 0, "HRESULT")
        return puiChannelCount
    }

    /**
     * Gets the pixel format's channel mask.
     * @param {Integer} uiChannelIndex Type: <b>UINT</b>
     * 
     * The index to the channel mask to retrieve.
     * @param {Integer} cbMaskBuffer Type: <b>UINT</b>
     * 
     * The size of the <i>pbMaskBuffer</i> buffer.
     * @param {Pointer<Integer>} pbMaskBuffer Type: <b>BYTE*</b>
     * 
     * Pointer to the mask buffer.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to obtain the channel mask.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo-getchannelmask
     */
    GetChannelMask(uiChannelIndex, cbMaskBuffer, pbMaskBuffer) {
        pbMaskBufferMarshal := pbMaskBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", uiChannelIndex, "uint", cbMaskBuffer, pbMaskBufferMarshal, pbMaskBuffer, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }
}

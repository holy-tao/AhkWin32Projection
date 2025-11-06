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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getformatguid
     */
    GetFormatGUID() {
        pFormat := Guid()
        result := ComCall(11, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @returns {IWICColorContext} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getcolorcontext
     */
    GetColorContext() {
        result := ComCall(12, this, "ptr*", &ppIColorContext := 0, "HRESULT")
        return IWICColorContext(ppIColorContext)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getbitsperpixel
     */
    GetBitsPerPixel() {
        result := ComCall(13, this, "uint*", &puiBitsPerPixel := 0, "HRESULT")
        return puiBitsPerPixel
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(14, this, "uint*", &puiChannelCount := 0, "HRESULT")
        return puiChannelCount
    }

    /**
     * 
     * @param {Integer} uiChannelIndex 
     * @param {Integer} cbMaskBuffer 
     * @param {Pointer<Integer>} pbMaskBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelmask
     */
    GetChannelMask(uiChannelIndex, cbMaskBuffer, pbMaskBuffer) {
        pbMaskBufferMarshal := pbMaskBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", uiChannelIndex, "uint", cbMaskBuffer, pbMaskBufferMarshal, pbMaskBuffer, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }
}

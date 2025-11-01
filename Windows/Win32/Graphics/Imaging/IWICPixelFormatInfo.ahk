#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getformatguid
     */
    GetFormatGUID(pFormat) {
        result := ComCall(11, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorContext>} ppIColorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getcolorcontext
     */
    GetColorContext(ppIColorContext) {
        result := ComCall(12, this, "ptr*", ppIColorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiBitsPerPixel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getbitsperpixel
     */
    GetBitsPerPixel(puiBitsPerPixel) {
        puiBitsPerPixelMarshal := puiBitsPerPixel is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, puiBitsPerPixelMarshal, puiBitsPerPixel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelcount
     */
    GetChannelCount(puiChannelCount) {
        puiChannelCountMarshal := puiChannelCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, puiChannelCountMarshal, puiChannelCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiChannelIndex 
     * @param {Integer} cbMaskBuffer 
     * @param {Pointer<Integer>} pbMaskBuffer 
     * @param {Pointer<Integer>} pcbActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelmask
     */
    GetChannelMask(uiChannelIndex, cbMaskBuffer, pbMaskBuffer, pcbActual) {
        pbMaskBufferMarshal := pbMaskBuffer is VarRef ? "char*" : "ptr"
        pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", uiChannelIndex, "uint", cbMaskBuffer, pbMaskBufferMarshal, pbMaskBuffer, pcbActualMarshal, pcbActual, "HRESULT")
        return result
    }
}

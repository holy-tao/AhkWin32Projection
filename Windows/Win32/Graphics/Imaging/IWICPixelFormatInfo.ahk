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
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    GetFormatGUID(pFormat) {
        result := ComCall(11, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorContext>} ppIColorContext 
     * @returns {HRESULT} 
     */
    GetColorContext(ppIColorContext) {
        result := ComCall(12, this, "ptr", ppIColorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiBitsPerPixel 
     * @returns {HRESULT} 
     */
    GetBitsPerPixel(puiBitsPerPixel) {
        result := ComCall(13, this, "uint*", puiBitsPerPixel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiChannelCount 
     * @returns {HRESULT} 
     */
    GetChannelCount(puiChannelCount) {
        result := ComCall(14, this, "uint*", puiChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiChannelIndex 
     * @param {Integer} cbMaskBuffer 
     * @param {Pointer<Byte>} pbMaskBuffer 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {HRESULT} 
     */
    GetChannelMask(uiChannelIndex, cbMaskBuffer, pbMaskBuffer, pcbActual) {
        result := ComCall(15, this, "uint", uiChannelIndex, "uint", cbMaskBuffer, "char*", pbMaskBuffer, "uint*", pcbActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

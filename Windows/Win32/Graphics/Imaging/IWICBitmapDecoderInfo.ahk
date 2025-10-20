#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapCodecInfo.ahk

/**
 * Exposes methods that provide information about a decoder.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapdecoderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapDecoderInfo extends IWICBitmapCodecInfo{
    /**
     * The interface identifier for IWICBitmapDecoderInfo
     * @type {Guid}
     */
    static IID => Guid("{d8cd007f-d08f-4191-9bfc-236ea7f0e4b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * 
     * @param {Integer} cbSizePatterns 
     * @param {Pointer} pPatterns 
     * @param {Pointer<UInt32>} pcPatterns 
     * @param {Pointer<UInt32>} pcbPatternsActual 
     * @returns {HRESULT} 
     */
    GetPatterns(cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual) {
        result := ComCall(23, this, "uint", cbSizePatterns, "ptr", pPatterns, "uint*", pcPatterns, "uint*", pcbPatternsActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     */
    MatchesPattern(pIStream, pfMatches) {
        result := ComCall(24, this, "ptr", pIStream, "ptr", pfMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapDecoder>} ppIBitmapDecoder 
     * @returns {HRESULT} 
     */
    CreateInstance(ppIBitmapDecoder) {
        result := ComCall(25, this, "ptr", ppIBitmapDecoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPatterns", "MatchesPattern", "CreateInstance"]

    /**
     * 
     * @param {Integer} cbSizePatterns 
     * @param {Pointer} pPatterns 
     * @param {Pointer<Integer>} pcPatterns 
     * @param {Pointer<Integer>} pcbPatternsActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-getpatterns
     */
    GetPatterns(cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual) {
        result := ComCall(23, this, "uint", cbSizePatterns, "ptr", pPatterns, "uint*", pcPatterns, "uint*", pcbPatternsActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-matchespattern
     */
    MatchesPattern(pIStream, pfMatches) {
        result := ComCall(24, this, "ptr", pIStream, "ptr", pfMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapDecoder>} ppIBitmapDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-createinstance
     */
    CreateInstance(ppIBitmapDecoder) {
        result := ComCall(25, this, "ptr*", ppIBitmapDecoder, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapDecoder.ahk
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
        pcPatternsMarshal := pcPatterns is VarRef ? "uint*" : "ptr"
        pcbPatternsActualMarshal := pcbPatternsActual is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", cbSizePatterns, "ptr", pPatterns, pcPatternsMarshal, pcPatterns, pcbPatternsActualMarshal, pcbPatternsActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-matchespattern
     */
    MatchesPattern(pIStream) {
        result := ComCall(24, this, "ptr", pIStream, "int*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * 
     * @returns {IWICBitmapDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(25, this, "ptr*", &ppIBitmapDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIBitmapDecoder)
    }
}

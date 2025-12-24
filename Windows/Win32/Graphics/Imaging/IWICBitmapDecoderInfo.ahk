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
     * Retrieves the file pattern signatures supported by the decoder.
     * @param {Integer} cbSizePatterns Type: <b>UINT</b>
     * 
     * The array size of the <i>pPatterns</i> array.
     * @param {Pointer} pPatterns Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmappattern">WICBitmapPattern</a>*</b>
     * 
     * Receives a list of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmappattern">WICBitmapPattern</a> objects supported by the decoder.
     * @param {Pointer<Integer>} pcPatterns Type: <b>UINT*</b>
     * 
     * Receives the number of patterns the decoder supports.
     * @param {Pointer<Integer>} pcbPatternsActual Type: <b>UINT*</b>
     * 
     * Receives the actual buffer size needed to retrieve all pattern signatures supported by the decoder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoderinfo-getpatterns
     */
    GetPatterns(cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual) {
        pcPatternsMarshal := pcPatterns is VarRef ? "uint*" : "ptr"
        pcbPatternsActualMarshal := pcbPatternsActual is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", cbSizePatterns, "ptr", pPatterns, pcPatternsMarshal, pcPatterns, pcbPatternsActualMarshal, pcbPatternsActual, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the codec recognizes the pattern within a specified stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to pattern match within.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives <b>TRUE</b> if the patterns match; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoderinfo-matchespattern
     */
    MatchesPattern(pIStream) {
        result := ComCall(24, this, "ptr", pIStream, "int*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * Creates a new IWICBitmapDecoder instance.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(25, this, "ptr*", &ppIBitmapDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIBitmapDecoder)
    }
}

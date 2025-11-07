#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MPEG1WAVEFORMAT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMpegAudioDecoder interface is exposed on the MPEG-1 Audio Decoder filter and it enables applications to control decoding parameters.
 * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nn-mpegtype-impegaudiodecoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMpegAudioDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpegAudioDecoder
     * @type {Guid}
     */
    static IID => Guid("{b45dd570-3c77-11d1-abe1-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrequencyDivider", "put_FrequencyDivider", "get_DecoderAccuracy", "put_DecoderAccuracy", "get_Stereo", "put_Stereo", "get_DecoderWordSize", "put_DecoderWordSize", "get_IntegerDecode", "put_IntegerDecode", "get_DualMode", "put_DualMode", "get_AudioFormat"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_frequencydivider
     */
    get_FrequencyDivider() {
        result := ComCall(3, this, "uint*", &pDivider := 0, "HRESULT")
        return pDivider
    }

    /**
     * 
     * @param {Integer} Divider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_frequencydivider
     */
    put_FrequencyDivider(Divider) {
        result := ComCall(4, this, "uint", Divider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderaccuracy
     */
    get_DecoderAccuracy() {
        result := ComCall(5, this, "uint*", &pAccuracy := 0, "HRESULT")
        return pAccuracy
    }

    /**
     * 
     * @param {Integer} Accuracy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderaccuracy
     */
    put_DecoderAccuracy(Accuracy) {
        result := ComCall(6, this, "uint", Accuracy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_stereo
     */
    get_Stereo() {
        result := ComCall(7, this, "uint*", &pStereo := 0, "HRESULT")
        return pStereo
    }

    /**
     * 
     * @param {Integer} Stereo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_stereo
     */
    put_Stereo(Stereo) {
        result := ComCall(8, this, "uint", Stereo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderwordsize
     */
    get_DecoderWordSize() {
        result := ComCall(9, this, "uint*", &pWordSize := 0, "HRESULT")
        return pWordSize
    }

    /**
     * 
     * @param {Integer} WordSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderwordsize
     */
    put_DecoderWordSize(WordSize) {
        result := ComCall(10, this, "uint", WordSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_integerdecode
     */
    get_IntegerDecode() {
        result := ComCall(11, this, "uint*", &pIntDecode := 0, "HRESULT")
        return pIntDecode
    }

    /**
     * 
     * @param {Integer} IntDecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_integerdecode
     */
    put_IntegerDecode(IntDecode) {
        result := ComCall(12, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIntDecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_dualmode
     */
    get_DualMode(pIntDecode) {
        pIntDecodeMarshal := pIntDecode is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIntDecodeMarshal, pIntDecode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} IntDecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_dualmode
     */
    put_DualMode(IntDecode) {
        result := ComCall(14, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {MPEG1WAVEFORMAT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_audioformat
     */
    get_AudioFormat() {
        lpFmt := MPEG1WAVEFORMAT()
        result := ComCall(15, this, "ptr", lpFmt, "HRESULT")
        return lpFmt
    }
}

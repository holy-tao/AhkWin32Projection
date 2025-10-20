#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMpegAudioDecoder interface is exposed on the MPEG-1 Audio Decoder filter and it enables applications to control decoding parameters.
 * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nn-mpegtype-impegaudiodecoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMpegAudioDecoder extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pDivider 
     * @returns {HRESULT} 
     */
    get_FrequencyDivider(pDivider) {
        result := ComCall(3, this, "uint*", pDivider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Divider 
     * @returns {HRESULT} 
     */
    put_FrequencyDivider(Divider) {
        result := ComCall(4, this, "uint", Divider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pAccuracy 
     * @returns {HRESULT} 
     */
    get_DecoderAccuracy(pAccuracy) {
        result := ComCall(5, this, "uint*", pAccuracy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Accuracy 
     * @returns {HRESULT} 
     */
    put_DecoderAccuracy(Accuracy) {
        result := ComCall(6, this, "uint", Accuracy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pStereo 
     * @returns {HRESULT} 
     */
    get_Stereo(pStereo) {
        result := ComCall(7, this, "uint*", pStereo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Stereo 
     * @returns {HRESULT} 
     */
    put_Stereo(Stereo) {
        result := ComCall(8, this, "uint", Stereo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pWordSize 
     * @returns {HRESULT} 
     */
    get_DecoderWordSize(pWordSize) {
        result := ComCall(9, this, "uint*", pWordSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WordSize 
     * @returns {HRESULT} 
     */
    put_DecoderWordSize(WordSize) {
        result := ComCall(10, this, "uint", WordSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pIntDecode 
     * @returns {HRESULT} 
     */
    get_IntegerDecode(pIntDecode) {
        result := ComCall(11, this, "uint*", pIntDecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} IntDecode 
     * @returns {HRESULT} 
     */
    put_IntegerDecode(IntDecode) {
        result := ComCall(12, this, "uint", IntDecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pIntDecode 
     * @returns {HRESULT} 
     */
    get_DualMode(pIntDecode) {
        result := ComCall(13, this, "uint*", pIntDecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} IntDecode 
     * @returns {HRESULT} 
     */
    put_DualMode(IntDecode) {
        result := ComCall(14, this, "uint", IntDecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MPEG1WAVEFORMAT>} lpFmt 
     * @returns {HRESULT} 
     */
    get_AudioFormat(lpFmt) {
        result := ComCall(15, this, "ptr", lpFmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

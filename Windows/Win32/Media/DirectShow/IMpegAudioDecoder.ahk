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
     * @type {Integer} 
     */
    FrequencyDivider {
        get => this.get_FrequencyDivider()
        set => this.put_FrequencyDivider(value)
    }

    /**
     * @type {Integer} 
     */
    DecoderAccuracy {
        get => this.get_DecoderAccuracy()
        set => this.put_DecoderAccuracy(value)
    }

    /**
     * @type {Integer} 
     */
    Stereo {
        get => this.get_Stereo()
        set => this.put_Stereo(value)
    }

    /**
     * @type {Integer} 
     */
    DecoderWordSize {
        get => this.get_DecoderWordSize()
        set => this.put_DecoderWordSize(value)
    }

    /**
     * @type {Integer} 
     */
    IntegerDecode {
        get => this.get_IntegerDecode()
        set => this.put_IntegerDecode(value)
    }

    /**
     */
    DualMode {
        get => this.get_DualMode()
        set => this.put_DualMode(value)
    }

    /**
     * @type {MPEG1WAVEFORMAT} 
     */
    AudioFormat {
        get => this.get_AudioFormat()
    }

    /**
     * Returns the frequency divider as a quality setting equal to CD Audio, FM Radio, or AM Radio.
     * @returns {Integer} Receives the frequency divider.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_frequencydivider
     */
    get_FrequencyDivider() {
        result := ComCall(3, this, "uint*", &pDivider := 0, "HRESULT")
        return pDivider
    }

    /**
     * Specifies the frequency divider as a three-level setting corresponding to the quality of CD Audio, FM Radio, or AM Radio.
     * @param {Integer} Divider Specifies the divider. 1 = "CD Audio"; 2 = "FM Radio"; 4 = "AM Radio".
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_frequencydivider
     */
    put_FrequencyDivider(Divider) {
        result := ComCall(4, this, "uint", Divider, "HRESULT")
        return result
    }

    /**
     * Returns the decoder accuracy as a three-level quality setting.
     * @returns {Integer} Indicates the quality setting. 0 = best, 0x4000 = high, and 0x8000 = full.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderaccuracy
     */
    get_DecoderAccuracy() {
        result := ComCall(5, this, "uint*", &pAccuracy := 0, "HRESULT")
        return pAccuracy
    }

    /**
     * Specifies the decoder accuracy as a three-level quality setting.
     * @param {Integer} Accuracy Indicates the quality setting. 0 = best, 0x4000 = high, 0x8000 = full.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderaccuracy
     */
    put_DecoderAccuracy(Accuracy) {
        result := ComCall(6, this, "uint", Accuracy, "HRESULT")
        return result
    }

    /**
     * Returns whether the decoder is decoding the encoded stream into stereo or mono PCM.
     * @returns {Integer} Indicates whether the decoder is outputting to PCM mono or stereo.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_stereo
     */
    get_Stereo() {
        result := ComCall(7, this, "uint*", &pStereo := 0, "HRESULT")
        return pStereo
    }

    /**
     * Specifies whether the decoder will decode the encoded stream into stereo or mono PCM.
     * @param {Integer} Stereo Specifies the decoded output type. 1 = mono and 2 = stereo.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_stereo
     */
    put_Stereo(Stereo) {
        result := ComCall(8, this, "uint", Stereo, "HRESULT")
        return result
    }

    /**
     * Returns the word size used to decode, either eight or 16 bit.
     * @returns {Integer} Indicates the word size; the value is either 8 or 16.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderwordsize
     */
    get_DecoderWordSize() {
        result := ComCall(9, this, "uint*", &pWordSize := 0, "HRESULT")
        return pWordSize
    }

    /**
     * Specifies the word size used by the decoder.
     * @param {Integer} WordSize Specifies the word size; value must be 8 or 16.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderwordsize
     */
    put_DecoderWordSize(WordSize) {
        result := ComCall(10, this, "uint", WordSize, "HRESULT")
        return result
    }

    /**
     * Returns whether the decoder is currently using integer-based decoding as opposed to floating point decoding.
     * @returns {Integer} Indicates whether the decoder is using integer-based decoding. Zero means it is using floating point-based decoding and one means it is using integer-based decoding.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_integerdecode
     */
    get_IntegerDecode() {
        result := ComCall(11, this, "uint*", &pIntDecode := 0, "HRESULT")
        return pIntDecode
    }

    /**
     * Specifies whether the decoder will use integer-based decoding.
     * @param {Integer} IntDecode Specifies the decoding mode. 0 = floating point mode and 1 = integer mode.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_integerdecode
     */
    put_IntegerDecode(IntDecode) {
        result := ComCall(12, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * Returns which channel is currently being decoded.
     * @param {Pointer<Integer>} pIntDecode Indicates the channel(s) to be decoded.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_dualmode
     */
    get_DualMode(pIntDecode) {
        pIntDecodeMarshal := pIntDecode is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIntDecodeMarshal, pIntDecode, "HRESULT")
        return result
    }

    /**
     * Specifies the channel to be decoded.
     * @param {Integer} IntDecode Specifies the channel(s) to be decoded. See remarks for valid values.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-put_dualmode
     */
    put_DualMode(IntDecode) {
        result := ComCall(14, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * Returns the audio format of the connected input pin.
     * @returns {MPEG1WAVEFORMAT} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-mpeg1waveformat">MPEG1WAVEFORMAT</a> structure. The method copies the format data into the structure.
     * @see https://docs.microsoft.com/windows/win32/api//mpegtype/nf-mpegtype-impegaudiodecoder-get_audioformat
     */
    get_AudioFormat() {
        lpFmt := MPEG1WAVEFORMAT()
        result := ComCall(15, this, "ptr", lpFmt, "HRESULT")
        return lpFmt
    }
}

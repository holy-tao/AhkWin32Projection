#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MPEG1WAVEFORMAT.ahk" { MPEG1WAVEFORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMpegAudioDecoder interface is exposed on the MPEG-1 Audio Decoder filter and it enables applications to control decoding parameters.
 * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nn-mpegtype-impegaudiodecoder
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMpegAudioDecoder extends IUnknown {
    /**
     * The interface identifier for IMpegAudioDecoder
     * @type {Guid}
     */
    static IID := Guid("{b45dd570-3c77-11d1-abe1-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMpegAudioDecoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_FrequencyDivider : IntPtr
        put_FrequencyDivider : IntPtr
        get_DecoderAccuracy  : IntPtr
        put_DecoderAccuracy  : IntPtr
        get_Stereo           : IntPtr
        put_Stereo           : IntPtr
        get_DecoderWordSize  : IntPtr
        put_DecoderWordSize  : IntPtr
        get_IntegerDecode    : IntPtr
        put_IntegerDecode    : IntPtr
        get_DualMode         : IntPtr
        put_DualMode         : IntPtr
        get_AudioFormat      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMpegAudioDecoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {Integer} 
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_frequencydivider
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_frequencydivider
     */
    put_FrequencyDivider(Divider) {
        result := ComCall(4, this, "uint", Divider, "HRESULT")
        return result
    }

    /**
     * Returns the decoder accuracy as a three-level quality setting.
     * @returns {Integer} Indicates the quality setting. 0 = best, 0x4000 = high, and 0x8000 = full.
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderaccuracy
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderaccuracy
     */
    put_DecoderAccuracy(Accuracy) {
        result := ComCall(6, this, "uint", Accuracy, "HRESULT")
        return result
    }

    /**
     * Returns whether the decoder is decoding the encoded stream into stereo or mono PCM.
     * @returns {Integer} Indicates whether the decoder is outputting to PCM mono or stereo.
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_stereo
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_stereo
     */
    put_Stereo(Stereo) {
        result := ComCall(8, this, "uint", Stereo, "HRESULT")
        return result
    }

    /**
     * Returns the word size used to decode, either eight or 16 bit.
     * @returns {Integer} Indicates the word size; the value is either 8 or 16.
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_decoderwordsize
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_decoderwordsize
     */
    put_DecoderWordSize(WordSize) {
        result := ComCall(10, this, "uint", WordSize, "HRESULT")
        return result
    }

    /**
     * Returns whether the decoder is currently using integer-based decoding as opposed to floating point decoding.
     * @returns {Integer} Indicates whether the decoder is using integer-based decoding. Zero means it is using floating point-based decoding and one means it is using integer-based decoding.
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_integerdecode
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_integerdecode
     */
    put_IntegerDecode(IntDecode) {
        result := ComCall(12, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * Returns which channel is currently being decoded.
     * @remarks
     * The <i>pIntDecode</i> parameter can have one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_MERGE
     *             </b></td>
     * <td>Both channels are decoded.</td>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_LEFT
     *             </b></td>
     * <td>The left channel is decoded.</td>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_RIGHT
     *             </b></td>
     * <td>The right channel is decoded.</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_dualmode
     */
    get_DualMode(pIntDecode) {
        pIntDecodeMarshal := pIntDecode is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIntDecodeMarshal, pIntDecode, "HRESULT")
        return result
    }

    /**
     * Specifies the channel to be decoded.
     * @remarks
     * The following table lists the valid values for the <i>pIntDecode</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_MERGE
     *             </b></td>
     * <td>Specifies that both channels will be decoded.</td>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_LEFT
     *             </b></td>
     * <td>Specifies that the left channel will be decoded.</td>
     * </tr>
     * <tr>
     * <td><b>AM_MPEG_AUDIO_DUAL_RIGHT
     *             </b></td>
     * <td>Specifies that the right channel will be decoded.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method is useful for karaoke discs in Video CD (VCD) format that have two mono channels in the audio stream.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-put_dualmode
     */
    put_DualMode(IntDecode) {
        result := ComCall(14, this, "uint", IntDecode, "HRESULT")
        return result
    }

    /**
     * Returns the audio format of the connected input pin.
     * @returns {MPEG1WAVEFORMAT} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-mpeg1waveformat">MPEG1WAVEFORMAT</a> structure. The method copies the format data into the structure.
     * @see https://learn.microsoft.com/windows/win32/api/mpegtype/nf-mpegtype-impegaudiodecoder-get_audioformat
     */
    get_AudioFormat() {
        lpFmt := MPEG1WAVEFORMAT()
        result := ComCall(15, this, MPEG1WAVEFORMAT.Ptr, lpFmt, "HRESULT")
        return lpFmt
    }

    Query(iid) {
        if (IMpegAudioDecoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FrequencyDivider := CallbackCreate(GetMethod(implObj, "get_FrequencyDivider"), flags, 2)
        this.vtbl.put_FrequencyDivider := CallbackCreate(GetMethod(implObj, "put_FrequencyDivider"), flags, 2)
        this.vtbl.get_DecoderAccuracy := CallbackCreate(GetMethod(implObj, "get_DecoderAccuracy"), flags, 2)
        this.vtbl.put_DecoderAccuracy := CallbackCreate(GetMethod(implObj, "put_DecoderAccuracy"), flags, 2)
        this.vtbl.get_Stereo := CallbackCreate(GetMethod(implObj, "get_Stereo"), flags, 2)
        this.vtbl.put_Stereo := CallbackCreate(GetMethod(implObj, "put_Stereo"), flags, 2)
        this.vtbl.get_DecoderWordSize := CallbackCreate(GetMethod(implObj, "get_DecoderWordSize"), flags, 2)
        this.vtbl.put_DecoderWordSize := CallbackCreate(GetMethod(implObj, "put_DecoderWordSize"), flags, 2)
        this.vtbl.get_IntegerDecode := CallbackCreate(GetMethod(implObj, "get_IntegerDecode"), flags, 2)
        this.vtbl.put_IntegerDecode := CallbackCreate(GetMethod(implObj, "put_IntegerDecode"), flags, 2)
        this.vtbl.get_DualMode := CallbackCreate(GetMethod(implObj, "get_DualMode"), flags, 2)
        this.vtbl.put_DualMode := CallbackCreate(GetMethod(implObj, "put_DualMode"), flags, 2)
        this.vtbl.get_AudioFormat := CallbackCreate(GetMethod(implObj, "get_AudioFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FrequencyDivider)
        CallbackFree(this.vtbl.put_FrequencyDivider)
        CallbackFree(this.vtbl.get_DecoderAccuracy)
        CallbackFree(this.vtbl.put_DecoderAccuracy)
        CallbackFree(this.vtbl.get_Stereo)
        CallbackFree(this.vtbl.put_Stereo)
        CallbackFree(this.vtbl.get_DecoderWordSize)
        CallbackFree(this.vtbl.put_DecoderWordSize)
        CallbackFree(this.vtbl.get_IntegerDecode)
        CallbackFree(this.vtbl.put_IntegerDecode)
        CallbackFree(this.vtbl.get_DualMode)
        CallbackFree(this.vtbl.put_DualMode)
        CallbackFree(this.vtbl.get_AudioFormat)
    }
}

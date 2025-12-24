#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMAudioInputMixer interface controls audio capture properties, such as panning and loudness; and enables or disables specific audio inputs, such as the line in or the microphone. The Audio Capture filter exposes this interface on each input pin, as well as on the filter itself. The input pins on the Audio Capture Filter represent physical hardware connections; they are not connected to other DirectShow filters. The pin name indicates the input type; for example, &quot;Line In&quot; or &quot;Microphone.&quot; Use the IAMAudioInputMixer interface as follows:To control the settings on a particular input, use the interface on the pin.To set the overall properties when multiple inputs are enabled, use the interface on the filter.To enable or disable an input, call that pin's IAMAudioInputMixer::put_Enable method.Some methods on this interface might fail, depening on the capabilities of the underlying hardware.Filter Developers:\_Implement this interface on each input pin of an audio capture filter. You can also implement this interface on the audio capture filter itself to control the overall audio settings after mixing.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamaudioinputmixer
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAudioInputMixer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMAudioInputMixer
     * @type {Guid}
     */
    static IID => Guid("{54c39221-8380-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Enable", "get_Enable", "put_Mono", "get_Mono", "put_MixLevel", "get_MixLevel", "put_Pan", "get_Pan", "put_Loudness", "get_Loudness", "put_Treble", "get_Treble", "get_TrebleRange", "put_Bass", "get_Bass", "get_BassRange"]

    /**
     * @type {BOOL} 
     */
    Enable {
        get => this.get_Enable()
        set => this.put_Enable(value)
    }

    /**
     * @type {BOOL} 
     */
    Mono {
        get => this.get_Mono()
        set => this.put_Mono(value)
    }

    /**
     * @type {Float} 
     */
    MixLevel {
        get => this.get_MixLevel()
        set => this.put_MixLevel(value)
    }

    /**
     * @type {Float} 
     */
    Pan {
        get => this.get_Pan()
        set => this.put_Pan(value)
    }

    /**
     * @type {BOOL} 
     */
    Loudness {
        get => this.get_Loudness()
        set => this.put_Loudness(value)
    }

    /**
     * @type {Float} 
     */
    Treble {
        get => this.get_Treble()
        set => this.put_Treble(value)
    }

    /**
     * @type {Float} 
     */
    TrebleRange {
        get => this.get_TrebleRange()
    }

    /**
     * @type {Float} 
     */
    Bass {
        get => this.get_Bass()
        set => this.put_Bass(value)
    }

    /**
     * @type {Float} 
     */
    BassRange {
        get => this.get_BassRange()
    }

    /**
     * The put_Enable method enables or disables an input.
     * @param {BOOL} fEnable 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_enable
     */
    put_Enable(fEnable) {
        result := ComCall(3, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The get_Enable method retrieves whether the input is enabled.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_enable
     */
    get_Enable() {
        result := ComCall(4, this, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * The put_Mono method combines all channels into a mono signal.
     * @param {BOOL} fMono 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error setting mono control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_mono
     */
    put_Mono(fMono) {
        result := ComCall(5, this, "int", fMono, "HRESULT")
        return result
    }

    /**
     * The get_Mono method queries whether all channels are combined into a mono signal.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_mono
     */
    get_Mono() {
        result := ComCall(6, this, "int*", &pfMono := 0, "HRESULT")
        return pfMono
    }

    /**
     * The put_MixLevel method sets the recording level for this input.
     * @param {Float} Level Specifies the recording level. The following values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0.0 to 1.0</td>
     * <td>Zero indicates that the recording level is off; the value 1.0 indicates that the recording level is at full volume. Intermediate values are also allowed.</td>
     * </tr>
     * <tr>
     * <td>AMF_AUTOMATICGAIN</td>
     * <td>Enable automatic adjustment of the recording level.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This filter does not support the AMF_AUTOMATICGAIN flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_mixlevel
     */
    put_MixLevel(Level) {
        result := ComCall(7, this, "double", Level, "HRESULT")
        return result
    }

    /**
     * The get_MixLevel method retrieves the recording level.
     * @returns {Float} Receives the recording level. The following values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0.0 to 1.0</td>
     * <td>Zero indicates that the recording level is off; the value 1.0 indicates that the recording level is at full volume. Intermediate values are also allowed.</td>
     * </tr>
     * <tr>
     * <td>AMF_AUTOMATICGAIN</td>
     * <td>Automatic adjustment of the recording level is enabled.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_mixlevel
     */
    get_MixLevel() {
        result := ComCall(8, this, "double*", &pLevel := 0, "HRESULT")
        return pLevel
    }

    /**
     * The put_Pan method sets the pan level.
     * @param {Float} Pan Specifies the pan level. Possible values range from –1.0 to 1.0, as follows.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>-1</td>
     * <td>Full left</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Center</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Full right</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_pan
     */
    put_Pan(Pan) {
        result := ComCall(9, this, "double", Pan, "HRESULT")
        return result
    }

    /**
     * The get_Pan method retrieves the pan level.
     * @returns {Float} Receives the pan level. Possible values range from from –1.0 to 1.0, as follows:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>-1</td>
     * <td>Full left</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Center</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Full right</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_pan
     */
    get_Pan() {
        result := ComCall(10, this, "double*", &pPan := 0, "HRESULT")
        return pPan
    }

    /**
     * The put_Loudness method enables or disables the loudness control.
     * @param {BOOL} fLoudness 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_loudness
     */
    put_Loudness(fLoudness) {
        result := ComCall(11, this, "int", fLoudness, "HRESULT")
        return result
    }

    /**
     * The get_Loudness method retrieves the loudness control setting.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_loudness
     */
    get_Loudness() {
        result := ComCall(12, this, "int*", &pfLoudness := 0, "HRESULT")
        return pfLoudness
    }

    /**
     * The put_Treble method sets the treble equalization for this input.
     * @param {Float} Treble Specifies the gain, in decibels. A negative value specifies attenuation.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. The following are possible values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Argument is invalid. Must be in range given by <a href="/windows/desktop/api/strmif/nf-strmif-iamaudioinputmixer-get_treblerange">IAMAudioInputMixer::get_TrebleRange</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_treble
     */
    put_Treble(Treble) {
        result := ComCall(13, this, "double", Treble, "HRESULT")
        return result
    }

    /**
     * The get_Treble method retrieves the treble equalization.
     * @returns {Float} Receives the treble gain, in decibels. A negative value indicates attenuation.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_treble
     */
    get_Treble() {
        result := ComCall(14, this, "double*", &pTreble := 0, "HRESULT")
        return pTreble
    }

    /**
     * The get_TrebleRange method retrieves the treble range for this input.
     * @returns {Float} Receives the largest valid value for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamaudioinputmixer-put_treble">IAMAudioInputMixer::put_Treble</a>. For example, 6.0 means that any value between –6.0 and 6.0 is valid.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_treblerange
     */
    get_TrebleRange() {
        result := ComCall(15, this, "double*", &pRange := 0, "HRESULT")
        return pRange
    }

    /**
     * The put_Bass method sets the bass equalization.
     * @param {Float} Bass Specifies the gain, in decibels. A negative value specifies attenuation.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. Must be in range given by <a href="/windows/desktop/api/strmif/nf-strmif-iamaudioinputmixer-get_bassrange">IAMAudioInputMixer::get_BassRange</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-put_bass
     */
    put_Bass(Bass) {
        result := ComCall(16, this, "double", Bass, "HRESULT")
        return result
    }

    /**
     * The get_Bass method retrieves the bass equalization.
     * @returns {Float} Receives the bass gain, in decibels. A negative value indicates attenuation.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_bass
     */
    get_Bass() {
        result := ComCall(17, this, "double*", &pBass := 0, "HRESULT")
        return pBass
    }

    /**
     * The get_BassRange method retrieves the bass range.
     * @returns {Float} Receives the largest valid value for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamaudioinputmixer-put_bass">IAMAudioInputMixer::put_Bass</a> method. For example, 6.0 means that any value between –6.0 and 6.0 is valid.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudioinputmixer-get_bassrange
     */
    get_BassRange() {
        result := ComCall(18, this, "double*", &pRange := 0, "HRESULT")
        return pRange
    }
}

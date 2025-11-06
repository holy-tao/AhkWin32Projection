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
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_enable
     */
    put_Enable(fEnable) {
        result := ComCall(3, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_enable
     */
    get_Enable() {
        result := ComCall(4, this, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * 
     * @param {BOOL} fMono 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_mono
     */
    put_Mono(fMono) {
        result := ComCall(5, this, "int", fMono, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_mono
     */
    get_Mono() {
        result := ComCall(6, this, "int*", &pfMono := 0, "HRESULT")
        return pfMono
    }

    /**
     * 
     * @param {Float} Level 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_mixlevel
     */
    put_MixLevel(Level) {
        result := ComCall(7, this, "double", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_mixlevel
     */
    get_MixLevel() {
        result := ComCall(8, this, "double*", &pLevel := 0, "HRESULT")
        return pLevel
    }

    /**
     * 
     * @param {Float} Pan 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_pan
     */
    put_Pan(Pan) {
        result := ComCall(9, this, "double", Pan, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_pan
     */
    get_Pan() {
        result := ComCall(10, this, "double*", &pPan := 0, "HRESULT")
        return pPan
    }

    /**
     * 
     * @param {BOOL} fLoudness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_loudness
     */
    put_Loudness(fLoudness) {
        result := ComCall(11, this, "int", fLoudness, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_loudness
     */
    get_Loudness() {
        result := ComCall(12, this, "int*", &pfLoudness := 0, "HRESULT")
        return pfLoudness
    }

    /**
     * 
     * @param {Float} Treble 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_treble
     */
    put_Treble(Treble) {
        result := ComCall(13, this, "double", Treble, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_treble
     */
    get_Treble() {
        result := ComCall(14, this, "double*", &pTreble := 0, "HRESULT")
        return pTreble
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_treblerange
     */
    get_TrebleRange() {
        result := ComCall(15, this, "double*", &pRange := 0, "HRESULT")
        return pRange
    }

    /**
     * 
     * @param {Float} Bass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-put_bass
     */
    put_Bass(Bass) {
        result := ComCall(16, this, "double", Bass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_bass
     */
    get_Bass() {
        result := ComCall(17, this, "double*", &pBass := 0, "HRESULT")
        return pBass
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudioinputmixer-get_bassrange
     */
    get_BassRange() {
        result := ComCall(18, this, "double*", &pRange := 0, "HRESULT")
        return pRange
    }
}

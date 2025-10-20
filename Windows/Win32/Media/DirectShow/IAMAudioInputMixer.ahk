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
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    put_Enable(fEnable) {
        result := ComCall(3, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     */
    get_Enable(pfEnable) {
        result := ComCall(4, this, "ptr", pfEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMono 
     * @returns {HRESULT} 
     */
    put_Mono(fMono) {
        result := ComCall(5, this, "int", fMono, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfMono 
     * @returns {HRESULT} 
     */
    get_Mono(pfMono) {
        result := ComCall(6, this, "ptr", pfMono, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Level 
     * @returns {HRESULT} 
     */
    put_MixLevel(Level) {
        result := ComCall(7, this, "double", Level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pLevel 
     * @returns {HRESULT} 
     */
    get_MixLevel(pLevel) {
        result := ComCall(8, this, "double*", pLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Pan 
     * @returns {HRESULT} 
     */
    put_Pan(Pan) {
        result := ComCall(9, this, "double", Pan, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pPan 
     * @returns {HRESULT} 
     */
    get_Pan(pPan) {
        result := ComCall(10, this, "double*", pPan, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLoudness 
     * @returns {HRESULT} 
     */
    put_Loudness(fLoudness) {
        result := ComCall(11, this, "int", fLoudness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLoudness 
     * @returns {HRESULT} 
     */
    get_Loudness(pfLoudness) {
        result := ComCall(12, this, "ptr", pfLoudness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Treble 
     * @returns {HRESULT} 
     */
    put_Treble(Treble) {
        result := ComCall(13, this, "double", Treble, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTreble 
     * @returns {HRESULT} 
     */
    get_Treble(pTreble) {
        result := ComCall(14, this, "double*", pTreble, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRange 
     * @returns {HRESULT} 
     */
    get_TrebleRange(pRange) {
        result := ComCall(15, this, "double*", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Bass 
     * @returns {HRESULT} 
     */
    put_Bass(Bass) {
        result := ComCall(16, this, "double", Bass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pBass 
     * @returns {HRESULT} 
     */
    get_Bass(pBass) {
        result := ComCall(17, this, "double*", pBass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRange 
     * @returns {HRESULT} 
     */
    get_BassRange(pRange) {
        result := ComCall(18, this, "double*", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

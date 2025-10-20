#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2Voice.ahk

/**
 * Use a source voice to submit audio data to the XAudio2 processing pipeline.
 * @remarks
 * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nn-xaudio2-ixaudio2sourcevoice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2SourceVoice extends IXAudio2Voice{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    Start(Flags, OperationSet) {
        result := ComCall(19, this, "uint", Flags, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    Stop(Flags, OperationSet) {
        result := ComCall(20, this, "uint", Flags, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_BUFFER>} pBuffer 
     * @param {Pointer<XAUDIO2_BUFFER_WMA>} pBufferWMA 
     * @returns {HRESULT} 
     */
    SubmitSourceBuffer(pBuffer, pBufferWMA) {
        result := ComCall(21, this, "ptr", pBuffer, "ptr", pBufferWMA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushSourceBuffers() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Discontinuity() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    ExitLoop(OperationSet) {
        result := ComCall(24, this, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XAUDIO2_VOICE_STATE>} pVoiceState 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    GetState(pVoiceState, Flags) {
        ComCall(25, this, "ptr", pVoiceState, "uint", Flags)
        return result
    }

    /**
     * 
     * @param {Float} Ratio 
     * @param {Integer} OperationSet 
     * @returns {HRESULT} 
     */
    SetFrequencyRatio(Ratio, OperationSet) {
        result := ComCall(26, this, "float", Ratio, "uint", OperationSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pRatio 
     * @returns {String} Nothing - always returns an empty string
     */
    GetFrequencyRatio(pRatio) {
        ComCall(27, this, "float*", pRatio)
        return result
    }

    /**
     * 
     * @param {Integer} NewSourceSampleRate 
     * @returns {HRESULT} 
     */
    SetSourceSampleRate(NewSourceSampleRate) {
        result := ComCall(28, this, "uint", NewSourceSampleRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Encoder Service.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_Encoder)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_encoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_Encoder extends IUnknown{
    /**
     * The interface identifier for IBDA_Encoder
     * @type {Guid}
     */
    static IID => Guid("{3a8bad59-59fe-4559-a0ba-396cfaa98ae3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} NumAudioFmts 
     * @param {Pointer<UInt32>} NumVideoFmts 
     * @returns {HRESULT} 
     */
    QueryCapabilities(NumAudioFmts, NumVideoFmts) {
        result := ComCall(3, this, "uint*", NumAudioFmts, "uint*", NumVideoFmts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FmtIndex 
     * @param {Pointer<UInt32>} MethodID 
     * @param {Pointer<UInt32>} AlgorithmType 
     * @param {Pointer<UInt32>} SamplingRate 
     * @param {Pointer<UInt32>} BitDepth 
     * @param {Pointer<UInt32>} NumChannels 
     * @returns {HRESULT} 
     */
    EnumAudioCapability(FmtIndex, MethodID, AlgorithmType, SamplingRate, BitDepth, NumChannels) {
        result := ComCall(4, this, "uint", FmtIndex, "uint*", MethodID, "uint*", AlgorithmType, "uint*", SamplingRate, "uint*", BitDepth, "uint*", NumChannels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FmtIndex 
     * @param {Pointer<UInt32>} MethodID 
     * @param {Pointer<UInt32>} AlgorithmType 
     * @param {Pointer<UInt32>} VerticalSize 
     * @param {Pointer<UInt32>} HorizontalSize 
     * @param {Pointer<UInt32>} AspectRatio 
     * @param {Pointer<UInt32>} FrameRateCode 
     * @param {Pointer<UInt32>} ProgressiveSequence 
     * @returns {HRESULT} 
     */
    EnumVideoCapability(FmtIndex, MethodID, AlgorithmType, VerticalSize, HorizontalSize, AspectRatio, FrameRateCode, ProgressiveSequence) {
        result := ComCall(5, this, "uint", FmtIndex, "uint*", MethodID, "uint*", AlgorithmType, "uint*", VerticalSize, "uint*", HorizontalSize, "uint*", AspectRatio, "uint*", FrameRateCode, "uint*", ProgressiveSequence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AudioBitrateMode 
     * @param {Integer} AudioBitrate 
     * @param {Integer} AudioMethodID 
     * @param {Integer} AudioProgram 
     * @param {Integer} VideoBitrateMode 
     * @param {Integer} VideoBitrate 
     * @param {Integer} VideoMethodID 
     * @returns {HRESULT} 
     */
    SetParameters(AudioBitrateMode, AudioBitrate, AudioMethodID, AudioProgram, VideoBitrateMode, VideoBitrate, VideoMethodID) {
        result := ComCall(6, this, "uint", AudioBitrateMode, "uint", AudioBitrate, "uint", AudioMethodID, "uint", AudioProgram, "uint", VideoBitrateMode, "uint", VideoBitrate, "uint", VideoMethodID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} AudioBitrateMax 
     * @param {Pointer<UInt32>} AudioBitrateMin 
     * @param {Pointer<UInt32>} AudioBitrateMode 
     * @param {Pointer<UInt32>} AudioBitrateStepping 
     * @param {Pointer<UInt32>} AudioBitrate 
     * @param {Pointer<UInt32>} AudioMethodID 
     * @param {Pointer<UInt32>} AvailableAudioPrograms 
     * @param {Pointer<UInt32>} AudioProgram 
     * @param {Pointer<UInt32>} VideoBitrateMax 
     * @param {Pointer<UInt32>} VideoBitrateMin 
     * @param {Pointer<UInt32>} VideoBitrateMode 
     * @param {Pointer<UInt32>} VideoBitrate 
     * @param {Pointer<UInt32>} VideoBitrateStepping 
     * @param {Pointer<UInt32>} VideoMethodID 
     * @param {Pointer<UInt32>} SignalSourceID 
     * @param {Pointer<UInt64>} SignalFormat 
     * @param {Pointer<BOOL>} SignalLock 
     * @param {Pointer<Int32>} SignalLevel 
     * @param {Pointer<UInt32>} SignalToNoiseRatio 
     * @returns {HRESULT} 
     */
    GetState(AudioBitrateMax, AudioBitrateMin, AudioBitrateMode, AudioBitrateStepping, AudioBitrate, AudioMethodID, AvailableAudioPrograms, AudioProgram, VideoBitrateMax, VideoBitrateMin, VideoBitrateMode, VideoBitrate, VideoBitrateStepping, VideoMethodID, SignalSourceID, SignalFormat, SignalLock, SignalLevel, SignalToNoiseRatio) {
        result := ComCall(7, this, "uint*", AudioBitrateMax, "uint*", AudioBitrateMin, "uint*", AudioBitrateMode, "uint*", AudioBitrateStepping, "uint*", AudioBitrate, "uint*", AudioMethodID, "uint*", AvailableAudioPrograms, "uint*", AudioProgram, "uint*", VideoBitrateMax, "uint*", VideoBitrateMin, "uint*", VideoBitrateMode, "uint*", VideoBitrate, "uint*", VideoBitrateStepping, "uint*", VideoMethodID, "uint*", SignalSourceID, "uint*", SignalFormat, "ptr", SignalLock, "int*", SignalLevel, "uint*", SignalToNoiseRatio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

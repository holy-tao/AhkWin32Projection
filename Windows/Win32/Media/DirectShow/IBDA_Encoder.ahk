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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryCapabilities", "EnumAudioCapability", "EnumVideoCapability", "SetParameters", "GetState"]

    /**
     * 
     * @param {Pointer<Integer>} NumAudioFmts 
     * @param {Pointer<Integer>} NumVideoFmts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_encoder-querycapabilities
     */
    QueryCapabilities(NumAudioFmts, NumVideoFmts) {
        result := ComCall(3, this, "uint*", NumAudioFmts, "uint*", NumVideoFmts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FmtIndex 
     * @param {Pointer<Integer>} MethodID 
     * @param {Pointer<Integer>} AlgorithmType 
     * @param {Pointer<Integer>} SamplingRate 
     * @param {Pointer<Integer>} BitDepth 
     * @param {Pointer<Integer>} NumChannels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_encoder-enumaudiocapability
     */
    EnumAudioCapability(FmtIndex, MethodID, AlgorithmType, SamplingRate, BitDepth, NumChannels) {
        result := ComCall(4, this, "uint", FmtIndex, "uint*", MethodID, "uint*", AlgorithmType, "uint*", SamplingRate, "uint*", BitDepth, "uint*", NumChannels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FmtIndex 
     * @param {Pointer<Integer>} MethodID 
     * @param {Pointer<Integer>} AlgorithmType 
     * @param {Pointer<Integer>} VerticalSize 
     * @param {Pointer<Integer>} HorizontalSize 
     * @param {Pointer<Integer>} AspectRatio 
     * @param {Pointer<Integer>} FrameRateCode 
     * @param {Pointer<Integer>} ProgressiveSequence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_encoder-enumvideocapability
     */
    EnumVideoCapability(FmtIndex, MethodID, AlgorithmType, VerticalSize, HorizontalSize, AspectRatio, FrameRateCode, ProgressiveSequence) {
        result := ComCall(5, this, "uint", FmtIndex, "uint*", MethodID, "uint*", AlgorithmType, "uint*", VerticalSize, "uint*", HorizontalSize, "uint*", AspectRatio, "uint*", FrameRateCode, "uint*", ProgressiveSequence, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_encoder-setparameters
     */
    SetParameters(AudioBitrateMode, AudioBitrate, AudioMethodID, AudioProgram, VideoBitrateMode, VideoBitrate, VideoMethodID) {
        result := ComCall(6, this, "uint", AudioBitrateMode, "uint", AudioBitrate, "uint", AudioMethodID, "uint", AudioProgram, "uint", VideoBitrateMode, "uint", VideoBitrate, "uint", VideoMethodID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AudioBitrateMax 
     * @param {Pointer<Integer>} AudioBitrateMin 
     * @param {Pointer<Integer>} AudioBitrateMode 
     * @param {Pointer<Integer>} AudioBitrateStepping 
     * @param {Pointer<Integer>} AudioBitrate 
     * @param {Pointer<Integer>} AudioMethodID 
     * @param {Pointer<Integer>} AvailableAudioPrograms 
     * @param {Pointer<Integer>} AudioProgram 
     * @param {Pointer<Integer>} VideoBitrateMax 
     * @param {Pointer<Integer>} VideoBitrateMin 
     * @param {Pointer<Integer>} VideoBitrateMode 
     * @param {Pointer<Integer>} VideoBitrate 
     * @param {Pointer<Integer>} VideoBitrateStepping 
     * @param {Pointer<Integer>} VideoMethodID 
     * @param {Pointer<Integer>} SignalSourceID 
     * @param {Pointer<Integer>} SignalFormat 
     * @param {Pointer<BOOL>} SignalLock 
     * @param {Pointer<Integer>} SignalLevel 
     * @param {Pointer<Integer>} SignalToNoiseRatio 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_encoder-getstate
     */
    GetState(AudioBitrateMax, AudioBitrateMin, AudioBitrateMode, AudioBitrateStepping, AudioBitrate, AudioMethodID, AvailableAudioPrograms, AudioProgram, VideoBitrateMax, VideoBitrateMin, VideoBitrateMode, VideoBitrate, VideoBitrateStepping, VideoMethodID, SignalSourceID, SignalFormat, SignalLock, SignalLevel, SignalToNoiseRatio) {
        result := ComCall(7, this, "uint*", AudioBitrateMax, "uint*", AudioBitrateMin, "uint*", AudioBitrateMode, "uint*", AudioBitrateStepping, "uint*", AudioBitrate, "uint*", AudioMethodID, "uint*", AvailableAudioPrograms, "uint*", AudioProgram, "uint*", VideoBitrateMax, "uint*", VideoBitrateMin, "uint*", VideoBitrateMode, "uint*", VideoBitrate, "uint*", VideoBitrateStepping, "uint*", VideoMethodID, "uint*", SignalSourceID, "uint*", SignalFormat, "ptr", SignalLock, "int*", SignalLevel, "uint*", SignalToNoiseRatio, "HRESULT")
        return result
    }
}

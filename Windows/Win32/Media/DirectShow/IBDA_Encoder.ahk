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
     * Gets the number of encoding formats supported by the device.
     * @param {Pointer<Integer>} NumAudioFmts Receives the number of audio formats.
     * @param {Pointer<Integer>} NumVideoFmts Receives the number of video formats.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_encoder-querycapabilities
     */
    QueryCapabilities(NumAudioFmts, NumVideoFmts) {
        NumAudioFmtsMarshal := NumAudioFmts is VarRef ? "uint*" : "ptr"
        NumVideoFmtsMarshal := NumVideoFmts is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, NumAudioFmtsMarshal, NumAudioFmts, NumVideoFmtsMarshal, NumVideoFmts, "HRESULT")
        return result
    }

    /**
     * Gets one of the audio formats supported by the device.
     * @param {Integer} FmtIndex The zero-based index of the audio format to retrieve. To get the number of audio formats, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_encoder-querycapabilities">IBDA_Encoder::QueryCapabilities</a>.
     * @param {Pointer<Integer>} MethodID Receives a value that uniquely identifies this audio method.
     * @param {Pointer<Integer>} AlgorithmType Receives the type of encoding algorithm. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Audio_AlgorithmType_MPEG1LayerII"></a><a id="pbda_encoder_audio_algorithmtype_mpeg1layerii"></a><a id="PBDA_ENCODER_AUDIO_ALGORITHMTYPE_MPEG1LAYERII"></a><dl>
     * <dt><b>PBDA_Encoder_Audio_AlgorithmType_MPEG1LayerII</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPEG-1 Layer II.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Audio_AlgorithmType_AC3"></a><a id="pbda_encoder_audio_algorithmtype_ac3"></a><a id="PBDA_ENCODER_AUDIO_ALGORITHMTYPE_AC3"></a><dl>
     * <dt><b>PBDA_Encoder_Audio_AlgorithmType_AC3</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dolby AC3.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} SamplingRate Receives the audio sampling rate, in Hz.
     * @param {Pointer<Integer>} BitDepth Receives the number of bits per audio sample.
     * @param {Pointer<Integer>} NumChannels Receives the number of audio channels.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_encoder-enumaudiocapability
     */
    EnumAudioCapability(FmtIndex, MethodID, AlgorithmType, SamplingRate, BitDepth, NumChannels) {
        MethodIDMarshal := MethodID is VarRef ? "uint*" : "ptr"
        AlgorithmTypeMarshal := AlgorithmType is VarRef ? "uint*" : "ptr"
        SamplingRateMarshal := SamplingRate is VarRef ? "uint*" : "ptr"
        BitDepthMarshal := BitDepth is VarRef ? "uint*" : "ptr"
        NumChannelsMarshal := NumChannels is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", FmtIndex, MethodIDMarshal, MethodID, AlgorithmTypeMarshal, AlgorithmType, SamplingRateMarshal, SamplingRate, BitDepthMarshal, BitDepth, NumChannelsMarshal, NumChannels, "HRESULT")
        return result
    }

    /**
     * Gets one of the video formats supported by the device.
     * @param {Integer} FmtIndex The zero-based index of the video format to retrieve. To get the number of video formats, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_encoder-querycapabilities">IBDA_Encoder::QueryCapabilities</a>.
     * @param {Pointer<Integer>} MethodID Receives a value that uniquely identifies this video method.
     * @param {Pointer<Integer>} AlgorithmType Receives the type of encoding algorithm. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Video_MPEG2PartII"></a><a id="pbda_encoder_video_mpeg2partii"></a><a id="PBDA_ENCODER_VIDEO_MPEG2PARTII"></a><dl>
     * <dt><b>PBDA_Encoder_Video_MPEG2PartII</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPEG-2, Part 2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Video_MPEG4Part10"></a><a id="pbda_encoder_video_mpeg4part10"></a><a id="PBDA_ENCODER_VIDEO_MPEG4PART10"></a><dl>
     * <dt><b>PBDA_Encoder_Video_MPEG4Part10</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPEG-4, Part 10.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Video_AVC"></a><a id="pbda_encoder_video_avc"></a><a id="PBDA_ENCODER_VIDEO_AVC"></a><dl>
     * <dt><b>PBDA_Encoder_Video_AVC</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AVC video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_Video_H264"></a><a id="pbda_encoder_video_h264"></a><a id="PBDA_ENCODER_VIDEO_H264"></a><dl>
     * <dt><b>PBDA_Encoder_Video_H264</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * H.264 video.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} VerticalSize Receives the vertical_size_value field.
     * @param {Pointer<Integer>} HorizontalSize Receives the horizontal_size_value field.
     * @param {Pointer<Integer>} AspectRatio Receives the aspect_ratio_information field.
     * @param {Pointer<Integer>} FrameRateCode Receives the frame_rate_code field.
     * @param {Pointer<Integer>} ProgressiveSequence Receives the progressive_sequence field.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_encoder-enumvideocapability
     */
    EnumVideoCapability(FmtIndex, MethodID, AlgorithmType, VerticalSize, HorizontalSize, AspectRatio, FrameRateCode, ProgressiveSequence) {
        MethodIDMarshal := MethodID is VarRef ? "uint*" : "ptr"
        AlgorithmTypeMarshal := AlgorithmType is VarRef ? "uint*" : "ptr"
        VerticalSizeMarshal := VerticalSize is VarRef ? "uint*" : "ptr"
        HorizontalSizeMarshal := HorizontalSize is VarRef ? "uint*" : "ptr"
        AspectRatioMarshal := AspectRatio is VarRef ? "uint*" : "ptr"
        FrameRateCodeMarshal := FrameRateCode is VarRef ? "uint*" : "ptr"
        ProgressiveSequenceMarshal := ProgressiveSequence is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", FmtIndex, MethodIDMarshal, MethodID, AlgorithmTypeMarshal, AlgorithmType, VerticalSizeMarshal, VerticalSize, HorizontalSizeMarshal, HorizontalSize, AspectRatioMarshal, AspectRatio, FrameRateCodeMarshal, FrameRateCode, ProgressiveSequenceMarshal, ProgressiveSequence, "HRESULT")
        return result
    }

    /**
     * Sets the parameters for the Encoder Service.
     * @param {Integer} AudioBitrateMode The audio compression mode. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Constant"></a><a id="pbda_encoder_bitratemode_constant"></a><a id="PBDA_ENCODER_BITRATEMODE_CONSTANT"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Constant</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Constant bit rate (CBR) mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Variable"></a><a id="pbda_encoder_bitratemode_variable"></a><a id="PBDA_ENCODER_BITRATEMODE_VARIABLE"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Variable</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Variable bit rate (VBR) mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Average"></a><a id="pbda_encoder_bitratemode_average"></a><a id="PBDA_ENCODER_BITRATEMODE_AVERAGE"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Average</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Average bit rate (ABR) mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AudioBitrate The audio bit rate.
     * @param {Integer} AudioMethodID The active audio encoder method.
     * @param {Integer} AudioProgram The audio program number.
     * @param {Integer} VideoBitrateMode The video compression mode. For a list of values, see <i>AudioBitrateMode</i>.
     * @param {Integer} VideoBitrate The video bit rate.
     * @param {Integer} VideoMethodID The active video encoder method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_encoder-setparameters
     */
    SetParameters(AudioBitrateMode, AudioBitrate, AudioMethodID, AudioProgram, VideoBitrateMode, VideoBitrate, VideoMethodID) {
        result := ComCall(6, this, "uint", AudioBitrateMode, "uint", AudioBitrate, "uint", AudioMethodID, "uint", AudioProgram, "uint", VideoBitrateMode, "uint", VideoBitrate, "uint", VideoMethodID, "HRESULT")
        return result
    }

    /**
     * Queries the current state of the Encoder Service.
     * @param {Pointer<Integer>} AudioBitrateMax Receives the maximum audio bit rate.
     * @param {Pointer<Integer>} AudioBitrateMin Receives the minimum audio bit rate.
     * @param {Pointer<Integer>} AudioBitrateMode Receives the audio compression mode. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Constant"></a><a id="pbda_encoder_bitratemode_constant"></a><a id="PBDA_ENCODER_BITRATEMODE_CONSTANT"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Constant</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Constant bit rate (CBR) mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Variable"></a><a id="pbda_encoder_bitratemode_variable"></a><a id="PBDA_ENCODER_BITRATEMODE_VARIABLE"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Variable</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Variable bit rate (VBR) mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_Encoder_BitrateMode_Average"></a><a id="pbda_encoder_bitratemode_average"></a><a id="PBDA_ENCODER_BITRATEMODE_AVERAGE"></a><dl>
     * <dt><b>PBDA_Encoder_BitrateMode_Average</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Average bit rate (ABR) mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} AudioBitrateStepping Receives the minimum increment for the audio bit rate.
     * @param {Pointer<Integer>} AudioBitrate Receives the audio bit rate.
     * @param {Pointer<Integer>} AudioMethodID Receives the active audio encoder method.
     * @param {Pointer<Integer>} AvailableAudioPrograms Receives the number of audio programs available to the encoder.
     * @param {Pointer<Integer>} AudioProgram Receives the program number of the audio program that is currently being encoded.
     * @param {Pointer<Integer>} VideoBitrateMax Receives the maximum video bit rate.
     * @param {Pointer<Integer>} VideoBitrateMin Receives the minimum video bit rate.
     * @param {Pointer<Integer>} VideoBitrateMode Receives the video compression mode. For a list of values, see <i>AudioBitrateMode</i>.
     * @param {Pointer<Integer>} VideoBitrate Receives the video bit rate.
     * @param {Pointer<Integer>} VideoBitrateStepping Receives the minimum increment for the video bit rate.
     * @param {Pointer<Integer>} VideoMethodID Receives the active video encoder method.
     * @param {Pointer<Integer>} SignalSourceID Receives the identifier of the signal source. The value is an auxiliary connector ID, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_aux-enumcapability">IBDA_AUX::EnumCapability</a>  method.
     * @param {Pointer<Integer>} SignalFormat Receives a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration. This value specifies the analog video standard that is received on the auxiliary input.
     * @param {Pointer<BOOL>} SignalLock Receives the value <b>TRUE</b> if the device has a signal lock, and <b>FALSE</b> otherwise.
     * @param {Pointer<Integer>} SignalLevel Receives the signal level in decibels.
     * @param {Pointer<Integer>} SignalToNoiseRatio Receives a value between 0 and 100, indicating the signal-to-noise ratio.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_encoder-getstate
     */
    GetState(AudioBitrateMax, AudioBitrateMin, AudioBitrateMode, AudioBitrateStepping, AudioBitrate, AudioMethodID, AvailableAudioPrograms, AudioProgram, VideoBitrateMax, VideoBitrateMin, VideoBitrateMode, VideoBitrate, VideoBitrateStepping, VideoMethodID, SignalSourceID, SignalFormat, SignalLock, SignalLevel, SignalToNoiseRatio) {
        AudioBitrateMaxMarshal := AudioBitrateMax is VarRef ? "uint*" : "ptr"
        AudioBitrateMinMarshal := AudioBitrateMin is VarRef ? "uint*" : "ptr"
        AudioBitrateModeMarshal := AudioBitrateMode is VarRef ? "uint*" : "ptr"
        AudioBitrateSteppingMarshal := AudioBitrateStepping is VarRef ? "uint*" : "ptr"
        AudioBitrateMarshal := AudioBitrate is VarRef ? "uint*" : "ptr"
        AudioMethodIDMarshal := AudioMethodID is VarRef ? "uint*" : "ptr"
        AvailableAudioProgramsMarshal := AvailableAudioPrograms is VarRef ? "uint*" : "ptr"
        AudioProgramMarshal := AudioProgram is VarRef ? "uint*" : "ptr"
        VideoBitrateMaxMarshal := VideoBitrateMax is VarRef ? "uint*" : "ptr"
        VideoBitrateMinMarshal := VideoBitrateMin is VarRef ? "uint*" : "ptr"
        VideoBitrateModeMarshal := VideoBitrateMode is VarRef ? "uint*" : "ptr"
        VideoBitrateMarshal := VideoBitrate is VarRef ? "uint*" : "ptr"
        VideoBitrateSteppingMarshal := VideoBitrateStepping is VarRef ? "uint*" : "ptr"
        VideoMethodIDMarshal := VideoMethodID is VarRef ? "uint*" : "ptr"
        SignalSourceIDMarshal := SignalSourceID is VarRef ? "uint*" : "ptr"
        SignalFormatMarshal := SignalFormat is VarRef ? "uint*" : "ptr"
        SignalLockMarshal := SignalLock is VarRef ? "int*" : "ptr"
        SignalLevelMarshal := SignalLevel is VarRef ? "int*" : "ptr"
        SignalToNoiseRatioMarshal := SignalToNoiseRatio is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, AudioBitrateMaxMarshal, AudioBitrateMax, AudioBitrateMinMarshal, AudioBitrateMin, AudioBitrateModeMarshal, AudioBitrateMode, AudioBitrateSteppingMarshal, AudioBitrateStepping, AudioBitrateMarshal, AudioBitrate, AudioMethodIDMarshal, AudioMethodID, AvailableAudioProgramsMarshal, AvailableAudioPrograms, AudioProgramMarshal, AudioProgram, VideoBitrateMaxMarshal, VideoBitrateMax, VideoBitrateMinMarshal, VideoBitrateMin, VideoBitrateModeMarshal, VideoBitrateMode, VideoBitrateMarshal, VideoBitrate, VideoBitrateSteppingMarshal, VideoBitrateStepping, VideoMethodIDMarshal, VideoMethodID, SignalSourceIDMarshal, SignalSourceID, SignalFormatMarshal, SignalFormat, SignalLockMarshal, SignalLock, SignalLevelMarshal, SignalLevel, SignalToNoiseRatioMarshal, SignalToNoiseRatio, "HRESULT")
        return result
    }
}

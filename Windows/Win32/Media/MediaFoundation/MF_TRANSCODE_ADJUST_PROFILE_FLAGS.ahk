#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the profile flags that are set in the MF_TRANSCODE_ADJUST_PROFILE attribute.
 * @remarks
 * If the <b>MF_TRANSCODE_ADJUST_PROFILE_DEFAULT</b> flag is specified, the following changes are made for the video stream:
  * 
  * <ul>
  * <li>If the frame rate of the media source specified in the <i>pSrc</i> parameter of  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodetopology">MFCreateTranscodeTopology</a> and the frame rate specified by the application in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-attribute">MF_MT_FRAME_RATE</a> attribute differ by less than 1/1000, the profile uses the media source frame rate. This is because the pipeline considers the difference to be negligible.</li>
  * <li>If the application does not specify an interlaced mode by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-interlace-mode-attribute">MF_MT_INTERLACE_MODE</a> attribute, the profile is changed to use progressive frames.</li>
  * </ul>
  * The <b>MF_TRANSCODE_ADJUST_PROFILE_DEFAULT</b> flag must be accompanied with the required audio and video stream attributes provided by the application. For the audio stream, the required attributes are as follows:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-num-channels-attribute">MF_MT_AUDIO_NUM_CHANNELS</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-samples-per-second-attribute">MF_MT_AUDIO_SAMPLES_PER_SECOND</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-block-alignment-attribute">MF_MT_AUDIO_BLOCK_ALIGNMENT</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-avg-bytes-per-second-attribute">MF_MT_AUDIO_AVG_BYTES_PER_SECOND</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-bits-per-sample-attribute">MF_MT_AUDIO_BITS_PER_SAMPLE</a>
  * </li>
  * </ul>
  *  For the video stream, the required attributes are as follows:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-attribute">MF_MT_FRAME_RATE</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-size-attribute">MF_MT_FRAME_SIZE</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-avg-bitrate-attribute">MF_MT_AVG_BITRATE</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pixel-aspect-ratio-attribute">MF_MT_PIXEL_ASPECT_RATIO</a>
  * </li>
  * </ul>
  *   If these attributes are not set, <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodetopology">MFCreateTranscodeTopology</a> creates the topology but Media Session fails to generate the encoded file. The failure code depends on the MFT node in the topology. For example, if the application does not set the frame size, the WMV encoder fails to encode the content and application gets the MF_E_INVALIDMEDIATYPE error code through the Media Session.  
  * 
  * Use the <b>MF_TRANSCODE_ADJUST_PROFILE_USE_SOURCE_ATTRIBUTES</b> flag when you want to transcode the file by using the input stream attributes. The input source stream attributes are copied to the output media type before the MFT node is inserted in the topology. If you set additional stream attributes, this flag does not overwrite the set values. Only the missing attributes are filled with the input source's attribute values. This flag is useful in remux scenario where you want to generate the output file in the same format as the input source. If you want to perform format conversion, make sure you set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a>  attribute for the stream to specify the encoder that topology builder must use. The transform node is added in the topology unless <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-donot-insert-encoder">MF_TRANSCODE_DONOT_INSERT_ENCODER</a> is set. In this case, and the content is not encoded. Instead, if permitted by the container, the content is embedded in the specified container. 
  * 
  * For example, assume that your input source is an MP3 file.  You set the container to be <b>MFTranscodeContainerType_ASF</b>, you do not set any stream attributes, and you set the <b>MF_TRANSCODE_ADJUST_PROFILE_USE_SOURCE_ATTRIBUTES</b> flag. In this case, the generated output file is an ASF file (.wma)  containing MP3 media data. Note that if you use this flag, certain input stream attributes and the container type might not be compatible.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_transcode_adjust_profile_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TRANSCODE_ADJUST_PROFILE_FLAGS{

    /**
     * Media Foundation uses the application-specified settings for audio and video streams. If the required settings are not provided by the application, the topology is created but the encoding session fails. For the video stream, the frame rate and the interlace mode settings are modified. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static MF_TRANSCODE_ADJUST_PROFILE_DEFAULT => 0

    /**
     * For both audio and video streams, the missing stream settings are filled by copying the input source attributes. This flag ensures the transcoded output file is the closest match to the input file.
     * @type {Integer (Int32)}
     */
    static MF_TRANSCODE_ADJUST_PROFILE_USE_SOURCE_ATTRIBUTES => 1
}

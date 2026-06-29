#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies audio stream options for calls to ActivateSpatialAudioStream.
 * @remarks
 * This enumeration value is used by the version 2 structures for spatial audio activation parameters.
 * 
 * - <xref:NS:spatialaudioclient.SpatialAudioObjectRenderStreamActivationParams2>
 * - <xref:NS:spatialaudiohrtf.SpatialAudioHrtfActivationParams2>
 * - <xref:NS:spatialaudiometadata.SpatialAudioObjectRenderStreamForMetadataActivationParams2>
 * -
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ne-spatialaudioclient-spatial_audio_stream_options
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SPATIAL_AUDIO_STREAM_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No stream options.
     * @type {Integer (Int32)}
     */
    static SPATIAL_AUDIO_STREAM_OPTIONS_NONE => 0

    /**
     * The stream should support audio offloading. For more information, see <xref:NN:spatialaudioclient.ISpatialAudioClient2>.
     * @type {Integer (Int32)}
     */
    static SPATIAL_AUDIO_STREAM_OPTIONS_OFFLOAD => 1
}

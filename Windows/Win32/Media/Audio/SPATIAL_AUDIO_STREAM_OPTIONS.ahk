#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 * @version v4.0.30319
 */
class SPATIAL_AUDIO_STREAM_OPTIONS extends Win32BitflagEnum{

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

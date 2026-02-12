#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that the audio decoder degraded an [AudioTrack](audiotrack.md).
 * @remarks
 * Get the **AudioDecoderDegradation** value for an audio track by checking the [DegradationReason](audiotracksupportinfo_degradationreason.md) property of the track's [SupportInfo](audiotrack_supportinfo.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiodecoderdegradationreason
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioDecoderDegradationReason extends Win32Enum{

    /**
     * No reason is specified or no audio degradation has been applied to the track.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The audio track was degraded due to a licensing requirement.
     * @type {Integer (Int32)}
     */
    static LicensingRequirement => 1

    /**
     * The audio track was degraded because the device does not support spatial audio.
     * @type {Integer (Int32)}
     */
    static SpatialAudioNotSupported => 2
}

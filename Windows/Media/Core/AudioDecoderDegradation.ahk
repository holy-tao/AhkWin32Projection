#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of degredation, if any, applied to an [AudioTrack](audiotrack.md) by the audio decoder.
 * @remarks
 * Get the **AudioDecoderDegradation** value for an audio track by checking the [Degradation](audiotracksupportinfo_degradation.md) property of the track's [SupportInfo](audiotrack_supportinfo.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiodecoderdegradation
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioDecoderDegradation extends Win32Enum{

    /**
     * The audio track is not degraded and is played as encoded.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The audio track is downmixed from the number of channels in the encoding to two channels.
     * @type {Integer (Int32)}
     */
    static DownmixTo2Channels => 1

    /**
     * The audio track is downmixed from the number of channels in the encoding to six channels.
     * @type {Integer (Int32)}
     */
    static DownmixTo6Channels => 2

    /**
     * The audio track is downmixed from the number of channels in the encoding to eight channels.
     * @type {Integer (Int32)}
     */
    static DownmixTo8Channels => 3
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ne-spatialaudioclient-spatial_audio_stream_options
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SPATIAL_AUDIO_STREAM_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SPATIAL_AUDIO_STREAM_OPTIONS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPATIAL_AUDIO_STREAM_OPTIONS_OFFLOAD => 1
}

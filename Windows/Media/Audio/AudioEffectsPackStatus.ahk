#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported and enabled status of an audio effects pack and audio endpoint represented by an [AudioEffectsPackConfiguration](xref:Windows.Media.Audio.AudioEffectsPackConfiguration) object.
 * @remarks
 * This enumeration is used by the [AudioEffectsPackConfiguration.Status](xref:Windows.Media.Audio.AudioEffectsPackConfiguration.Status) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioEffectsPackStatus extends Win32Enum{

    /**
     * The audio effects pack is supported, but not enabled for the associated audio endpoint.
     * @type {Integer (Int32)}
     */
    static NotEnabled => 0

    /**
     * The audio effects pack is supported and enabled for the associated audio endpoint.
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * The audio effects pack is not supported for the associated audio endpoint.
     * @type {Integer (Int32)}
     */
    static NotSupported => 2
}

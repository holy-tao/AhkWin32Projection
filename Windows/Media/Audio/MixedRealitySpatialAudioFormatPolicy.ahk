#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies which policy to use when picking a spatial audio format in mixed reality.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.mixedrealityspatialaudioformatpolicy
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class MixedRealitySpatialAudioFormatPolicy extends Win32Enum{

    /**
     * Use the system defined default for Mixed Reality.
     * @type {Integer (Int32)}
     */
    static UseMixedRealityDefaultSpatialAudioFormat => 0

    /**
     * Use the device configuration's default.
     * @type {Integer (Int32)}
     */
    static UseDeviceConfigurationDefaultSpatialAudioFormat => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies settings flags for the creation of an [AudioNodeEmitter](audionodeemitter.md).
 * @remarks
 * Set the emitter settings by calling the overloaded [AudioNodeEmitter constructor](audionodeemitter_audionodeemitter_695720720.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittersettings
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterSettings extends Win32BitflagEnum{

    /**
     * No settings.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Processing of Doppler effects based on the [DopplerVelocity](audionodeemitter_dopplervelocity.md) of the emitter is disabled.
     * @type {Integer (UInt32)}
     */
    static DisableDoppler => 1
}

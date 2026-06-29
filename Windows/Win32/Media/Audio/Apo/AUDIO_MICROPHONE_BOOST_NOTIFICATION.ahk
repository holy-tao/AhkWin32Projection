#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents an audio microphone boost APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_microphone_boost_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_MICROPHONE_BOOST_NOTIFICATION {
    #StructPack 8

    /**
     * An [IMMDevice](..//mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     */
    endpoint : IMMDevice

    /**
     * A GUID representing the context associated with the originator of the event. A client can use this method to keep track of control changes made by other processes and by the hardware. The functions [IAudioVolumeLevel::SetLevel](../devicetopology/nf-devicetopology-iperchanneldblevel-setlevel.md) and [IAudioMute::SetMute](../devicetopology/nf-devicetopology-iaudiomute-setmute) use the context. When this notification is recieved, a client can inspect the context GUID to discover whether it or another client is the source of the notification.
     */
    eventContext : Guid

    /**
     * A boolean value indicating the presence of a "Microphone Boost" part (connector or subunit) of an audio capture device topology.
     */
    microphoneBoostEnabled : BOOL

    /**
     * A float value specifying the volume level in decibels.
     */
    levelInDb : Float32

    /**
     * A float value specifying the minimum volume level in decibels.
     */
    levelMinInDb : Float32

    /**
     * A float value specifying the maximum volume level in decibels.
     */
    levelMaxInDb : Float32

    /**
     * A float value specifying the stepping value between consecutive volume levels in the range *levelMinInDb* to *levelMaxInDb*.
     */
    levelStepInDb : Float32

    /**
     * A boolean value indicating if the IAudioMute interface is supported by the "Microphone Boost" part of the audio capture device topology.
     */
    muteSupported : BOOL

    /**
     * A boolean value indicating the current state (enabled or disabled) of the mute control
     */
    mute : BOOL

}

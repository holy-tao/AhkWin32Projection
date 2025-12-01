#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an audio microphone boost APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_microphone_boost_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_MICROPHONE_BOOST_NOTIFICATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An [IMMDevice](..//mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     * @type {IMMDevice}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A GUID representing the context associated with the originator of the event. A client can use this method to keep track of control changes made by other processes and by the hardware. The functions [IAudioVolumeLevel::SetLevel](../devicetopology/nf-devicetopology-iperchanneldblevel-setlevel.md) and [IAudioMute::SetMute](../devicetopology/nf-devicetopology-iaudiomute-setmute) use the context. When this notification is recieved, a client can inspect the context GUID to discover whether it or another client is the source of the notification.
     * @type {Pointer<Guid>}
     */
    eventContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A boolean value indicating the presence of a "Microphone Boost" part (connector or subunit) of an audio capture device topology.
     * @type {BOOL}
     */
    microphoneBoostEnabled {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A float value specifying the volume level in decibels.
     * @type {Float}
     */
    levelInDb {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * A float value specifying the minimum volume level in decibels.
     * @type {Float}
     */
    levelMinInDb {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * A float value specifying the maximum volume level in decibels.
     * @type {Float}
     */
    levelMaxInDb {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * A float value specifying the stepping value between consecutive volume levels in the range *levelMinInDb* to *levelMaxInDb*.
     * @type {Float}
     */
    levelStepInDb {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * A boolean value indicating if the IAudioMute interface is supported by the "Microphone Boost" part of the audio capture device topology.
     * @type {BOOL}
     */
    muteSupported {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A boolean value indicating the current state (enabled or disabled) of the mute control
     * @type {BOOL}
     */
    mute {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}

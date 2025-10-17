#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AUDIO_VOLUME_NOTIFICATION_DATA structure describes a change in the volume level or muting state of an audio endpoint device.
 * @remarks
 * 
  * This structure is used by the <b>IAudioEndpointVolumeCallback::OnNotify</b> method.
  * 
  * A client can register to be notified when the volume level or muting state of an endpoint device changes. The following methods can cause such a change:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevel">IAudioEndpointVolume::SetChannelVolumeLevel</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevelscalar">IAudioEndpointVolume::SetChannelVolumeLevelScalar</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevel">IAudioEndpointVolume::SetMasterVolumeLevel</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevelscalar">IAudioEndpointVolume::SetMasterVolumeLevelScalar</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmute">IAudioEndpointVolume::SetMute</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepdown">IAudioEndpointVolume::VolumeStepDown</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepup">IAudioEndpointVolume::VolumeStepUp</a>
  * </li>
  * </ul>
  * When a call to one of these methods causes a volume-change event (that is, a change in the volume level or muting state), the method sends notifications to all clients that have registered to receive them. The method notifies a client by calling the client's <b>IAudioEndpointVolumeCallback::OnNotify</b> method. Through the <b>OnNotify</b> call, the client receives a pointer to an <b>AUDIO_VOLUME_NOTIFICATION_DATA</b> structure that describes the change.
  * 
  * Each of the methods in the preceding list accepts an input parameter named <i>pguidEventContext</i>, which is a pointer to an event-context GUID. Before sending notifications to clients, the method copies the event-context GUID pointed to by <i>pguidEventContext</i> into the <b>guidEventContext</b> member of the <b>AUDIO_VOLUME_NOTIFICATION_DATA</b> structure that it supplies to clients through their <b>OnNotify</b> methods. If <i>pguidEventContext</i> is <b>NULL</b>, the value of the <b>guidEventContext</b> member is set to GUID_NULL.
  * 
  * In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID from that call to discover whether it or another client is the source of the volume-change event.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/ns-endpointvolume-audio_volume_notification_data
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_VOLUME_NOTIFICATION_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This member is the value of the event-context GUID that was provided as an input parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a> method call that changed the endpoint volume level or muting state. For more information, see Remarks.
     * @type {Pointer<Guid>}
     */
    guidEventContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies whether the audio stream is currently muted. If <b>bMuted</b> is <b>TRUE</b>, the stream is muted. If <b>FALSE</b>, the stream is not muted.
     * @type {BOOL}
     */
    bMuted {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the current master volume level of the audio stream. The volume level is normalized to the range from 0.0 to 1.0, where 0.0 is the minimum volume level and 1.0 is the maximum level. Within this range, the relationship of the normalized volume level to the attenuation of signal amplitude is described by a nonlinear, audio-tapered curve. For more information about audio tapers, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-tapered-volume-controls">Audio-Tapered Volume Controls</a>.
     * @type {Float}
     */
    fMasterVolume {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Specifies the number of channels in the audio stream, which is also the number of elements in the <b>afChannelVolumes</b> array. If the audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>-1. The volume level for a particular channel is contained in the array element whose index matches the channel number.
     * @type {Integer}
     */
    nChannels {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The first element in an array of channel volumes. This element contains the current volume level of channel 0 in the audio stream. If the audio stream contains more than one channel, the volume levels for the additional channels immediately follow the <b>AUDIO_VOLUME_NOTIFICATION_DATA</b> structure. The volume level for each channel is normalized to the range from 0.0 to 1.0, where 0.0 is the minimum volume level and 1.0 is the maximum level. Within this range, the relationship of the normalized volume level to the attenuation of signal amplitude is described by a nonlinear, audio-tapered curve.
     * @type {Array<Single>}
     */
    afChannelVolumes{
        get {
            if(!this.HasProp("__afChannelVolumesProxyArray"))
                this.__afChannelVolumesProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "float")
            return this.__afChannelVolumesProxyArray
        }
    }
}

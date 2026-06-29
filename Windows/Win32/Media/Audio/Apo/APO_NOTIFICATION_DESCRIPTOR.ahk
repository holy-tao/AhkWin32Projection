#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR.ahk" { AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR }
#Import ".\AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR.ahk" { AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR }
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import ".\APO_NOTIFICATION_TYPE.ahk" { APO_NOTIFICATION_TYPE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR.ahk" { AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR }
#Import ".\AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR.ahk" { AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR }

/**
 * Specifies a requested APO notification.
 * @remarks
 * Return this structure from an implementation of[IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md) or [IAudioProcessingObjectNotifications2::GetApoNotificationRegistrationInfo2](nf-audioengineextensionapo-iaudioprocessingobjectnotifications2-getaponotificationregistrationinfo2.md) to specify a requested APO notifications.
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-apo_notification_descriptor
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_NOTIFICATION_DESCRIPTOR {
    #StructPack 8

    /**
     * A value from the [APO_NOTIFICATION_TYPE](ne-audioengineextensionapo-apo_notification_type.md) enumeration
     */
    type : APO_NOTIFICATION_TYPE

    audioEndpointVolume : AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR

    static __New() {
        DefineProp(this.Prototype, 'audioEndpointPropertyChange', { type: AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR, offset: 8 })
        DefineProp(this.Prototype, 'audioSystemEffectsPropertyChange', { type: AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR, offset: 8 })
        DefineProp(this.Prototype, 'audioMicrophoneBoost', { type: AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR, offset: 8 })
        this.DeleteProp("__New")
    }
}

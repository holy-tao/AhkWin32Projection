#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION.ahk" { AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\AUDIO_VOLUME_NOTIFICATION_DATA.ahk" { AUDIO_VOLUME_NOTIFICATION_DATA }
#Import ".\AUDIO_VOLUME_NOTIFICATION_DATA2.ahk" { AUDIO_VOLUME_NOTIFICATION_DATA2 }
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import ".\AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION.ahk" { AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION }
#Import ".\AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION.ahk" { AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION }
#Import ".\AUDIO_MICROPHONE_BOOST_NOTIFICATION.ahk" { AUDIO_MICROPHONE_BOOST_NOTIFICATION }
#Import ".\DEVICE_ORIENTATION_TYPE.ahk" { DEVICE_ORIENTATION_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE.ahk" { AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE }
#Import ".\AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2.ahk" { AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2 }
#Import ".\AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION.ahk" { AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION }
#Import ".\APO_NOTIFICATION_TYPE.ahk" { APO_NOTIFICATION_TYPE }

/**
 * Represents a notification for a change to an APO endpoint or system effects.
 * @remarks
 * Register for the types of notifications you want to receive by implementing [IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md). Receive the registered notifications by implementing [IAudioProcessingObjectNotifications::HandleNotification](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-handlenotification.md).
 * 
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-apo_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_NOTIFICATION {
    #StructPack 8

    /**
     * A value from the [APO_NOTIFICATION_TYPE](ne-audioengineextensionapo-apo_notification_type.md) enumeration specifying the type of change the notification represents.
     */
    type : APO_NOTIFICATION_TYPE

    audioEndpointVolumeChange : AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION

    static __New() {
        DefineProp(this.Prototype, 'audioEndpointPropertyChange', { type: AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'audioSystemEffectsPropertyChange', { type: AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'audioEndpointVolumeChange2', { type: AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2, offset: 8 })
        DefineProp(this.Prototype, 'deviceOrientation', { type: DEVICE_ORIENTATION_TYPE, offset: 8 })
        DefineProp(this.Prototype, 'audioMicrophoneBoostChange', { type: AUDIO_MICROPHONE_BOOST_NOTIFICATION, offset: 8 })
        DefineProp(this.Prototype, 'audioEnvironmentChange', { type: AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION, offset: 8 })
        this.DeleteProp("__New")
    }
}

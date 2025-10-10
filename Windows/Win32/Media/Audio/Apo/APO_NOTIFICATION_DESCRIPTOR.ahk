#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR.ahk
#Include .\AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR.ahk
#Include .\AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR.ahk
#Include .\AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_NOTIFICATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR}
     */
    audioEndpointVolume{
        get {
            if(!this.HasProp("__audioEndpointVolume"))
                this.__audioEndpointVolume := AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR(this.ptr + 8)
            return this.__audioEndpointVolume
        }
    }

    /**
     * @type {AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR}
     */
    audioEndpointPropertyChange{
        get {
            if(!this.HasProp("__audioEndpointPropertyChange"))
                this.__audioEndpointPropertyChange := AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR(this.ptr + 8)
            return this.__audioEndpointPropertyChange
        }
    }

    /**
     * @type {AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR}
     */
    audioSystemEffectsPropertyChange{
        get {
            if(!this.HasProp("__audioSystemEffectsPropertyChange"))
                this.__audioSystemEffectsPropertyChange := AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR(this.ptr + 8)
            return this.__audioSystemEffectsPropertyChange
        }
    }

    /**
     * @type {AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR}
     */
    audioMicrophoneBoost{
        get {
            if(!this.HasProp("__audioMicrophoneBoost"))
                this.__audioMicrophoneBoost := AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR(this.ptr + 8)
            return this.__audioMicrophoneBoost
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include .\AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION.ahk
#Include .\AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION.ahk
#Include .\AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\AUDIO_MICROPHONE_BOOST_NOTIFICATION.ahk
#Include .\AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_NOTIFICATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION}
     */
    audioEndpointVolumeChange{
        get {
            if(!this.HasProp("__audioEndpointVolumeChange"))
                this.__audioEndpointVolumeChange := AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION(this.ptr + 8)
            return this.__audioEndpointVolumeChange
        }
    }

    /**
     * @type {AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION}
     */
    audioEndpointPropertyChange{
        get {
            if(!this.HasProp("__audioEndpointPropertyChange"))
                this.__audioEndpointPropertyChange := AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION(this.ptr + 8)
            return this.__audioEndpointPropertyChange
        }
    }

    /**
     * @type {AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION}
     */
    audioSystemEffectsPropertyChange{
        get {
            if(!this.HasProp("__audioSystemEffectsPropertyChange"))
                this.__audioSystemEffectsPropertyChange := AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION(this.ptr + 8)
            return this.__audioSystemEffectsPropertyChange
        }
    }

    /**
     * @type {AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2}
     */
    audioEndpointVolumeChange2{
        get {
            if(!this.HasProp("__audioEndpointVolumeChange2"))
                this.__audioEndpointVolumeChange2 := AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2(this.ptr + 8)
            return this.__audioEndpointVolumeChange2
        }
    }

    /**
     * @type {Integer}
     */
    deviceOrientation {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {AUDIO_MICROPHONE_BOOST_NOTIFICATION}
     */
    audioMicrophoneBoostChange{
        get {
            if(!this.HasProp("__audioMicrophoneBoostChange"))
                this.__audioMicrophoneBoostChange := AUDIO_MICROPHONE_BOOST_NOTIFICATION(this.ptr + 8)
            return this.__audioMicrophoneBoostChange
        }
    }

    /**
     * @type {AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION}
     */
    audioEnvironmentChange{
        get {
            if(!this.HasProp("__audioEnvironmentChange"))
                this.__audioEnvironmentChange := AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION(this.ptr + 8)
            return this.__audioEnvironmentChange
        }
    }
}

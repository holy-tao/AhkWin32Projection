#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * Represents a system audio effect APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffects_property_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     * @type {IMMDevice}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A GUID identifying the APO property store associated with the notification.
     * @type {Pointer<Guid>}
     */
    propertyStoreContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value from the [AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE](../mmdeviceapi/ne-mmdeviceapi-audio_systemeffects_propertystore_type.md) enumeration specifying the type of the property store associated with the notification.
     * @type {Integer}
     */
    propertyStoreType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * An [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) representing the property store associated with the notification.
     * @type {IPropertyStore}
     */
    propertyStore {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A [PROPERTYKEY](/windows/win32/api/wtypes/ns-wtypes-propertykey) structure identifying the property associated with the notification.
     * @type {PROPERTYKEY}
     */
    propertyKey{
        get {
            if(!this.HasProp("__propertyKey"))
                this.__propertyKey := PROPERTYKEY(32, this)
            return this.__propertyKey
        }
    }
}

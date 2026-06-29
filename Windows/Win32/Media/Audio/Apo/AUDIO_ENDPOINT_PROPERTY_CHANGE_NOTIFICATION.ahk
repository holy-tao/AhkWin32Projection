#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a property change APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_endpoint_property_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION {
    #StructPack 8

    /**
     * An [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     */
    endpoint : IMMDevice

    /**
     * An [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) representing the property store associated with the notification.
     */
    propertyStore : IPropertyStore

    /**
     * A [PROPERTYKEY](/windows/win32/api/wtypes/ns-wtypes-propertykey) structure identifying the property associated with the notification.
     */
    propertyKey : PROPERTYKEY

}

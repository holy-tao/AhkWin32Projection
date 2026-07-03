#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION {
    #StructPack 8

    propertyStore : IPropertyStore

    propertyKey : PROPERTYKEY

}

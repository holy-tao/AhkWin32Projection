#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APO_REFERENCE_STREAM_PROPERTIES.ahk" { APO_REFERENCE_STREAM_PROPERTIES }
#Import ".\APOInitBaseStruct.ahk" { APOInitBaseStruct }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\IMMDeviceCollection.ahk" { IMMDeviceCollection }
#Import "..\..\..\System\Com\IServiceProvider.ahk" { IServiceProvider }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APOInitSystemEffects3.ahk" { APOInitSystemEffects3 }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AcousticEchoCanceller_Reference_Input {
    #StructPack 8

    apoInitSystemEffects : APOInitSystemEffects3

    streamProperties : APO_REFERENCE_STREAM_PROPERTIES

}

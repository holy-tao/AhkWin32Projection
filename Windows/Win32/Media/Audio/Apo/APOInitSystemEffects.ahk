#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APOInitBaseStruct.ahk" { APOInitBaseStruct }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\IMMDeviceCollection.ahk" { IMMDeviceCollection }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The APOInitSystemEffects structure gets passed to the system effects APO for initialization.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APOInitSystemEffects {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct">APOInitBaseStruct</a> structure.
     */
    APOInit : APOInitBaseStruct

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     */
    pAPOEndpointProperties : IPropertyStore

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     */
    pAPOSystemEffectsProperties : IPropertyStore

    /**
     * Reserved for future use.
     */
    pReserved : IntPtr

    /**
     * A pointer to an IMMDeviceCollection object.
     */
    pDeviceCollection : IMMDeviceCollection

}

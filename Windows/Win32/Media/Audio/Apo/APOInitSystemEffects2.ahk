#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APOInitBaseStruct.ahk" { APOInitBaseStruct }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\IMMDeviceCollection.ahk" { IMMDeviceCollection }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The APOInitSystemEffects2 structure was introduced with Windows 8.1, to make it possible to provide additional initialization context to the audio processing object (APO) for initialization.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects2
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APOInitSystemEffects2 {
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
     * A pointer to an IMMDeviceCollection object. The last item in the *pDeviceCollection* is always the [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint.
     */
    pDeviceCollection : IMMDeviceCollection

    /**
     * Specifies the MMDevice that implements the DeviceTopology that includes the software connector for which the APO is initializing. The MMDevice is contained in <i>pDeviceCollection</i>.
     */
    nSoftwareIoDeviceInCollection : UInt32

    /**
     * Specifies the index of a Software_IO connector in the DeviceTopology.
     */
    nSoftwareIoConnectorIndex : UInt32

    /**
     * Specifies the processing mode for the audio graph.
     */
    AudioProcessingMode : Guid

    /**
     * Indicates whether the audio system is initializing the APO for effects discovery only.
     */
    InitializeForDiscoveryOnly : BOOL

}

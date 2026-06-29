#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APOInitBaseStruct.ahk" { APOInitBaseStruct }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\IMMDeviceCollection.ahk" { IMMDeviceCollection }
#Import "..\..\..\System\Com\IServiceProvider.ahk" { IServiceProvider }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides APO initialization parameters, extending APOInitSystemEffects2 to add the ability to specify a service provider for logging.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-apoinitsystemeffects3
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APOInitSystemEffects3 {
    #StructPack 8

    /**
     * An [APOInitBaseStruct](../audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct) structure.
     */
    APOInit : APOInitBaseStruct

    /**
     * A pointer to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) object.
     */
    pAPOEndpointProperties : IPropertyStore

    /**
     * An [IServiceProvider](../servprov/nn-servprov-iserviceprovider.md) interface.
     */
    pServiceProvider : IServiceProvider

    /**
     * A pointer to an [IMMDeviceCollection](../mmdeviceapi/nn-mmdeviceapi-immdevicecollection.md) object. The last item in the *pDeviceCollection* is always the [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint.
     */
    pDeviceCollection : IMMDeviceCollection

    /**
     * Specifies the **MMDevice** that implements the DeviceTopology that includes the software connector for which the APO is initializing. The **MMDevice** is contained in *pDeviceCollection*.
     */
    nSoftwareIoDeviceInCollection : UInt32

    /**
     * Specifies the index of a **Software_IO** connector in the [DeviceTopology](../devicetopology/nn-devicetopology-idevicetopology.md).
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

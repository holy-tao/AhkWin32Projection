#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitBaseStruct.ahk

/**
 * Provides APO initialization parameters, extending APOInitSystemEffects2 to add the ability to specify a service provider for logging.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-apoinitsystemeffects3
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APOInitSystemEffects3 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An [APOInitBaseStruct](../audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct) structure.
     * @type {APOInitBaseStruct}
     */
    APOInit{
        get {
            if(!this.HasProp("__APOInit"))
                this.__APOInit := APOInitBaseStruct(0, this)
            return this.__APOInit
        }
    }

    /**
     * A pointer to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) object.
     * @type {IPropertyStore}
     */
    pAPOEndpointProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An [IServiceProvider](../servprov/nn-servprov-iserviceprovider.md) interface.
     * @type {IServiceProvider}
     */
    pServiceProvider {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an [IMMDeviceCollection](../mmdeviceapi/nn-mmdeviceapi-immdevicecollection.md) object. The last item in the *pDeviceCollection* is always the [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint.
     * @type {IMMDeviceCollection}
     */
    pDeviceCollection {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the **MMDevice** that implements the DeviceTopology that includes the software connector for which the APO is initializing. The **MMDevice** is contained in *pDeviceCollection*.
     * @type {Integer}
     */
    nSoftwareIoDeviceInCollection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the index of a **Software_IO** connector in the [DeviceTopology](../devicetopology/nn-devicetopology-idevicetopology.md).
     * @type {Integer}
     */
    nSoftwareIoConnectorIndex {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the processing mode for the audio graph.
     * @type {Pointer<Guid>}
     */
    AudioProcessingMode {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Indicates whether the audio system is initializing the APO for effects discovery only.
     * @type {BOOL}
     */
    InitializeForDiscoveryOnly {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}

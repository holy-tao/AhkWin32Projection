#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IMMDeviceCollection.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include .\APOInitBaseStruct.ahk

/**
 * The APOInitSystemEffects2 structure was introduced with Windows 8.1, to make it possible to provide additional initialization context to the audio processing object (APO) for initialization.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects2
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APOInitSystemEffects2 extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct">APOInitBaseStruct</a> structure.
     * @type {APOInitBaseStruct}
     */
    APOInit {
        get {
            if(!this.HasProp("__APOInit"))
                this.__APOInit := APOInitBaseStruct(0, this)
            return this.__APOInit
        }
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     * @type {IPropertyStore}
     */
    pAPOEndpointProperties {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     * @type {IPropertyStore}
     */
    pAPOSystemEffectsProperties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to an IMMDeviceCollection object. The last item in the *pDeviceCollection* is always the [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint.
     * @type {IMMDeviceCollection}
     */
    pDeviceCollection {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Specifies the MMDevice that implements the DeviceTopology that includes the software connector for which the APO is initializing. The MMDevice is contained in <i>pDeviceCollection</i>.
     * @type {Integer}
     */
    nSoftwareIoDeviceInCollection {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the index of a Software_IO connector in the DeviceTopology.
     * @type {Integer}
     */
    nSoftwareIoConnectorIndex {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the processing mode for the audio graph.
     * @type {Guid}
     */
    AudioProcessingMode {
        get {
            if(!this.HasProp("__AudioProcessingMode"))
                this.__AudioProcessingMode := Guid(64, this)
            return this.__AudioProcessingMode
        }
    }

    /**
     * Indicates whether the audio system is initializing the APO for effects discovery only.
     * @type {BOOL}
     */
    InitializeForDiscoveryOnly {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}

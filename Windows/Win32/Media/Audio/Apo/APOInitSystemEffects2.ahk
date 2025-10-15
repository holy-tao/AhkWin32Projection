#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitBaseStruct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * The APOInitSystemEffects2 structure was introduced with Windows 8.1, to make it possible to provide additional initialization context to the audio processing object (APO) for initialization.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects2
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APOInitSystemEffects2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitbasestruct">APOInitBaseStruct</a> structure.
     * @type {APOInitBaseStruct}
     */
    APOInit{
        get {
            if(!this.HasProp("__APOInit"))
                this.__APOInit := APOInitBaseStruct(this.ptr + 0)
            return this.__APOInit
        }
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     * @type {Pointer<IPropertyStore>}
     */
    pAPOEndpointProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     * @type {Pointer<IPropertyStore>}
     */
    pAPOSystemEffectsProperties {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to an IMMDeviceCollection object. The last item in the *pDeviceCollection* is always the [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint.
     * @type {Pointer<IMMDeviceCollection>}
     */
    pDeviceCollection {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the MMDevice that implements the DeviceTopology that includes the software connector for which the APO is initializing. The MMDevice is contained in <i>pDeviceCollection</i>.
     * @type {Integer}
     */
    nSoftwareIoDeviceInCollection {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies the index of a Software_IO connector in the DeviceTopology.
     * @type {Integer}
     */
    nSoftwareIoConnectorIndex {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Specifies the processing mode for the audio graph.
     * @type {Pointer<Guid>}
     */
    AudioProcessingMode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Indicates whether the audio system is initializing the APO for effects discovery only.
     * @type {BOOL}
     */
    InitializeForDiscoveryOnly{
        get {
            if(!this.HasProp("__InitializeForDiscoveryOnly"))
                this.__InitializeForDiscoveryOnly := BOOL(this.ptr + 64)
            return this.__InitializeForDiscoveryOnly
        }
    }
}

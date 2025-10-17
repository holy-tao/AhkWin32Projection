#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitBaseStruct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APOInitSystemEffects3 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
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
     * @type {Pointer<IPropertyStore>}
     */
    pAPOEndpointProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IServiceProvider>}
     */
    pServiceProvider {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<IMMDeviceCollection>}
     */
    pDeviceCollection {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    nSoftwareIoDeviceInCollection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    nSoftwareIoConnectorIndex {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Pointer<Guid>}
     */
    AudioProcessingMode {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    InitializeForDiscoveryOnly {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}

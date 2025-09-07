#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitBaseStruct.ahk

/**
 * The APOInitSystemEffects structure gets passed to the system effects APO for initialization.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APOInitSystemEffects extends Win32Struct
{
    static sizeof => 48

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
     * A pointer to an IMMDeviceCollection object.
     * @type {Pointer<IMMDeviceCollection>}
     */
    pDeviceCollection {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

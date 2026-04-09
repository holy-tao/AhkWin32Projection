#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitSystemEffects3.ahk
#Include .\APOInitBaseStruct.ahk
#Include ..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\..\System\Com\IServiceProvider.ahk
#Include ..\IMMDeviceCollection.ahk
#Include .\APO_REFERENCE_STREAM_PROPERTIES.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class AcousticEchoCanceller_Reference_Input extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {APOInitSystemEffects3}
     */
    apoInitSystemEffects {
        get {
            if(!this.HasProp("__apoInitSystemEffects"))
                this.__apoInitSystemEffects := APOInitSystemEffects3(0, this)
            return this.__apoInitSystemEffects
        }
    }

    /**
     * @type {APO_REFERENCE_STREAM_PROPERTIES}
     */
    streamProperties {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}

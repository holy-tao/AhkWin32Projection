#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APOInitBaseStruct.ahk
#Include .\APOInitSystemEffects3.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AcousticEchoCanceller_Reference_Input extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {APOInitSystemEffects3}
     */
    apoInitSystemEffects{
        get {
            if(!this.HasProp("__apoInitSystemEffects"))
                this.__apoInitSystemEffects := APOInitSystemEffects3(this.ptr + 0)
            return this.__apoInitSystemEffects
        }
    }

    /**
     * @type {Integer}
     */
    streamProperties {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}

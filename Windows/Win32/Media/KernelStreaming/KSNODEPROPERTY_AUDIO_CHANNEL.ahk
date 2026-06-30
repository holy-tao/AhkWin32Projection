#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSNODEPROPERTY.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSNODEPROPERTY_AUDIO_CHANNEL extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSNODEPROPERTY}
     */
    NodeProperty {
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSNODEPROPERTY(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    Channel {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}

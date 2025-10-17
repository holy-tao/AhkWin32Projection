#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSNODEPROPERTY.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSNODEPROPERTY_AUDIO_PROPERTY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSNODEPROPERTY}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSNODEPROPERTY(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    AppContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

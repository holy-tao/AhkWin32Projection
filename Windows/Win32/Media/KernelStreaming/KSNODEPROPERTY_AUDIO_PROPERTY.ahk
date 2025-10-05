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
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSNODEPROPERTY}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSNODEPROPERTY(this.ptr + 0)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    AppContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

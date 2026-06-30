#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSNODEPROPERTY.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @architecture X64, Arm64
 */
class KSNODEPROPERTY_AUDIO_PROPERTY extends Win32Struct {
    static sizeof => 48

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
     * @type {Pointer<Void>}
     */
    AppContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

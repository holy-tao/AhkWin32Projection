#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSWAVETABLE_WAVE_DESC extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Identifier {
        get {
            if(!this.HasProp("__Identifier"))
                this.__Identifier := KSIDENTIFIER(0, this)
            return this.__Identifier
        }
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    Looped {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    LoopPoint {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    InROM {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {KSDATAFORMAT}
     */
    Format {
        get {
            if(!this.HasProp("__Format"))
                this.__Format := KSDATAFORMAT(40, this)
            return this.__Format
        }
    }
}

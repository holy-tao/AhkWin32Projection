#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSWAVETABLE_WAVE_DESC extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Identifier{
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    Looped {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    LoopPoint {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    InROM {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {KSDATAFORMAT}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := KSDATAFORMAT(32, this)
            return this.__Format
        }
    }
}

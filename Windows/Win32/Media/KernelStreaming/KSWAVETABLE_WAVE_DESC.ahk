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
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Identifier{
        get {
            if(!this.HasProp("__Identifier"))
                this.__Identifier := KSIDENTIFIER(this.ptr + 0)
            return this.__Identifier
        }
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Looped {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    LoopPoint {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    InROM {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {KSDATAFORMAT}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := KSDATAFORMAT(this.ptr + 24)
            return this.__Format
        }
    }
}

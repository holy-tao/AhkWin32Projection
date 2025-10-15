#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\BOOL.ahk
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
                this.__Identifier := KSIDENTIFIER(this.ptr + 0)
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
    Looped{
        get {
            if(!this.HasProp("__Looped"))
                this.__Looped := BOOL(this.ptr + 20)
            return this.__Looped
        }
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
    InROM{
        get {
            if(!this.HasProp("__InROM"))
                this.__InROM := BOOL(this.ptr + 28)
            return this.__InROM
        }
    }

    /**
     * @type {KSDATAFORMAT}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := KSDATAFORMAT(this.ptr + 32)
            return this.__Format
        }
    }
}

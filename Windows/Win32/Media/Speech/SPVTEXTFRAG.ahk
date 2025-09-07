#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPVPITCH.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPVCONTEXT.ahk
#Include .\SPVSTATE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVTEXTFRAG extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<SPVTEXTFRAG>}
     */
    pNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SPVSTATE}
     */
    State{
        get {
            if(!this.HasProp("__State"))
                this.__State := SPVSTATE(this.ptr + 8)
            return this.__State
        }
    }

    /**
     * @type {PWSTR}
     */
    pTextStart{
        get {
            if(!this.HasProp("__pTextStart"))
                this.__pTextStart := PWSTR(this.ptr + 88)
            return this.__pTextStart
        }
    }

    /**
     * @type {Integer}
     */
    ulTextLen {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ulTextSrcOffset {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}

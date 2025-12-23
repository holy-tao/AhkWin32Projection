#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPVPITCH.ahk
#Include .\SPVCONTEXT.ahk
#Include .\SPVSTATE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVTEXTFRAG extends Win32Struct
{
    static sizeof => 96

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
                this.__State := SPVSTATE(8, this)
            return this.__State
        }
    }

    /**
     * @type {PWSTR}
     */
    pTextStart {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ulTextLen {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ulTextSrcOffset {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}

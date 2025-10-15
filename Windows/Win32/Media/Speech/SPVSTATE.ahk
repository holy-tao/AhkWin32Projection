#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPVPITCH.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPVCONTEXT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVSTATE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    eAction {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LangID {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    EmphAdj {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RateAdj {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Volume {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {SPVPITCH}
     */
    PitchAdj{
        get {
            if(!this.HasProp("__PitchAdj"))
                this.__PitchAdj := SPVPITCH(this.ptr + 24)
            return this.__PitchAdj
        }
    }

    /**
     * @type {Integer}
     */
    SilenceMSecs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pPhoneIds {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ePartOfSpeech {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {SPVCONTEXT}
     */
    Context{
        get {
            if(!this.HasProp("__Context"))
                this.__Context := SPVCONTEXT(this.ptr + 56)
            return this.__Context
        }
    }
}

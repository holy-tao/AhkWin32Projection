#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPRULEHANDLE.ahk
#Include .\SPSTATEHANDLE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRULEENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {SPRULEHANDLE}
     */
    hRule{
        get {
            if(!this.HasProp("__hRule"))
                this.__hRule := SPRULEHANDLE(this.ptr + 0)
            return this.__hRule
        }
    }

    /**
     * @type {SPSTATEHANDLE}
     */
    hInitialState{
        get {
            if(!this.HasProp("__hInitialState"))
                this.__hInitialState := SPSTATEHANDLE(this.ptr + 8)
            return this.__hInitialState
        }
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvClientRuleContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvClientGrammarContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

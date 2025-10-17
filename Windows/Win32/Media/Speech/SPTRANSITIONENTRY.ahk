#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPTRANSITIONID.ahk
#Include .\SPSTATEHANDLE.ahk
#Include .\SPRULEHANDLE.ahk
#Include .\SPWORDHANDLE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPTRANSITIONENTRY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {SPTRANSITIONID}
     */
    ID{
        get {
            if(!this.HasProp("__ID"))
                this.__ID := SPTRANSITIONID(0, this)
            return this.__ID
        }
    }

    /**
     * @type {SPSTATEHANDLE}
     */
    hNextState{
        get {
            if(!this.HasProp("__hNextState"))
                this.__hNextState := SPSTATEHANDLE(8, this)
            return this.__hNextState
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RequiredConfidence {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    fHasProperty {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Float}
     */
    Weight {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {SPSTATEHANDLE}
     */
    hRuleInitialState{
        get {
            if(!this.HasProp("__hRuleInitialState"))
                this.__hRuleInitialState := SPSTATEHANDLE(32, this)
            return this.__hRuleInitialState
        }
    }

    /**
     * @type {SPRULEHANDLE}
     */
    hRule{
        get {
            if(!this.HasProp("__hRule"))
                this.__hRule := SPRULEHANDLE(40, this)
            return this.__hRule
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pvClientRuleContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {SPWORDHANDLE}
     */
    hWord{
        get {
            if(!this.HasProp("__hWord"))
                this.__hWord := SPWORDHANDLE(32, this)
            return this.__hWord
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pvClientWordContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvGrammarCookie {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

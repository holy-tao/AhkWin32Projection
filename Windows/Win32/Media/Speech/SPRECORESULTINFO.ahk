#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\SPGRAMMARHANDLE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECORESULTINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eResultType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    fHypothesis{
        get {
            if(!this.HasProp("__fHypothesis"))
                this.__fHypothesis := BOOL(this.ptr + 8)
            return this.__fHypothesis
        }
    }

    /**
     * @type {BOOL}
     */
    fProprietaryAutoPause{
        get {
            if(!this.HasProp("__fProprietaryAutoPause"))
                this.__fProprietaryAutoPause := BOOL(this.ptr + 12)
            return this.__fProprietaryAutoPause
        }
    }

    /**
     * @type {Integer}
     */
    ullStreamPosStart {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ullStreamPosEnd {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {SPGRAMMARHANDLE}
     */
    hGrammar{
        get {
            if(!this.HasProp("__hGrammar"))
                this.__hGrammar := SPGRAMMARHANDLE(this.ptr + 32)
            return this.__hGrammar
        }
    }

    /**
     * @type {Integer}
     */
    ulSizeEngineData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvEngineData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<ISpPhraseBuilder>}
     */
    pPhrase {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<SPPHRASEALT>}
     */
    aPhraseAlts {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ulNumAlts {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 80
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPPATHENTRY.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SPRULEHANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPARSEINFO extends Win32Struct {
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
     * @type {SPRULEHANDLE}
     */
    hRule {
        get {
            if(!this.HasProp("__hRule"))
                this.__hRule := SPRULEHANDLE(8, this)
            return this.__hRule
        }
    }

    /**
     * @type {Integer}
     */
    ullAudioStreamPosition {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulAudioSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cTransitions {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<SPPATHENTRY>}
     */
    pPath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Guid}
     */
    SREngineID {
        get {
            if(!this.HasProp("__SREngineID"))
                this.__SREngineID := Guid(40, this)
            return this.__SREngineID
        }
    }

    /**
     * @type {Integer}
     */
    ulSREnginePrivateDataSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pSREnginePrivateData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {BOOL}
     */
    fHypothesis {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 80
    }
}

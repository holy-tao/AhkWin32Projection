#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPPHRASEREPLACEMENT.ahk
#Include .\SPPHRASERULE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SPPHRASEELEMENT.ahk
#Include .\SPPHRASEPROPERTY.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPHRASE_50 extends Win32Struct {
    static sizeof => 160

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
    LangID {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wHomophoneGroupId {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ullGrammarID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ftStartTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ullAudioStreamPosition {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulAudioSizeBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulRetainedSizeBytes {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ulAudioSizeTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {SPPHRASERULE}
     */
    Rule {
        get {
            if(!this.HasProp("__Rule"))
                this.__Rule := SPPHRASERULE(48, this)
            return this.__Rule
        }
    }

    /**
     * @type {Pointer<SPPHRASEPROPERTY>}
     */
    pProperties {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<SPPHRASEELEMENT>}
     */
    pElements {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    cReplacements {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Pointer<SPPHRASEREPLACEMENT>}
     */
    pReplacements {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Guid}
     */
    SREngineID {
        get {
            if(!this.HasProp("__SREngineID"))
                this.__SREngineID := Guid(128, this)
            return this.__SREngineID
        }
    }

    /**
     * @type {Integer}
     */
    ulSREnginePrivateDataSize {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pSREnginePrivateData {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 160
    }
}

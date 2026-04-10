#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPAUDIOSTATUS.ahk
#Include .\SPAUDIOSTATE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPRECOGNIZERSTATUS extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {SPAUDIOSTATUS}
     */
    AudioStatus {
        get {
            if(!this.HasProp("__AudioStatus"))
                this.__AudioStatus := SPAUDIOSTATUS(0, this)
            return this.__AudioStatus
        }
    }

    /**
     * @type {Integer}
     */
    ullRecognitionStreamPos {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulStreamNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ulNumActive {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer}
     */
    clsidEngine {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    cLangIDs {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Array<Integer>}
     */
    aLangID {
        get {
            if(!this.HasProp("__aLangIDProxyArray"))
                this.__aLangIDProxyArray := Win32FixedArray(this.ptr + 68, 20, Primitive, "ushort")
            return this.__aLangIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ullRecognitionStreamTime {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}

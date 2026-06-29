#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SPAUDIOSTATUS.ahk
#Include .\SPAUDIOSTATE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPRECOGNIZERSTATUS extends Win32Struct {
    static sizeof => 128

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
     * @type {Guid}
     */
    clsidEngine {
        get {
            if(!this.HasProp("__clsidEngine"))
                this.__clsidEngine := Guid(56, this)
            return this.__clsidEngine
        }
    }

    /**
     * @type {Integer}
     */
    cLangIDs {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Array<Integer>}
     */
    aLangID {
        get {
            if(!this.HasProp("__aLangIDProxyArray"))
                this.__aLangIDProxyArray := Win32FixedArray(this.ptr + 76, 20, Primitive, "ushort")
            return this.__aLangIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ullRecognitionStreamTime {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }
}

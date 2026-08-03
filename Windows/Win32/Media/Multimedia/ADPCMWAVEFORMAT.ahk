#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\ADPCMCOEFSET.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
class ADPCMWAVEFORMAT extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {WAVEFORMATEX}
     */
    wfx {
        get {
            if(!this.HasProp("__wfx"))
                this.__wfx := WAVEFORMATEX(0, this)
            return this.__wfx
        }
    }

    /**
     * @type {Integer}
     */
    wSamplesPerBlock {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wNumCoef {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {ADPCMCOEFSET}
     */
    aCoef {
        get {
            if(!this.HasProp("__aCoefProxyArray"))
                this.__aCoefProxyArray := Win32FixedArray(this.ptr + 24, 1, ADPCMCOEFSET, "")
            return this.__aCoefProxyArray
        }
    }
}

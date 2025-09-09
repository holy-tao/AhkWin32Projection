#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\ADPCMCOEFSET.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ADPCMWAVEFORMAT extends Win32Struct
{
    static sizeof => 30

    static packingSize => 1

    /**
     * @type {WAVEFORMATEX}
     */
    wfx{
        get {
            if(!this.HasProp("__wfx"))
                this.__wfx := WAVEFORMATEX(this.ptr + 0)
            return this.__wfx
        }
    }

    /**
     * @type {Integer}
     */
    wSamplesPerBlock {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    wNumCoef {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Array<ADPCMCOEFSET>}
     */
    aCoef{
        get {
            if(!this.HasProp("__aCoefProxyArray"))
                this.__aCoefProxyArray := Win32FixedArray(this.ptr + 22, 1, ADPCMCOEFSET, "")
            return this.__aCoefProxyArray
        }
    }
}

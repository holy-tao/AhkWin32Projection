#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class WMAUDIO2WAVEFORMAT extends Win32Struct
{
    static sizeof => 28

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
    dwSamplesPerBlock {
        get => NumGet(this, 18, "uint")
        set => NumPut("uint", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    wEncodeOptions {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    dwSuperBlockAlign {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

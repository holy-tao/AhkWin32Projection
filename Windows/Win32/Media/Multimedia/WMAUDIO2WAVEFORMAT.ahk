#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class WMAUDIO2WAVEFORMAT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {WAVEFORMATEX}
     */
    wfx{
        get {
            if(!this.HasProp("__wfx"))
                this.__wfx := WAVEFORMATEX(0, this)
            return this.__wfx
        }
    }

    /**
     * @type {Integer}
     */
    dwSamplesPerBlock {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wEncodeOptions {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwSuperBlockAlign {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class DRMWAVEFORMAT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

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
    wReserved {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ulContentId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {WAVEFORMATEX}
     */
    wfxSecure{
        get {
            if(!this.HasProp("__wfxSecure"))
                this.__wfxSecure := WAVEFORMATEX(this.ptr + 32)
            return this.__wfxSecure
        }
    }
}

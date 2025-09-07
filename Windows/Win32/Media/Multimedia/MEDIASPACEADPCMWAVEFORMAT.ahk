#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MEDIASPACEADPCMWAVEFORMAT extends Win32Struct
{
    static sizeof => 20

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
    wRevision {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}

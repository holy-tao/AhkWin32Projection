#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class APTXWAVEFORMAT extends Win32Struct
{
    static sizeof => 24

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
}

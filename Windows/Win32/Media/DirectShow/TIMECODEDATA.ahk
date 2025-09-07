#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\TIMECODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class TIMECODEDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 2

    /**
     * @type {TIMECODE}
     */
    time{
        get {
            if(!this.HasProp("__time"))
                this.__time := TIMECODE(this.ptr + 0)
            return this.__time
        }
    }

    /**
     * @type {Integer}
     */
    dwSMPTEflags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwUser {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DCISURFACEINFO.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DCIOFFSCREEN extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {DCISURFACEINFO}
     */
    dciInfo{
        get {
            if(!this.HasProp("__dciInfo"))
                this.__dciInfo := DCISURFACEINFO(0, this)
            return this.__dciInfo
        }
    }

    /**
     * @type {Pointer}
     */
    Draw {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    SetClipList {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    SetDestination {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}

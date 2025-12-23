#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPROPSTRING extends Win32Struct
{
    static sizeof => 536

    static packingSize => 4

    /**
     * @type {DIPROPHEADER}
     */
    diph{
        get {
            if(!this.HasProp("__diph"))
                this.__diph := DIPROPHEADER(0, this)
            return this.__diph
        }
    }

    /**
     * @type {String}
     */
    wsz {
        get => StrGet(this.ptr + 16, 259, "UTF-16")
        set => StrPut(value, this.ptr + 16, 259, "UTF-16")
    }
}

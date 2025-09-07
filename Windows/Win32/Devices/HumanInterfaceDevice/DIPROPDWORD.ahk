#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPROPDWORD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {DIPROPHEADER}
     */
    diph{
        get {
            if(!this.HasProp("__diph"))
                this.__diph := DIPROPHEADER(this.ptr + 0)
            return this.__diph
        }
    }

    /**
     * @type {Integer}
     */
    dwData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

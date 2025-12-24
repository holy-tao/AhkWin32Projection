#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPROPCAL extends Win32Struct
{
    static sizeof => 28

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
     * @type {Integer}
     */
    lMin {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lCenter {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    lMax {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}

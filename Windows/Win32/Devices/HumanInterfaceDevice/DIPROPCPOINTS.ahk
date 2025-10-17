#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk
#Include .\CPOINT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPROPCPOINTS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

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
    dwCPointsNum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<CPOINT>}
     */
    cp{
        get {
            if(!this.HasProp("__cpProxyArray"))
                this.__cpProxyArray := Win32FixedArray(this.ptr + 24, 8, CPOINT, "")
            return this.__cpProxyArray
        }
    }
}

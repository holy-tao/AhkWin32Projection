#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPROPCALPOV extends Win32Struct
{
    static sizeof => 56

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
     * @type {Array<Int32>}
     */
    lMin{
        get {
            if(!this.HasProp("__lMinProxyArray"))
                this.__lMinProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "int")
            return this.__lMinProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    lMax{
        get {
            if(!this.HasProp("__lMaxProxyArray"))
                this.__lMaxProxyArray := Win32FixedArray(this.ptr + 36, 4, Primitive, "int")
            return this.__lMaxProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIPOVCALIBRATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Array<Int32>}
     */
    lMin{
        get {
            if(!this.HasProp("__lMinProxyArray"))
                this.__lMinProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "int")
            return this.__lMinProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    lMax{
        get {
            if(!this.HasProp("__lMaxProxyArray"))
                this.__lMaxProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "int")
            return this.__lMaxProxyArray
        }
    }
}

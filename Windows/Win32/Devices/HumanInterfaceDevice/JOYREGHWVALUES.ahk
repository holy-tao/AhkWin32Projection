#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk

/**
 * The JOYREGHWVALUES structure contains the range of values returned by the hardware (filled in by calibration).
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-joyreghwvalues
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class JOYREGHWVALUES extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The values returned by the hardware.
     * @type {JOYRANGE}
     */
    jrvHardware{
        get {
            if(!this.HasProp("__jrvHardware"))
                this.__jrvHardware := JOYRANGE(this.ptr + 0)
            return this.__jrvHardware
        }
    }

    /**
     * The point-of-view (POV) values returned by the hardware.
     * @type {Array<UInt32>}
     */
    dwPOVValues{
        get {
            if(!this.HasProp("__dwPOVValuesProxyArray"))
                this.__dwPOVValuesProxyArray := Win32FixedArray(this.ptr + 72, 4, Primitive, "uint")
            return this.__dwPOVValuesProxyArray
        }
    }

    /**
     * What has been calibrated.
     * @type {Integer}
     */
    dwCalFlags {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYPOS.ahk

/**
 * The JOYREGHWVALUES (dinputd.h) structure contains the range of values returned by the hardware (filled in by calibration).
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-joyreghwvalues
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class JOYREGHWVALUES extends Win32Struct {
    static sizeof => 92

    static packingSize => 4

    /**
     * The values returned by the hardware.
     * @type {JOYRANGE}
     */
    jrvHardware {
        get {
            if(!this.HasProp("__jrvHardware"))
                this.__jrvHardware := JOYRANGE(0, this)
            return this.__jrvHardware
        }
    }

    /**
     * The point-of-view (POV) values returned by the hardware.
     * @type {Array<Integer>}
     */
    dwPOVValues {
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

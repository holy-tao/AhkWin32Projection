#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIFFDEVICEATTRIBUTES structure describes the information contained in the &quot;Attributes&quot; value of the OEMForceFeedback registry key.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diffdeviceattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIFFDEVICEATTRIBUTES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Reserved for future use. This member must be set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the minimum time between playback of force commands, in microseconds.
     * @type {Integer}
     */
    dwFFSamplePeriod {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the minimum amount of time that the device can resolve, in microseconds. The device rounds any time values to the nearest supported increment. For example, if the value of <b>dwFFMinTimeResolution</b> is 1000, then the device would round any times to the nearest millisecond.
     * @type {Integer}
     */
    dwFFMinTimeResolution {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

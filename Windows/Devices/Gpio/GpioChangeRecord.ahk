#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Stores a relative timestap of a general-purpose I/O (GPIO) pin value change, and whether the pin transitioned from low to high or from high to low.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangerecord
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioChangeRecord extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A relative timestamp that can be used to determine the difference in time between two change records. This timestamp does not correspond to any absolute or system time.
     * @type {Pointer<TimeSpan>}
     */
    RelativeTime {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A [GpioPinEdge](gpiopinedge.md) object corresponding to the transition type.
     * @type {Integer}
     */
    Edge {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

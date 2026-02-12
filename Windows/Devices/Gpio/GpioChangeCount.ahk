#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents a near-simultaneous sampling of the number of times a pin has changed value, and the time at which this count was sampled. This structure can be used to determine the number of pin value changes over a period of time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecount
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioChangeCount extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of times the transition of polarity specified by [GpioChangeCounter.Polarity](gpiochangecounter_polarity.md) occurred on the pin.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time at which this count was sampled. The time is sampled close to (but not simultaneously with) the count. This timestamp can be used to determine the elapsed time between two GpioChangeCount records. It does not correspond to any absolute or system time.
     * @type {Pointer<TimeSpan>}
     */
    RelativeTime {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

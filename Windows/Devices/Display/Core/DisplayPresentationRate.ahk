#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an overall presentation rate composed of a rational refresh rate and a divider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypresentationrate
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPresentationRate extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The refresh rate, also known as vertical sync rate, which controls how often the display pipeline scans out to a target. This rate is represented in Hertz (Hz) and stored as a two-part rational number.
     * @type {Pointer<Rational>}
     */
    VerticalSyncRate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies an integer divider to scale down the rate of full-screen presentations as a fraction of vertical syncs. For example, if **VerticalSyncsPerPresentation** is set to 2, then one full-screen presentation will last for 2 vertical syncs before the next presentation can occur. Support for values other than 1 requires hardware support.
     * @type {Integer}
     */
    VerticalSyncsPerPresentation {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

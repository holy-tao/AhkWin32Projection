#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the options that modify the brightness level of the screen during the override session. When __UseDimmedPolicyWhenBatteryIsLow__ is set, it reduces the specified override brightness level in order to conserve battery if the device
  * battery is low during the override session. For example, if the override brightness level is set to 100% and __UseDimmedPolicyWhenBatteryIsLow__ is set, the screen will dim to 70% instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displaybrightnessoverrideoptions
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayBrightnessOverrideOptions extends Win32BitflagEnum{

    /**
     * Screen display stays at the specified override brightness level when the device battery is low.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Screen display dims when the device battery is low and a brightness override session is running.
     * @type {Integer (UInt32)}
     */
    static UseDimmedPolicyWhenBatteryIsLow => 1
}

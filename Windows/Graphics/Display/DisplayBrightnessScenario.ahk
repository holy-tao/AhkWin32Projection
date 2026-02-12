#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes common brightness scenarios that have well-known brightness levels. These scenarios are used in the [GetLevelForScenario()](brightnessoverride_getlevelforscenario_599977480.md) and [SetBrightnessScenario()](brightnessoverride_setbrightnessscenario_1995700297.md) methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displaybrightnessscenario
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayBrightnessScenario extends Win32Enum{

    /**
     * Sets the screen to the current screen brightness, essentially freezing the brightness.
     * @type {Integer (Int32)}
     */
    static DefaultBrightness => 0

    /**
     * Sets the screen to a battery friendly yet readable brightness level. This is currently set to 10% brightness.
     * @type {Integer (Int32)}
     */
    static IdleBrightness => 1

    /**
     * Sets the screen to the brightness level that it is easily readable by barcode readers. This is currently set to 100% brightness.
     * @type {Integer (Int32)}
     */
    static BarcodeReadingBrightness => 2

    /**
     * Sets the screen to 100% brightness.
     * @type {Integer (Int32)}
     */
    static FullBrightness => 3
}

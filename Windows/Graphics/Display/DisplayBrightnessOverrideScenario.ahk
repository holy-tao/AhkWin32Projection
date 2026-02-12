#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the brightness scenarios that a [BrightnessOverrideSettings](brightnessoverridesettings.md) object can request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displaybrightnessoverridescenario
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayBrightnessOverrideScenario extends Win32Enum{

    /**
     * Indicates that a brightness level to be used when the app is idle.
     * @type {Integer (Int32)}
     */
    static IdleBrightness => 0

    /**
     * Indicates that a brightness level which is barcode reader friendly is wanted.
     * @type {Integer (Int32)}
     */
    static BarcodeReadingBrightness => 1

    /**
     * Indicates that a brightness level of 100% is wanted.
     * @type {Integer (Int32)}
     */
    static FullBrightness => 2
}

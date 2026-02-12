#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the color scenarios that a [ColorOverrideSettings](coloroverridesettings.md) object can request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displaycoloroverridescenario
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayColorOverrideScenario extends Win32Enum{

    /**
     * Indicates that colorimetrically accurate display color is wanted. In addition to disabling inbox white point adaptation (such as Night Light), color enhancements that deviate from a standardized colorspace, such as contract and saturation adjustments will be disabled on a best effort basis.
     * @type {Integer (Int32)}
     */
    static Accurate => 0
}

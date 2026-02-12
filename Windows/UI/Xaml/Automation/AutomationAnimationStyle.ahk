#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the style of animation for the automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationanimationstyle
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationAnimationStyle extends Win32Enum{

    /**
     * No animation.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Las Vegas lights style animation.
     * @type {Integer (Int32)}
     */
    static LasVegasLights => 1

    /**
     * Blinking background animation.
     * @type {Integer (Int32)}
     */
    static BlinkingBackground => 2

    /**
     * Sparkling text animation.
     * @type {Integer (Int32)}
     */
    static SparkleText => 3

    /**
     * Marching black ants animation.
     * @type {Integer (Int32)}
     */
    static MarchingBlackAnts => 4

    /**
     * Marching red ants animation.
     * @type {Integer (Int32)}
     */
    static MarchingRedAnts => 5

    /**
     * Shimmer style animation.
     * @type {Integer (Int32)}
     */
    static Shimmer => 6

    /**
     * Other animation.
     * @type {Integer (Int32)}
     */
    static Other => 7
}

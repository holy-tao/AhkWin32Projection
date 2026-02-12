#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the style of bullets used by the automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationbulletstyle
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationBulletStyle extends Win32Enum{

    /**
     * No bullets.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Hollow round bullets.
     * @type {Integer (Int32)}
     */
    static HollowRoundBullet => 1

    /**
     * Filled round bullets.
     * @type {Integer (Int32)}
     */
    static FilledRoundBullet => 2

    /**
     * Hollow square bullets.
     * @type {Integer (Int32)}
     */
    static HollowSquareBullet => 3

    /**
     * Filled square bullets.
     * @type {Integer (Int32)}
     */
    static FilledSquareBullet => 4

    /**
     * Dashed bullets.
     * @type {Integer (Int32)}
     */
    static DashBullet => 5

    /**
     * Other style of bullets.
     * @type {Integer (Int32)}
     */
    static Other => 6
}

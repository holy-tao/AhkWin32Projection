#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the heading levels for UI Automation elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationheadinglevel
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationHeadingLevel extends Win32Enum{

    /**
     * Not a heading.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Heading level 1.
     * @type {Integer (Int32)}
     */
    static Level1 => 1

    /**
     * Heading level 2.
     * @type {Integer (Int32)}
     */
    static Level2 => 2

    /**
     * Heading level 3.
     * @type {Integer (Int32)}
     */
    static Level3 => 3

    /**
     * Heading level 4.
     * @type {Integer (Int32)}
     */
    static Level4 => 4

    /**
     * Heading level 5.
     * @type {Integer (Int32)}
     */
    static Level5 => 5

    /**
     * Heading level 6.
     * @type {Integer (Int32)}
     */
    static Level6 => 6

    /**
     * Heading level 7.
     * @type {Integer (Int32)}
     */
    static Level7 => 7

    /**
     * Heading level 8.
     * @type {Integer (Int32)}
     */
    static Level8 => 8

    /**
     * Heading level 9.
     * @type {Integer (Int32)}
     */
    static Level9 => 9
}
